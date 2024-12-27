<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::where('user_id', Auth::id())->with('orderItems.food')->get();
        return response()->json($orders);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'items' => 'required|array',
            'items.*.food_id' => 'required|exists:foods,id',
            'items.*.quantity' => 'required|integer|min:1',
        ]);

        $totalPrice = collect($data['items'])->reduce(function ($total, $item) {
            $foodPrice = $item['quantity'] * \App\Models\Food::find($item['food_id'])->price;
            return $total + $foodPrice;
        }, 0);

        $order = Order::create([
            'user_id' => Auth::id(),
            'total_price' => $totalPrice,
            'status' => 'Pending',
        ]);

        foreach ($data['items'] as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'food_id' => $item['food_id'],
                'quantity' => $item['quantity'],
            ]);
        }

        return response()->json(['message' => 'Order placed successfully', 'order' => $order], 201);
    }

    public function history()
    {
        $orders = Order::where('user_id', Auth::id())->with('orderItems.food')->get();
        return response()->json($orders);
    }
}

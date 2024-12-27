<?php

namespace App\Http\Controllers;

use App\Models\Foods;
use Illuminate\Http\Request;

class FoodController extends Controller
{
    public function index()
    {
        return Foods::paginate(10);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'image' => 'nullable|string',
        ]);

        $food = Foods::create($data);

        return response()->json(['message' => 'Food added successfully', 'food' => $food]);
    }

    public function update(Request $request, $id)
    {
        $food = Foods::findOrFail($id);
        $food->update($request->all());

        return response()->json(['message' => 'Food updated successfully', 'food' => $food]);
    }

    public function destroy($id)
    {
        Foods::destroy($id);

        return response()->json(['message' => 'Food deleted successfully']);
    }
}

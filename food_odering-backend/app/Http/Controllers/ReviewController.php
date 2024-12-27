<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function index($foodId)
    {
        $reviews = Review::where('food_id', $foodId)->with('user')->get();
        return response()->json($reviews);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'food_id' => 'required|exists:foods,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);

        $review = Review::create([
            'food_id' => $data['food_id'],
            'user_id' => Auth::id(),
            'rating' => $data['rating'],
            'comment' => $data['comment'],
        ]);

        return response()->json(['message' => 'Review added successfully', 'review' => $review]);
    }
}

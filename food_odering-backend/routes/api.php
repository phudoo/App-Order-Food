<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ProductController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', [AuthController::class, 'login']);
    Route::get('profile', [AuthController::class, 'profile']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    
Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
Route::post('/products', [ProductController::class, 'store'])->name(name: 'products.store')->middleware('log.product.actions');
Route::get('/products/{id}/edit', [ProductController::class, 'edit'])->name('products.edit');
Route::put('/products/{id}', [ProductController::class, 'update'])->name('products.update')->middleware('log.product.actions');
Route::delete('/products/{id}', [ProductController::class, 'destroy'])->name('products.destroy')->middleware('log.product.actions');

Route::post('register', [AuthController::class, 'register']);



    Route::get('user', [AuthController::class, 'profile']);
    Route::put('user', [AuthController::class, 'updateProfile']);

    Route::get('foods', [FoodController::class, 'index']);
    Route::post('foods', [FoodController::class, 'store']); // Admin
    Route::put('foods/{id}', [FoodController::class, 'update']); // Admin
    Route::delete('foods/{id}', [FoodController::class, 'destroy']); // Admin

    Route::post('orders', [OrderController::class, 'store']);
    Route::get('orders', [OrderController::class, 'index']);
    Route::get('orders/history', [OrderController::class, 'history']);

    Route::post('reviews', [ReviewController::class, 'store']);
    Route::get('foods/{id}/reviews', [ReviewController::class, 'index']);

    Route::get('users', [AdminController::class, 'index']); // Admin
    Route::delete('users/{id}', [AdminController::class, 'destroy']); // Admin
});


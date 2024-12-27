<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LogProductActions
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Xác định loại hành động và ghi log trước khi xử lý request
        if ($request->isMethod('post') && $request->routeIs(patterns: 'products.store')) {
            Log::info('Sản phẩm được thêm', ['user_id' => $request->user()->id ?? 'guest', 'data' => $request->all()]);
        } elseif ($request->isMethod('put') && $request->routeIs('products.update')) {
            Log::info('Sản phẩm được cập nhật', ['user_id' => $request->user()->id ?? 'guest', 'product_id' => $request->route('id'), 'data' => $request->all()]);
        } elseif ($request->isMethod('delete') && $request->routeIs('products.destroy')) {
            Log::info('Sản phẩm đã bị xoá', ['user_id' => $request->user()->id ?? 'guest', 'product_id' => $request->route('id')]);
        }
    
        return $next($request);
    }
    
}

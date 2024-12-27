<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    // Hiển thị danh sách sản phẩm
    public function index(Request $request)
    {
        $products = Product::all();

        // Kiểm tra nếu yêu cầu là từ API thì trả về JSON
        if ($request->wantsJson()) {
            return response()->json($products);
        }

        // Nếu không phải API, trả về view
        return view('products.index', compact('products'));
    }

    // Hiển thị form tạo sản phẩm
    public function create(Request $request)
    {
        if ($request->wantsJson()) {
            return response()->json(['message' => 'API không hỗ trợ ']);
        }

        return view('products.create');
    }

    // Lưu sản phẩm mới
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
        ]);

        $product = Product::create($request->all());

        // Trả về JSON nếu là API
        if ($request->wantsJson()) {
            return response()->json(['message' => 'Sản phẩm đã được thêm thành công.', 'product' => $product], 201);
        }

        // Chuyển hướng nếu là Web
        return redirect()->route('products.index')->with('success', 'Đã thêm sản phẩm thành công.');
    }

    // Hiển thị form chỉnh sửa sản phẩm
    public function edit(Request $request, $id)
    {
        $product = Product::find($id);

        if ($request->wantsJson()) {
            return response()->json($product);
        }

        return view('products.edit', compact('product'));
    }

    // Cập nhật sản phẩm
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
        ]);

        $product = Product::find($id);
        $product->update($request->all());

        if ($request->wantsJson()) {
            return response()->json(['message' => 'Sản phẩm đã được cập nhật thành công.', 'product' => $product]);
        }

        return redirect()->route('products.index')->with('success', 'Cập nhật sản phẩm thành công.');
    }

    // Xóa sản phẩm
    public function destroy(Request $request, $id)
    {
        Product::find($id)->delete();

        if ($request->wantsJson()) {
            return response()->json(['message' => 'Sản phẩm đã được xóa thành công.'], 204);
        }

        return redirect()->route('products.index')->with('success', 'Xóa sản phẩm thành công.');
    }
}

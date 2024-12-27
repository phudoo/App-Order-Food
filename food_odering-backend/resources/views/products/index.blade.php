<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link rel="stylesheet" href="{{ asset('css/trangsp.css') }}">
    <script src="{{ asset('js/kiemtratoken.js') }}"></script>
</head>
<body>
    <h1>Product Management</h1>
    <a href="{{ route('products.create') }}" class="btn">Add Product</a>
    <button id="logoutButton" class="btn logout-btn">Logout</button>
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
                <tr>
                    <td>{{ $product->name }}</td>
                    <td>{{ $product->price }}</td>
                    <td>
                        <a href="{{ route('products.edit', $product->id) }}" class="btn">Edit</a>
                        <form action="{{ route('products.destroy', $product->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <script src="{{ asset('js/dangxuat.js') }}"></script> <!-- Gọi file dangxuat.js -->
</body>
</html>




































































<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="{{ asset('css/formgd.css') }}">
    <script src="{{ asset('js/kiemtratoken.js') }}"></script> <!-- Kiểm tra token -->
</head>
<body>
<h1>Add Product</h1>
<form action="{{ route('products.store') }}" method="POST" id="addForm">
    <label for="name">Product Name:</label>
    <input type="text" name="name" required>

    <label for="price">Price:</label>
    <input type="number" name="price" required>

    <button type="submit" class="btn">Add Product</button>
</form>
<a href="{{ route('products.index') }}" class="btn">Back to Product List</a>

</body>
</html>
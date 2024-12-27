<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Foods;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
      
        // Seed Foods
        Foods::create([
            'name' => 'Pizza Margherita',
            'description' => 'Classic Italian pizza with tomatoes and mozzarella.',
            'price' => 10.99,
            'image' => 'https://via.placeholder.com/150'
        ]);

        Foods::create([
            'name' => 'Burger',
            'description' => 'Juicy beef burger with lettuce and cheese.',
            'price' => 8.99,
            'image' => 'https://via.placeholder.com/150'
        ]);

        Foods::create([
            'name' => 'Pizza Margherita',
            'description' => 'Classic Italian pizza with tomatoes and mozzarella.',
            'price' => 10.99,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
        Foods::create([
            'name' => 'Burger',
            'description' => 'Juicy beef burger with lettuce, cheese, and special sauce.',
            'price' => 8.99,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
        Foods::create([
            'name' => 'Sushi Platter',
            'description' => 'An assortment of fresh sushi, including tuna, salmon, and avocado rolls.',
            'price' => 15.99,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
        Foods::create([
            'name' => 'Spaghetti Carbonara',
            'description' => 'Classic Italian pasta with creamy sauce, pancetta, and Parmesan cheese.',
            'price' => 12.99,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
        Foods::create([
            'name' => 'Caesar Salad',
            'description' => 'Fresh romaine lettuce, croutons, Parmesan, and Caesar dressing.',
            'price' => 7.99,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
        Foods::create([
            'name' => 'Grilled Chicken',
            'description' => 'Marinated chicken breast grilled to perfection with vegetables.',
            'price' => 13.49,
            'image' => 'https://via.placeholder.com/150',
        ]);
        
    }
}


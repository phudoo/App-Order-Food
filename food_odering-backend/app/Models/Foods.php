<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Foods extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description', 'price', 'image'];

    // Quan hệ với Reviews
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    // Quan hệ với Order Items
    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }
}

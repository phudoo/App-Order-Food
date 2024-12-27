<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run()
    {
        $user = new User();
        $user->name = 'User 1';
        $user->email = 'user1@gmail.com';
        $user->password = Hash::make('123456');
        $user->save();
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', options: ['except' => ['login']]);
    }

    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth('api')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
        
    }


    public function profile()
    {
        return response()->json(auth()->user());
    }


    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Đăng xuất thành công']);
    }


    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }
}

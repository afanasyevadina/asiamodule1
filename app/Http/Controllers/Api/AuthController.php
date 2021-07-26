<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'login' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);
        if($validator->fails()) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => collect($validator->errors())->map(function($item) {
                        return $item[0];
                    }),
                ],
            ])->setStatusCode(422);
        }
        $user = User::where('login', $request->login)->first();
        if(!$user || !\Hash::check($request->password, $user->password)) {
            return response()->json([
                'error' => [
                    'code' => 401,
                    'message' => 'Unauthorized',
                    'errors' => [
                        'login' => 'Invalid credentials',
                    ],
                ],
            ])->setStatusCode(401);
        }
        return response()->json([
            'data' => [
                'full_name' => $user->full_name,
                'token' => $user->generateToken(),
            ],
        ]);
    }

    public function register(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'login' => ['required', 'string', 'unique:users'],
            'full_name' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);
        if($validator->fails()) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => collect($validator->errors())->map(function($item) {
                        return $item[0];
                    }),
                ],
            ])->setStatusCode(422);
        }
        $user = User::create([
            'full_name' => $request->full_name,
            'login' => $request->login,
            'password' => \Hash::make($request->password),
        ]);
        $user->generateToken();
        return response()->json([
            'data' => $user,
        ]);
    }
}

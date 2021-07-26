<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Staff;

class StaffController extends Controller
{
    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'full_name' => ['required', 'string'],
            'photo' => ['required', 'file', 'image', 'mimes:jpeg', 'max:210'],
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
        $staff = Staff::create([
            'full_name' => $request->full_name,
            'photo' => asset('storage/' . $request->photo->store('staff', 'public')),
            'code' => \Str::random(32),
        ]);
        return response()->json([
            'data' => [
                'id' => $staff->id,
                'full_name' => $staff->full_name,
                'code' => $staff->code,
            ],
        ]);
    }
}

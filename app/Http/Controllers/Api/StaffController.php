<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Staff;

class StaffController extends Controller
{
    public function index()
    {
        return response()->json([
            'data' => [
                'items' => Staff::all()->map(function($item) {
                    $item->photo = asset($item->photo);
                    return $item;
                }),
            ],
        ]);
    }

    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'full_name' => ['required', 'string'],
            'photo' => ['required', 'file', 'image', 'mimes:jpeg'],
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
            'photo' => 'storage/' . $request->photo->store('staff', 'public'),
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

    public function access(Request $request, $id)
    {
        $validator = \Validator::make($request->all(), [
            'point_id' => ['required', 'exists:points,id'],
            'time' => ['required', 'integer', 'min:1'],
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
        $staff = Staff::find($id);
        if($staff) {
            $staff->points()->attach($request->point_id, [
                'time' => $request->time,
                'created_at' => now(),
            ]);
            return response()->noContent()->setStatusCode(201);
        }
    }
}

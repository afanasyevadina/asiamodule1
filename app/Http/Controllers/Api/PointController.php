<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Point;

class PointController extends Controller
{
    public function index()
    {
        return response()->json([
            'data' => [
                'items' => Point::whereNull('parent')->with(['points' => function($query) {
                    $this->recursive($query);
                }])->get(),
            ],
        ]);
    }

    public function recursive($query) {
        return $query->with('points', function($query) {
            return $this->recursive($query);
        });
    }

    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'parent' => ['sometimes', 'exists:points,id'],
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
        $point = Point::create($request->all());
        return response()->json([
            'data' => $point,
        ]);
    }
}

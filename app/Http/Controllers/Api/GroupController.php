<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Group;
use App\Models\Point;

class GroupController extends Controller
{
    public function index()
    {
        return response()->json([
            'data' => [
                'items' => Group::all(),
            ],
        ]);
    }

    public function store(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'name' => ['required', 'string'],
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
        $group = Group::create($request->all());
        return response()->json([
            'data' => $group,
        ]);
    }

    public function points(Request $request, $id)
    {
        $validator = \Validator::make($request->all(), [
            'points' => ['required', 'array'],
            'points.*' => ['required', 'exists:points,id'],
        ]);
        if($validator->fails()) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => [
                        'points' => collect($validator->errors('points'))->map(function($item) {
                            return $item[0];
                        })->implode(','),
                    ],
                ],
            ])->setStatusCode(422);
        }
        $group = Group::find($id);
        if($group) {
            $group->points()->syncWithoutDetaching($request->points);
            return response()->noContent()->setStatusCode(201);
        }
    }

    public function staff(Request $request, $id)
    {
        $validator = \Validator::make($request->all(), [
            'staff' => ['required', 'array'],
            'staff.*' => ['required', 'exists:staff,id'],
        ]);
        if($validator->fails()) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Validation error',
                    'errors' => [
                        'staff' => collect($validator->errors('staff'))->map(function($item) {
                            return $item[0];
                        })->implode(','),
                    ],
                ],
            ])->setStatusCode(422);
        }
        $group = Group::find($id);
        if($group) {
            $group->staff()->syncWithoutDetaching($request->staff);
            return response()->noContent()->setStatusCode(201);
        }
    }
}

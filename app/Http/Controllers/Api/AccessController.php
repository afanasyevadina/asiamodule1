<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Staff;
use App\Models\Point;
use App\Models\Log;

class AccessController extends Controller
{
    public function check(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'staff' => ['required', 'string', 'size:32', 'exists:staffs,code'],
            'point' => ['required', 'integer', 'exists:points,id'],
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
        $staff = Staff::where('code', $request->staff)->first();
        $point = Point::find($request->point);
        $response = \Http::get('https://source.unsplash.com/random');
        $path = 'logs/' . time() . '.jpg';
        file_put_contents('logs/' . time() . '.jpg', $response);
        $log = Log::create([
            'staff_id' => $staff->id,
            'point_id' => $point->id,
            'access' => $staff->accessGroups()->where('point_id', $point->id)->exists(),
            'photo' => asset($path),
        ]);
        return response()->json([
            'data' => [
                'photo' => $log->photo,
                'access' => $log->access,
            ],
        ]);
    }
}

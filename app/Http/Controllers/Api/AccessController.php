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
            'staff' => ['required', 'string', 'size:32', 'exists:staff,code'],
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
        /*$response = \Http::get('https://source.unsplash.com/random');
        $path = 'logs/' . time() . '.jpg';
        file_put_contents('logs/' . time() . '.jpg', $response);*/
        $log = Log::create([
            'staff_id' => $staff->id,
            'point_id' => $point->id,
            'access' => $staff->groups()->whereHas('points', function($query) use($point) {
                $query->where('points.id', $point->id)->orWhere('points.id', $point->parent);
            })->exists() 
            || $staff->points()
            ->where('points.id', $point->id)
            ->whereRaw(\DB::raw('timestamp + time >'. time()))
            ->exists(),
            'camera' => $staff->photo, //заглушка
            'timestamp' => time(),
        ]);
        return response()->json([
            'data' => [
                'photo' => $staff->photo,
                'access' => $log->access,
            ],
        ]);
    }
}

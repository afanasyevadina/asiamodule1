<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Log;

class LogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'type' => ['sometimes','in:staff,point'],
        ]);
        $validator->sometimes('id', 'required|exists:staff,id', function($input) {
            return $input->type == 'staff';
        });
        $validator->sometimes('id', 'required|exists:points,id', function($input) {
            return $input->type == 'point';
        });
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
        $logs = Log::when(\Request::get('type') == 'point', function($query) {
            $query->where('point_id', \Request::get('id'));
        })
        ->when(\Request::get('type') == 'staff', function($query) {
            $query->where('staff_id', \Request::get('id'));
        })
        ->with('staff')
        ->with('point')
        ->orderBy('timestamp', 'desc')
        ->get()
        ->map(function($item) {
            return [
                'access' => $item->access,
                'staff' => [
                    'id' => $item->staff->id,
                    'full_name' => $item->staff->full_name,
                    'photo' => $item->staff->photo,
                    'camera' => $item->camera,
                ],
                'point' => [
                    'id' => $item->point->id,
                    'name' => $item->point->name,
                ],
                'timestamp' => $item->timestamp,
            ];
        });
        return response()->json([
            'data' => [
                'items' => $logs,
            ],
        ]);
    }
}

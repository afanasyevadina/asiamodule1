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
    public function index()
    {
        $logs = Log::orderBy('created_at', 'desc')->get()->map(function($item) {
            return [
                'staff' => $item->staff->full_name,
                'point' => $item->point->name,
                'access' => $item->access,
                'timestamp' => strtotime($item->created_at),
                'photo' => $item->photo,
            ];
        });
        return response()->json([
            'data' => [
                'items' => $logs,
            ],
        ]);
    }
}

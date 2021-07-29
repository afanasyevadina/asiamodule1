<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    //public $timestamps = ['created_at'];

    const UPDATED_AT = null;

    protected $fillable = [
        'staff_id',
        'point_id',
        'access',
        'camera',
    ];

    protected $casts = [
        'access' => 'boolean',
    ];

    public function point()
    {
        return $this->belongsTo('App\Models\Point')->withDefault();
    }

    public function staff()
    {
        return $this->belongsTo('App\Models\Staff')->withDefault();
    }
}

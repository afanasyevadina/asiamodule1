<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    protected $fillable = [
        'staff_id',
        'point_id',
        'access',
        'photo',
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

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'full_name',
        'point_id',
        'photo',
        'code',
    ];

    public function groups()
    {
        return $this->belongsToMany('App\Models\Group');
    }

    public function points()
    {
        return $this->belongsToMany('App\Models\Point', 'staff_point');
    }
}

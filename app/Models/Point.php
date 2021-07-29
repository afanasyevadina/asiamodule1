<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Point extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'name',
        'parent',
    ];

    public function groups()
    {
        return $this->belongsToMany('App\Models\Group', 'group_points');
    }

    public function points()
    {
        return $this->hasMany('App\Models\Point', 'parent');
    }
}

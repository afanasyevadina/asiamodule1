<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'name',
    ];

    public function staff()
    {
        return $this->belongsToMany('App\Models\Staff');
    }

    public function points()
    {
        return $this->belongsToMany('App\Models\Point', 'group_points');
    }
}

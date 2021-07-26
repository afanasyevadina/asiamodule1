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
        'parent_id',
    ];

    public function accessGroups()
    {
        return $this->hasMany('App\Models\AccessGroup');
    }

    public function parent()
    {
        return $this->belongsTo('App\Models\Point')->withDefault();
    }
}

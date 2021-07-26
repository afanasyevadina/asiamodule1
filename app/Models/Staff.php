<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'staffs';

    protected $fillable = [
        'full_name',
        'point_id',
        'photo',
        'code',
    ];

    public function accessGroups()
    {
        return $this->hasMany('App\Models\AccessGroup');
    }
}

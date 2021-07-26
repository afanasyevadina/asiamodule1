<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccessGroup extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'staff_id',
        'point_id',
    ];
}

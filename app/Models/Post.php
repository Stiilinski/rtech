<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = 'post';

    protected $fillable = [
        'title',
        'message',
        'type',
        'author',
    ];

    public function users()
    {
        return $this->belongsTo(User::class, 'author');
    }
}

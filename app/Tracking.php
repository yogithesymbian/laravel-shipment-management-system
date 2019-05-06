<?php

namespace Laraspace;

use Illuminate\Database\Eloquent\Model;

class Tracking extends Model
{
    protected $table = 'tracking';
    protected $keyType = 'string';

    public function pengirim()
    {
        return $this->belongsTo('Laraspace\Pengirim');
    }
}

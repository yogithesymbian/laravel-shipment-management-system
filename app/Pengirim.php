<?php

namespace Laraspace;

use Illuminate\Database\Eloquent\Model;

class Pengirim extends Model
{
    protected $table = 'pengirim';

    public function trackings()
    {
        return $this->hasMany('Laraspace\Tracking', 'id_pengirim', 'id_pengirim');
    }
}

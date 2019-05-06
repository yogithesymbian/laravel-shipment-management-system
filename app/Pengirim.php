<?php

namespace Laraspace;

use Illuminate\Database\Eloquent\Model;

class Pengirim extends Model
{
    protected $table = 'pengirim';
    protected $primaryKey = 'id_pengirim';
    protected $keyType = 'string';

    /**
     * Method One To Many Pengirim -> Tracking
     *
     * @return void
     */
    public function trackings()
    {
        return $this->hasMany('Laraspace\Tracking', 'id_pengirim', 'id_pengirim');
    }
}

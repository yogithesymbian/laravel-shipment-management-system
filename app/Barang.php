<?php

namespace Laraspace;

use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    protected $table = 'barang';
    protected $keyType = 'id_barang';

    public function pengirim()
    {
        return $this->belongsTo('Laraspace\Pengirim', 'id_pengirim', 'id_pengirim');
    }
}

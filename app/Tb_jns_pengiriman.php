<?php

namespace Laraspace;

use Illuminate\Database\Eloquent\Model;

class Tb_jns_pengiriman extends Model
{
    protected $table = 'tb_jns_pengiriman';
    protected $fillable = [
        'kd_pengiriman',
        'nm_jns_pengiriman',
        'harga_per_km'
    ];
}

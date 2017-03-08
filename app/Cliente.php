<?php

namespace Drogueria;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{

    protected $fillable = ['id','rut','dv','nombre','direccion_factura','direccion_despacho','comunas_id']; 

}

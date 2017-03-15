<?php

namespace Drogueria;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $fillable = ['nombre','concentracion','tipos_concentraciones_id','precio_bodega','presentaciones_farmacologicas_id','laboratorios_id','unidad_empaque']; 

}

<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTipoConcentracionTable extends Migration
{
    /**
     * Run the migrations.
     * @table tipo_concentracion
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_concentracion', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 45);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
     public function down()
     {
       Schema::dropIfExists('tipo_concentracion');
     }
}

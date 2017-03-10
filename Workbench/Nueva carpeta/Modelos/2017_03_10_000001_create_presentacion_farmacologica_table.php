<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePresentacionFarmacologicaTable extends Migration
{
    /**
     * Run the migrations.
     * @table presentacion_farmacologica
     *
     * @return void
     */
    public function up()
    {
        Schema::create('presentacion_farmacologica', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 255);
            $table->string('nombre_corto', 45);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
     public function down()
     {
       Schema::dropIfExists('presentacion_farmacologica');
     }
}

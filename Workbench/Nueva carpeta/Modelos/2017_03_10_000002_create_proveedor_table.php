<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProveedorTable extends Migration
{
    /**
     * Run the migrations.
     * @table proveedor
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proveedor', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 45);
            $table->string('rut', 45)->nullable();
            $table->string('dv', 45)->nullable();
            $table->string('direccion', 45)->nullable();
            $table->string('ciudad', 45)->nullable();
            $table->string('telefono', 45)->nullable();
            $table->string('email', 45)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
     public function down()
     {
       Schema::dropIfExists('proveedor');
     }
}

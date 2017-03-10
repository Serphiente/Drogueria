<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClienteTable extends Migration
{
    /**
     * Run the migrations.
     * @table cliente
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cliente', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('rut', 45);
            $table->string('nombre', 45);
            $table->string('direccion_factura', 255);
            $table->string('direccion_despacho', 255);
            $table->integer('comuna_id');


            $table->foreign('comuna_id', 'fk_cliente_comuna1_idx')
                ->references('id')->on('comuna')
                ->onDelete('no action')
                ->onUpdate('no action');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
     public function down()
     {
       Schema::dropIfExists('cliente');
     }
}

<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductoTable extends Migration
{
    /**
     * Run the migrations.
     * @table producto
     *
     * @return void
     */
    public function up()
    {
        Schema::create('producto', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 255);
            $table->string('concentracion', 10)->nullable();
            $table->integer('tipo_concentracion_id')->nullable();
            $table->integer('precio_bodega');
            $table->integer('presentacion_farmacologica_id');
            $table->integer('laboratorio_id');


            $table->foreign('presentacion_farmacologica_id', 'fk_producto_presentacion_farmacologica1_idx')
                ->references('id')->on('presentacion_farmacologica')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('tipo_concentracion_id', 'fk_producto_tipo_concentracion1_idx')
                ->references('id')->on('tipo_concentracion')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('laboratorio_id', 'fk_producto_laboratorio1_idx')
                ->references('id')->on('laboratorio')
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
       Schema::dropIfExists('producto');
     }
}

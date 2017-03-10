<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOcTable extends Migration
{
    /**
     * Run the migrations.
     * @table OC
     *
     * @return void
     */
    public function up()
    {
        Schema::create('OC', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('codigo');
            $table->integer('proveedor_id');
            $table->integer('producto_id');
            $table->integer('precio')->nullable();


            $table->foreign('proveedor_id', 'fk_OC_proveedor1_idx')
                ->references('id')->on('proveedor')
                ->onDelete('no action')
                ->onUpdate('no action');

            $table->foreign('producto_id', 'fk_OC_producto1_idx')
                ->references('id')->on('producto')
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
       Schema::dropIfExists('OC');
     }
}

<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContactoClienteTable extends Migration
{
    /**
     * Run the migrations.
     * @table contacto_cliente
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contacto_cliente', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 255);
            $table->string('telefono', 45);
            $table->string('email', 255);
            $table->integer('cliente_id');


            $table->foreign('cliente_id', 'fk_contacto_cliente_cliente1_idx')
                ->references('id')->on('cliente')
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
       Schema::dropIfExists('contacto_cliente');
     }
}

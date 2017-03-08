<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContactoClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contacto_clientes', function(Blueprint $table) {
		    $table->engine = 'InnoDB';
		
		    $table->increments('id');
		    $table->string('nombre', 45);
		    $table->string('apellido', 45);
		    $table->string('telefono', 45);
		    $table->string('email', 45);
		    $table->integer('clientes_id')->unsigned();
		
		    $table->index('clientes_id','fk_contacto_cliente_cliente1_idx');
		
		    $table->foreign('clientes_id')
		        ->references('id')->on('clientes');
		
		    $table->timestamps();
		
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contacto_clientes');
    }
}

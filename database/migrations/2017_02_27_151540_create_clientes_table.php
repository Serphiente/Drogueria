<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('clientes', function(Blueprint $table) {
		    $table->engine = 'InnoDB';
		
		    $table->integer('id');
		    $table->string('rut', 45);
            $table->string('dv', 1);
		    $table->string('nombre', 45);
		    $table->string('direccion_factura', 255);
		    $table->string('direccion_despacho', 255);
		    $table->integer('comunas_id')->unsigned();
		    
		    $table->primary('id');
		
		    $table->index('comunas_id','fk_clientes_comuna1_idx');
		
		    $table->foreign('comunas_id')
		        ->references('id')->on('comunas');
		
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
        Schema::dropIfExists('clientes');
    }
}

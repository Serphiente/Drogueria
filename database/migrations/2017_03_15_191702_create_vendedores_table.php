<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVendedoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendedores', function (Blueprint $table) {
          $table->engine = 'InnoDB';
		
		    $table->increments('id');
		    $table->string('nombre', 45);
		    $table->string('apellido', 45);
		    $table->string('rut', 45);
		    $table->string('dv', 45);
		    $table->string('celular', 45);
		    $table->string('email', 255);
		    $table->string('cuenta_banco', 255)->nullable();
		    $table->string('cuenta_tipo', 255)->nullable();
		    $table->string('cuenta_numero', 255)->nullable();
		
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
        Schema::dropIfExists('vendedores');
    }
}

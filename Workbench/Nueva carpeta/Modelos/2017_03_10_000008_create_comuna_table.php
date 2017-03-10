<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComunaTable extends Migration
{
    /**
     * Run the migrations.
     * @table comuna
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comuna', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('nombre', 64);
            $table->integer('provincia_id');


            $table->foreign('provincia_id', 'fk_comuna_provincia1_idx')
                ->references('id')->on('provincia')
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
       Schema::dropIfExists('comuna');
     }
}

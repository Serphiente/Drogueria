<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProvinciasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       Schema::create('provincias', function(Blueprint $table) {
		    $table->engine = 'InnoDB';
		
		    $table->increments('id');
		    $table->string('nombre', 45);
		    $table->integer('regions_id')->unsigned();
		
		    $table->index('regions_id','fk_provincias_regions_idx');
		
		    $table->foreign('regions_id')
		        ->references('id')->on('regions');
		
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
        Schema::dropIfExists('provincias');
    }
}

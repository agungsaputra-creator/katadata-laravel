<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScheduleDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedule_details', function (Blueprint $table) {
            $table->id();
            $table->integer('schedule_id');
            $table->time('start_time');
            $table->time('end_time');
            $table->string('title');
            $table->longText('link_youtube');
            $table->longText('link_facebook');
            $table->string('type');
            $table->timestamps();
        });

        Schema::table('schedules', function (Blueprint $table) {
            $table->string('name_day')->after('id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schedule_details');
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use App\Models\Schedule_detail;
use App\Models\Speaker;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $speaker = Speaker::all();
        $day = Schedule::all();
        $schedule = Schedule_detail::All();
        return view('home.index', compact('speaker','day','schedule'));
    }
}

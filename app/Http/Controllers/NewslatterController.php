<?php

namespace App\Http\Controllers;

use App\Mail\Newslatter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class NewslatterController extends Controller
{
    public function store(Request $request)
    {
        $data = request()->validate([
            'email' => 'required|email',
        ]);

        

        Mail::to($request->email)->send(new Newslatter($data));

        return back();
    }
}

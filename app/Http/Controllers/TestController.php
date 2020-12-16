<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function controllerMethod()
    {
        // any code here
        // return view('welcome');

        return response()->json([
            'msg' => 'We should return only json'
        ]);
    }
}

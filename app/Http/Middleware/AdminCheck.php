<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class AdminCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // \Log::info('inside middlewear');
        if(!Auth::check()){
            // return redirect('/login');
            // return 'not loggedin';

            return response()->json([
                'msg' => 'You are not allowed to access this route...'
            ], 402);
        }
        $user = Auth::user();
        if($user->userType=='User'){
            return response()->json([
                'msg' => 'You are not allowed to access this route...'
            ], 402);
        }

        return $next($request);
    }
}

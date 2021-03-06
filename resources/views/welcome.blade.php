<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Test</title>

        <link rel="stylesheet" href="/css/all.css">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- TailwindCSs -->
        {{-- <link rel="stylesheet" href="{{ mix('css/tailwind.css') }}"> --}}

        <!-- FontAwesome -->
        {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"> --}}

    <script>
        // var user
        (function () {
            window.Laravel = {
                csrfToken: '{{ csrf_token() }}'
            };
        })();
    </script>

    </head>
    <body>
        <div id="app">
            @if (Auth::check())
                <mainapp :user="{{Auth::user()}}" :permission="{{Auth::user()->role->permission}}"></mainapp>
            @else
                <mainapp :user="false"></mainapp>
            @endif
        </div>
    </body>
    <script src="{{mix('/js/app.js')}}"></script>
</html>

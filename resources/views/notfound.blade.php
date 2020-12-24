<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Page is not found</title>

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
        <div class="container">
            <div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
                <h1 class="_text_center">You don't have enough permission to access this page.</h1>
            </div>
       </div>

    </body>
</html>

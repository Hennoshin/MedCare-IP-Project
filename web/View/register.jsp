<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>MedCare</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Annie+Use+Your+Telescope&family=Merriweather&family=Playfair+Display&family=Roboto&display=swap"
        rel="stylesheet">
    </head>
    <body>
       <div class="grid min-h-screen place-items-center">
        <div class="bg-yellow-500 shadow-md border border-gray-200 rounded-lg max-w-sm p-4 sm:p-6 lg:p-8">
            <h1 class="text-4xl text-red-600", cursive;">
                MedCare</h1><br><span class="font-normal">MedCare</span></h1>
            <form action="../register" method="POST" mt-6>
                <label for="email" class="block text-xs font-semibold text-gray-600 uppercase">Email</label>
                <input id="email" type="email" name="email" 
                    class="block w-full p-3 mt-2  bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"
                    required />
                <label for="name" class="block text-xs font-semibold text-gray-600 uppercase">Full Name</label>
                <input id="name" type="text" name="name" 
                    class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"
                    required />          
                <label for="address" class="block text-xs font-semibold text-gray-600 uppercase">Address</label>
                <input id="address" type="text" name="address" 
                    class="block w-full p-3 mt-2  bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"
                    required />
                <label for="password" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">Password</label>
                <input id="password" type="password" name="password" minlength="6"
                    autocomplete="current-password"
                    class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"
                    required />
                <input type="submit" value="Register"
                    class="w-full py-3 mt-6 font-medium tracking-widest text-white uppercase bg-black shadow-lg focus:outline-none hover:bg-gray-900 hover:shadow-none">

                <br><br>
                <p>Already Have an Account?</p>
                <p class="text-gray-500 cursor-pointer hover:text-black"><a href="index.jsp">Log in</a></p>
            </form>
        </div>
    </div>
    </body>
</html>

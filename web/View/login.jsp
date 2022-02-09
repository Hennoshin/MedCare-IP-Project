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
    <nav class="bg-yellow-500 sm:px-4 py-4">
        <div class="container mx-24 mx-auto">
            <div class="container flex flex-wrap justify-between items-center mx-auto px-24">
                <a href="index.jsp" class="flex">
                    <h1 class="text-4xl text-red-600", cursive;">
                        MedCare</h1>
                </a>
                <button data-collapse-toggle="mobile-menu" type="button"
                    class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    aria-controls="mobile-menu-2" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd"></path>
                    </svg>
                </button>
                <div class="hidden w-full md:block md:w-auto" id="mobile-menu">
                </div>
            </div>
        </div>
    </nav>
    <div class="grid min-h-screen place-items-center">
        <div
            class="bg-yellow-500 shadow-md border border-gray-200 rounded-lg max-w-sm p-4 sm:p-6 lg:p-8">
            <h1 class="text-4xl text-red-600", cursive;">
                MedCare</h1><br><span class="font-normal"></span></h1>
            <form action="login" method="POST" mt-6>
                <label for="email" class="block text-xs font-semibold text-gray-600 uppercase mt-6">Username</label>
                <input id="email" type="email" name="email"
                    class="form-control block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"/>
                <label for="password" class="block mt-2 text-xs font-semibold text-gray-600 uppercase">Password</label>
                <input id="password" type="password" name="password"
                    class="block w-full p-3 mt-2 mb-6 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner"
                    required />
                ${message}
                <button type="submit"
                    class="w-full py-3 mt-2 font-medium tracking-widest text-white uppercase bg-black shadow-lg focus:outline-none hover:bg-gray-900 hover:shadow-none">
                    Log in
                </button>
                <p class="flex justify-between inline-block mt-4 text-xs text-gray-500 ">Don't have an account ? <a
                        href="register.jsp"
                        class="text-black-700 hover:underline dark:text-black-500 cursor-pointer hover:text-black">Create
                        an Account</a> </p>
            </form>
        </div>
    </div>
    </body>
</html>

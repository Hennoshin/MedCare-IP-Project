<%-- 
    Document   : header
    Created on : Feb 9, 2022, 1:50:28 PM
    Author     : Asus
--%>

<%@page import="Model.Authenticatable"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <nav class="bg-yellow-500 sm:px-4 py-4 mb-16">
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
                <div class="flex flex-wrap justify-between items-center">
                <% if ((request.getSession().getAttribute("authenticated") == null) || !(Boolean)request.getSession().getAttribute("authenticated")) { %>
                    <a href="login" class="flex mx-1"><button type="button" class="btn" style="background-color: yellow;">
                        Login
                    </button></a>
                        
                    <a href="register" class="flex mx-1"><button type="button" class="btn" style="background-color: yellow;">
                        Register
                    </button></a>
                
                <% } else { %>
                    <p><%= ((Authenticatable)request.getSession().getAttribute("user")).getName() %></p>
                <% } %>
                    <a href="cart">
                        <button><span class="mx-4 material-icons material-icons-outlined">
                            shopping_cart
                        </span></button>
                    </a>
                </div>
            </div>
        </div>
    </nav>

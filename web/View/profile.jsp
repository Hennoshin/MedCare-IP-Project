<%-- 
    Document   : profile
    Created on : Feb 9, 2022, 10:16:09 PM
    Author     : Asus
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Profile Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Annie+Use+Your+Telescope&family=Merriweather&family=Playfair+Display&family=Roboto&display=swap"
            rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
        
        <style>
            body {
                background: yellow;
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8;
            }

            .profile-button:hover {
                background: #682773;
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }

            .labels {
                font-size: 11px;
            }        
        </style>
        
        <script>
            $(document).ready(function () {
                $("form").submit(function (event) {
                    event.preventDefault();

                    if ($("input[name='new_password_confirm']").val() !== $("input[name='new_password']").val()) {
                        $("input[name='new_password_confirm']")[0].setCustomValidity("Confirm Password Does Not Match");
                        $("input[name='new_password_confirm']")[0].reportValidity();
                        $("input[name='new_password_confirm']")[0].setCustomValidity("");

                        return;
                    }
                    
                    var arr = {};
                    let count = 0;
                    $("input[name]").each(function (index) {
                        if ($(this).val()) {
                            arr[$(this).attr("name")] = $(this).val(); 
                        }
                    });
                    $.ajax({
                        method: "POST",
                        data: arr,
                        success: function (response, status, xhr) {
                            $(".modal-body").html("Profile saved successfully");
                        },
                        error: function (xhr, status, error) {
                            $(".modal-body").html("Wrong current password");
                        },
                        complete: function (xhr, status) {
                            (new bootstrap.Modal($("#notification")[0], { })).show();
                        }
                    });
                });
            });
                
        </script>
        
    </head>
    <body>
        <div class="modal fade" id="notification" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <i class="modal-title material-icons" style="font-size: 30px; color: blue;">info</i>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>  
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
              </div>
            </div> 
        </div>
        <jsp:include page="header.jsp"/>
        <div class="container rounded bg-white mt-5 mb-5">
            <form method="POST">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold"><%= ((User)request.getSession().getAttribute("user")).getName() %></span><span class="text-black-50"><%= ((User)request.getSession().getAttribute("user")).getEmail() %></span><span> </span></div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" value="<%= ((User)request.getSession().getAttribute("user")).getEmail() %>" disabled></div>
                                <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" name="name" value="<%= ((User)request.getSession().getAttribute("user")).getName()%>"></div>
                                <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" name="address" value="<%= ((User)request.getSession().getAttribute("user")).getAddress()%>"></div>
                            </div>
                            <div class="mt-5 text-center"><input class="btn profile-button" type="submit" value="Save Changes" style="background-color: yellow;"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience"><h4>Change Password</h4></div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Current Password</label><input type="password" class="form-control" name="password"></div>
                                <div class="col-md-12"><label class="labels">New Password</label><input type="password" class="form-control" name="new_password"></div>
                                <div class="col-md-12"><label class="labels">New Password Confirm</label><input type="password" class="form-control" name="new_password_confirm"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

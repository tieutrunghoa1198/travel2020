<%-- 
    Document   : Navbar
    Created on : Nov 2, 2020, 5:19:19 PM
    Author     : songm
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>a {text-decoration: none;} </style>
        <link rel="stylesheet" href="css/footer.css">
        <title>Hello, world!</title>
    </head>

    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home">
                <img src="images/brand.png" width="50" height="50" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li 
                        <c:if test="${param.current == 'home'}">
                            style="border-bottom: solid;"
                        </c:if>
                        class="nav-item active" >
                        <a class="nav-link" href="home" style="font-size: 1.1rem;"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li 
                        <c:if test="${param.current == 'fav'}">
                            style="border-bottom: solid;"
                        </c:if>
                        class="nav-item active" >
                        <a class="nav-link" href="fav" style="font-size: 1.1rem;"><i class="far fa-heart"></i> Favourite <span class="sr-only"></span></a>
                    </li>
                </ul>

                <c:choose>
                    <c:when test="${user == null}">
                        <a href="create_acc">
                            <button class="btn btn-outline-secondary my-2 mx-1 my-sm-0" style="border: 0;">Sign Up</button>
                        </a>
                        <a href="login">
                            <button class="btn btn_get btn_get_two my-2 mx-1 my-sm-0">Login</button>
                        </a>
                    </c:when>
                    <c:when test="${role == 'admin'}">
                        <div class="dropdown">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${user.fullname}
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="admin">Admin Management</a>
                                <a class="dropdown-item" href="changepass">Change Password</a>
                                <a class="dropdown-item" href="logout">Sign Out</a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${user.fullname}
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="updateinfo">Update Info</a>
                                <a class="dropdown-item" href="changepass">Change Password</a>
                                <a class="dropdown-item" href="logout">Sign Out</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
        <!-- Optional JavaScript; choose one of the two! -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    </body>
</html>

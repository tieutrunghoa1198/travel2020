<%-- 
    Document   : Place
    Created on : Nov 3, 2020, 10:04:55 PM
    Author     : songm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="css/destination.css">
        <title>${place.name}</title>
        <style>
            #quality-ingredients
            {
                background-image: url('${destination.img}'); 
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <section id="quality-ingredients" style="">
            <div class="d-flex align-items-center justify-content-center text-light aw-vertical-align">
                <h1 class="aw-border text-center">
                    ${destination.name}
                </h1>
            </div>
        </section>
        <main class="container mt-5">
            <p class="drop-cap">${destination.content}</p>
            <div class="embed-responsive embed-responsive-21by9">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/${place.video}?autoplay=1&mute=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>
        </main>
        <jsp:include page="Footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : Favourite
    Created on : Nov 5, 2020, 12:01:50 PM
    Author     : songm
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/destination.css">
        <style>
            #quality-ingredients
            {
                background-image: url('images/fav_img.jpg'); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp">
            <jsp:param name="current" value="fav"/>
        </jsp:include>
        <main>
            <!--Background Image-->
            <section id="quality-ingredients" style="">
                <div class="d-flex align-items-center justify-content-center text-light aw-vertical-align">
                    <h1 class="aw-border text-center">
                        Favourite Destinations
                    </h1>
                </div>
            </section>
            <!--End of background image-->
            <div class="container mt-5 pt-5" >
                <h1>${sessionScope.user.username}'s Favourite Destination</h1>
            </div>
            <main class="container mt-5">
                <c:forEach items="${listfav}" var="d">
                    <div class="card mt-5">
                        <img class="card-img-top" src="${d.img}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${d.name}</h5>
                            <p class="card-text">${d.content}</p>
                            <!--<a href="" class="btn btn_get btn_get_two">Add To Favourite</a>-->
                            <a class="removebtn btn btn-primary" href="remove?id=${d.id}" role="button" 
                               style="
                               background-color: #5e2ced;
                               border-color: #5e2ced;">
                                Remove
                            </a>
                            <a href="place?id=${d.id}" class="btn btn-outline-secondary">Detail</a>
                        </div>
                    </div>
                    <br/>
                    <hr>
                </c:forEach>
            </main>
        </main>
        <jsp:include page="Footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : City
    Created on : Nov 3, 2020, 2:28:36 PM
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
        <title>${destination.name}</title>
        <style>
            #quality-ingredients
            {
                background-image: url('${destination.img}'); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <main>
            <!--Background Image-->
            <section id="quality-ingredients" style="">
                <div class="d-flex align-items-center justify-content-center text-light aw-vertical-align">
                    <h1 class="aw-border text-center">
                        ${destination.name}
                    </h1>
                </div>
            </section>
            <!--End of background image-->
            <div class="container mt-5">
                <p class="drop-cap">${requestScope.destination.descript}</p>
            </div>

            <div class="container" id="content">
                <div class="row">
                    <div class="col-8">
                        <h2>Attractive Destination</h2>
                        <c:forEach items="${desDetail}" var="d">
                            <div class="card mt-5">
                                <img class="card-img-top" src="${d.img}" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">${d.name}</h5>
                                    <p class="card-text">${d.content}</p>
                                    <!--<a href="" class="btn btn_get btn_get_two">Add To Favourite</a>-->
                                    <a id="add-to-fav" class="addbtn btn btn-primary" role="button" 
                                       style="
                                       color: white;
                                       background-color: #5e2ced;
                                       border-color: #5e2ced;"
                                       data-id = "${d.id}" >
                                        Add To Favourite
                                    </a>
                                    <a href="place?id=${d.id}" class="btn btn-outline-secondary">Detail</a>
                                </div>
                            </div>
                            <br/>
                            <hr>
                        </c:forEach>
                    </div>
                    <div class="col-4">
                        <h2>Food</h2>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="Footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script>
            $(".addbtn").on('click', (function (e) {
                let a = $(e.target).attr('data-id');
                console.log(a);
                $.ajax({
                    url: "/Travel/addListFav",
                    type: "POST",
                    data: {
                        "destinationid": a
                    },
                    success: function (data) {
                        console.log(data);
                        if (data === 'loginnow') {
                            window.location.href = "/Travel/login";
                        } else
                            $(e.target).html("Saved");
                    },
                    error: function () {
                        alert("You already have this destination.");
                    }
                });
            }));
        </script>
    </body>
</html>

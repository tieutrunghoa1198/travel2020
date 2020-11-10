<%-- 
    Document   : Admin
    Created on : Nov 8, 2020, 4:08:49 PM
    Author     : songm
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/destination.css">
        <style>
            #quality-ingredients
            {
                background-image: url('images/admin.jpg'); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <!--Background Image-->
        <section id="quality-ingredients" style="">
            <div class="d-flex align-items-center justify-content-center text-light aw-vertical-align">
                <h1 class="aw-border text-center">
                    Admin Management
                </h1>
            </div>
        </section>
        <!--End of background image-->
        <div class="container mt-5">
            <p class="text-center">${blockErr}</p>
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="u">
                        <tr>
                            <td>
                                ${u.username}
                            </td>
                            <td>
                                ${u.fullname}
                            </td>
                            <td>
                                ${u.email}
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.status == true}">
                                        <a class="btn btn-danger" href="manage_user?username=${u.username}&option=0" style="color: white">
                                            BLOCK
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-success" href="manage_user?username=${u.username}&option=1" style="color: white">
                                            UNBLOCK
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>

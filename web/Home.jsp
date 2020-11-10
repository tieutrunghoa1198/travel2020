<%-- 
    Document   : Home
    Created on : Nov 2, 2020, 5:58:56 PM
    Author     : songm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
    <head>

        <meta charset="UTF-8">
        <title>Viet Travel</title>
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/css/swiper.min.css'>
        <link rel="stylesheet" href="css/style.css">
        <!--<link rel="stylesheet" href="css/carousel.css">-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    </head>

    <body>
        <jsp:include page="Navbar.jsp">
            <jsp:param name="current" value="home"/>
        </jsp:include>
        <!-- partial:index.partial.html -->

        <jsp:include page="Carousel.jsp"/>

        <c:forEach items="${requestScope.country}" var="c">
            <div class="container" style="margin-top: 30px;">
                <div class="wrapper">
                    <div class="">
                        <h2 class="">${c.name}</h2>    
                        <p>${c.description}</p>
                    </div>
                    <div class="item-bg"></div>
                    <div class="news-slider">
                        <div class="news-slider__wrp swiper-wrapper">
                            <c:forEach items="${c.destinations}" var="d">
                                <div class="news-slider__item swiper-slide">
                                    <a href="destination?id=${d.id}" class="news__item" style="text-decoration: none">
                                        <div class="news__img">
                                            <img src="${d.img}" alt="news">
                                        </div>
                                        <br/>
                                        <div class="news__title">
                                            ${d.name}
                                        </div>
                                        <p class="news__txt" style="height: 137px;text-overflow: ellipsis;overflow: hidden;white-space: normal;margin-bottom: 2%;">
                                            ${d.descript}
                                        </p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="news-slider__ctr">
                            <div class="news-slider__arrows">
                                <button class="news-slider__arrow news-slider-prev">
                                    <span class="icon-font">
                                        <svg class="icon icon-arrow-left"><use xlink:href="#icon-arrow-left"></use></svg>
                                    </span>
                                </button>
                                <button class="news-slider__arrow news-slider-next">
                                    <span class="icon-font">
                                        <svg class="icon icon-arrow-right"><use xlink:href="#icon-arrow-right"></use></svg>
                                    </span>
                                </button>
                            </div>
                            <div class="news-slider__pagination"></div>
                        </div>

                    </div>
                    <h2>&nbsp;</h2>
                </div>
            </div>
        </c:forEach>


        <svg hidden="hidden">
        <defs>
    <symbol id="icon-arrow-left" viewBox="0 0 32 32">
        <title>arrow-left</title>
        <path d="M0.704 17.696l9.856 9.856c0.896 0.896 2.432 0.896 3.328 0s0.896-2.432 0-3.328l-5.792-5.856h21.568c1.312 0 2.368-1.056 2.368-2.368s-1.056-2.368-2.368-2.368h-21.568l5.824-5.824c0.896-0.896 0.896-2.432 0-3.328-0.48-0.48-1.088-0.704-1.696-0.704s-1.216 0.224-1.696 0.704l-9.824 9.824c-0.448 0.448-0.704 1.056-0.704 1.696s0.224 1.248 0.704 1.696z"></path>
    </symbol>
    <symbol id="icon-arrow-right" viewBox="0 0 32 32">
        <title>arrow-right</title>
        <path d="M31.296 14.336l-9.888-9.888c-0.896-0.896-2.432-0.896-3.328 0s-0.896 2.432 0 3.328l5.824 5.856h-21.536c-1.312 0-2.368 1.056-2.368 2.368s1.056 2.368 2.368 2.368h21.568l-5.856 5.824c-0.896 0.896-0.896 2.432 0 3.328 0.48 0.48 1.088 0.704 1.696 0.704s1.216-0.224 1.696-0.704l9.824-9.824c0.448-0.448 0.704-1.056 0.704-1.696s-0.224-1.248-0.704-1.664z"></path>
    </symbol>
    </defs>
    </svg>
    <jsp:include page="Footer.jsp"/>
    <!-- partial -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/js/swiper.min.js'></script>
    <script  src="js/script.js"></script>

</body>
</html>

<%-- 
    Document   : Login
    Created on : Nov 2, 2020, 5:03:42 PM
    Author     : songm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <!--===============================================================================================-->
    </head>
    <body>
        <%--<jsp:include page="Navbar.jsp"/>--%>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/img-01.png" alt="IMG">
                    </div>

                    <form action="create_acc" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title">
                            <a href="home">
                                <img src="images/login.png" width="100" height="100" alt=""> 
                            </a>
                            Sign Up
                        </span>

                        <div class="wrap-input100">
                            <input class="input100 validate-name" type="text" name="fullname" placeholder="Full Name">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fas fa-signature"></i>
                            </span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="text" name="username" placeholder="User Name">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="far fa-user"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="far fa-envelope"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="container">
                            <p class="text-center" style="color: ${color}">
                                ${signupErr}
                            </p>
                        </div>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Sign Up
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="sendmail">
                                Password?
                            </a>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="login">
                                <i class="fa fa-long-arrow-left m-r-5" aria-hidden="true"></i>
                                Already have an account? Login now! 
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <%--<jsp:include page="Footer.jsp"/>--%>
        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script >
            $('.js-tilt').tilt({
                scale: 1.1
            })
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
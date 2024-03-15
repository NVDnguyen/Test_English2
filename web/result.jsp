<%-- 
    Document   : lesson
    Created on : Jan 21, 2024, 10:36:29 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="TemplateMo">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Test</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-finance-business.css">
        <link rel="stylesheet" href="assets/css/owl.css">

    </head>

    <body >

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <div class="sub-header">
            <div class="container">
                <div >
                    <div class=" d-flex justify-content-center align-items-center">
                       
                    </div>
                </div>
            </div>
        </div>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="home"><h2>Test English</h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <c:forEach items="${sessionScope.listTopic}" var="o">
                                <c:if test="${o.idTopic ne sessionScope.tp.idTopic}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="lesson?topic=${o.idTopic}">${o.nameTopic}</a>
                                    </li>
                                </c:if>
                                <c:if test="${o.idTopic eq sessionScope.tp.idTopic}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="lesson?topic=${o.idTopic}">${o.nameTopic}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!-- feature -->
<!--                            <li class="nav-item">
                                <a class="nav-link" href="exam">EXAMS</a>
                            </li>-->

                    


                            <!-- login / log out -->
                            <c:if test="${empty sessionScope.acc}">
                                <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                </c:if>

                            <c:if test="${not empty sessionScope.acc}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.acc.userName}
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">                                                                            
                                        <a class="dropdown-item" href="logout">Logout</a>
                                    </div>
                                </li>
                            </c:if>

                        </ul>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="navbar-nav ml-auto">
                            <!--                            <li>
                                                            <a href="login.jsp">
                                                                                                    <i class="fa fa-user fa-lg text-white"></i> 
                                                                Login
                                                            </a>
                                                        </li>-->
                        </ul>
                    </div>

                </div>
            </nav>
        </header>



        <div style="color: #66ffff; margin-bottom: 10cm;" >
            <!-- Wellcome Page Content -->
            <div class="page-heading header-text">
                <div class="container">               
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Your Result</h1>
                            <span>Language opens hearts and minds.</span>
                        </div>
                    </div>
                </div>
            </div>
    

            <div class="container mt-3">
                <div class="row">
                    <!-- Cột mục lục bên trái -->
                    <div class="col-md-8">
                        <!-- Your content here -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th  class="text-center" ><b style="color: black">Test Description</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${resultList}" var="q">
                                    <tr>
                                        <td>
                                            <a id="${q.getQuestion().getIdQuestion()}"></a>
                                            <p>${q.getQuestion().getDescriptionQ()}</p>

                                            <!-- answer 1 -->
                                            <c:choose>
                                                <c:when test="${'A' eq q.getUserChoice() && q.getCorrectAnswer() eq q.getUserChoice()}">
                                                    <div class="form-check bg-success ">
                                                    </c:when>
                                                    <c:when test="${'A'.equals(q.getUserChoice()) && !q.getCorrectAnswer().equals(q.getUserChoice())}">
                                                        <div class="form-check bg-danger ">
                                                        </c:when>
                                                        <c:when test="${'A'.equals(q.getCorrectAnswer())}">
                                                            <div class="form-check bg-success ">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="form-check">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <label id="${q.getQuestion().getIdQuestion()}" style="color: black;">${q.getQuestion().getAnswer1()}</label>
                                                        </div>

                                                        <!-- answer 2 -->
                                                        <c:choose>
                                                            <c:when test="${'B' eq q.getUserChoice() && q.getCorrectAnswer() eq q.getUserChoice()}">
                                                                <div class="form-check bg-success ">
                                                                </c:when>
                                                                <c:when test="${'B'.equals(q.getUserChoice()) && !q.getCorrectAnswer().equals(q.getUserChoice())}">
                                                                    <div class="form-check bg-danger ">
                                                                    </c:when>
                                                                    <c:when test="${'B'.equals(q.getCorrectAnswer())}">
                                                                        <div class="form-check bg-success ">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <div class="form-check">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <label id="${q.getQuestion().getIdQuestion()}" style="color: black;">${q.getQuestion().getAnswer2()}</label>
                                                                    </div>

                                                                    <!-- answer 3 -->
                                                                    <c:choose>
                                                                        <c:when test="${'C' eq q.getUserChoice() && q.getCorrectAnswer() eq q.getUserChoice()}">
                                                                            <div class="form-check bg-success ">
                                                                            </c:when>
                                                                            <c:when test="${'C'.equals(q.getUserChoice()) && !q.getCorrectAnswer().equals(q.getUserChoice())}">
                                                                                <div class="form-check bg-danger ">
                                                                                </c:when>
                                                                                <c:when test="${'C'.equals(q.getCorrectAnswer())}">
                                                                                    <div class="form-check bg-success ">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <div class="form-check">
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    <label id="${q.getQuestion().getIdQuestion()}" style="color: black;">${q.getQuestion().getAnswer3()}</label>
                                                                                </div>

                                                                                <!-- answer 4 -->
                                                                                <c:choose>
                                                                                    <c:when test="${'D' eq q.getUserChoice() && q.getCorrectAnswer() eq q.getUserChoice()}">
                                                                                        <div class="form-check bg-success ">
                                                                                        </c:when>
                                                                                        <c:when test="${'D'.equals(q.getUserChoice()) && !q.getCorrectAnswer().equals(q.getUserChoice())}">
                                                                                            <div class="form-check bg-danger ">
                                                                                            </c:when>
                                                                                            <c:when test="${'D'.equals(q.getCorrectAnswer())}">
                                                                                                <div class="form-check bg-success ">
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <div class="form-check">
                                                                                                    </c:otherwise>
                                                                                                </c:choose>
                                                                                                <label id="${q.getQuestion().getIdQuestion()}" style="color: black;">${q.getQuestion().getAnswer4()}</label>
                                                                                            </div>

                                                                                            <!-- Display message if user choice is empty -->
                                                                                            <c:if test="${empty q.getUserChoice()}">
                                                                                                <div style="color: #3399ff">
                                                                                                    Bạn chưa chọn đáp án .
                                                                                                </div>
                                                                                            </c:if>
                                                                                            </td>
                                                                                            </tr>
                                                                                        </c:forEach>




                                                                                        </tr>
                                                                                        </tbody>
                                                                                        </table>
                                                                                    </div>

                                                                                    <div class="col-md-0">                                                                                      
                                                                                    </div>
                                                                                    <div class="col-md-4">  
                                                                                        <table class="table table-bordered">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td colspan="10">
                                                                                                        <div class="text-center h2 text-danger" > ${grade}/${numOfQuestion} </div>  

                                                                                                    </td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <c:forEach items="${resultList}" var="q" varStatus="index">
                                                                                                        <td  id="${q.getQuestion().getIdQuestion()}YES">
                                                                                                            <a href="#${q.getQuestion().getIdQuestion()}">${index.index + 1}</a>
                                                                                                            <%-- check to down the line --%>
                                                                                                            <c:if test="${index.index % 10 == 9}">
                                                                                                        </tr><tr>
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                       
                                                                                    </div>





                                                                                </div>
                                                                            </div>
                                                                        </div>





                                                                        <!-- Bootstrap core JavaScript -->
                                                                        <script src="vendor/jquery/jquery.min.js"></script>
                                                                        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                                                                        <!-- Additional Scripts -->
                                                                        <script src="assets/js/custom.js"></script>
                                                                        <script src="assets/js/owl.js"></script>
                                                                        <script src="assets/js/slick.js"></script>
                                                                        <script src="assets/js/accordions.js"></script>

                                                                        <script language = "text/Javascript">
                                                                                                cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
                                                                                                function clearField(t) {                   //declaring the array outside of the
                                                                                                    if (!cleared[t.id]) {                      // function makes it static and global
                                                                                                        cleared[t.id] = 1; // you could use true and false, but that's more typing
                                                                                                        t.value = ''; // with more chance of typos
                                                                                                        t.style.color = '#fff';
                                                                                                    }
                                                                                                }
                                                                        </script>  
                                                                        </body>
                                                                        </html>
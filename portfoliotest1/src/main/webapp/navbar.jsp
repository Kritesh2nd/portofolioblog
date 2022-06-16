<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sessemailnav = String.valueOf(session.getAttribute("uemail"));
boolean loggedin=false;
if(sessemailnav.equals("null")){
  loggedin=false;
}
else if(!sessemailnav.equals("")){
  loggedin=true;
}
%>
<!DOCTYPE html>
<html>
  <head>
    <title> Navbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/navbar.css">
    <style>
    </style>
  </head>
  <body>
    <div class="navmainbody borde flex fdc aife w100">
      <div class="navbody borde w100 flex rel">
        <div class="navbodyleft borde flex aic">
          <div class="navtitlebox borde">SKYARTS</div>
        </div>
        <div class="navbodyright borde flex aic jcc">
          <ul class="navullist borde flex">
            <li class="lis flex"><a href="index.jsp" class="ahr rel">Home<span class="navspanA abs"></span></a></li>
            <li class="lis flex"><a href="blog.jsp" class="ahr rel">Blog<span class="navspanA abs"></span></a></li>
            <%if(loggedin){%>
              <li class="lis flex"><a href="logout.jsp" class="ahr rel">Sign Out<span class="navspanA abs"></span></a></li>
            <%}else{%>
              <li class="lis flex"><a href="login.jsp" class="ahr rel">Sign In<span class="navspanA abs"></span></a></li>
            <%}%>
          </ul>
        </div>
        <div class="navbodybarsbox borde flex jcfe aic">
          <div class="navbarsbox borde flex jcc rel">
            <span class="navspanEs navspanE1 abs"></span>
            <span class="navspanEs navspanE2 abs"></span>
            <span class="navspanEs navspanE3 abs"></span>
          </div>
        </div>
        <span class="navspanC abs"></span>
        <span class="navspanD abs"></span>
      </div>
      <div class="navbodyres borde flex fdc w100">
        <ul class="navullist borde flex fdc w100 h100">
          <li class="lis flex"><a href="index.jsp" class="ahr rel">Home<span class="navspanA navspanB abs"></span></a></li>
          <li class="lis flex"><a href="blog.jsp" class="ahr rel">Blog<span class="navspanA navspanB abs"></span></a></li>
          <%if(loggedin){%>
            <li class="lis flex"><a href="logout.jsp" class="ahr rel">Sign Out<span class="navspanA abs"></span></a></li>
          <%}else{%>
            <li class="lis flex"><a href="login.jsp" class="ahr rel">Sign In<span class="navspanA abs"></span></a></li>
          <%}%>
        </ul>
      </div>
    </div>
    <script>
      //var broomA1 = document.querySelector(".broomA1");
      //var ahr = navspanEs.querySelectorAll(".navspanEs");
      var navbarsbox = document.querySelector(".navbarsbox");
      var navbodyres = document.querySelector(".navbodyres");
      var navspanD = document.querySelector(".navspanD");
      var navspanEs = document.querySelectorAll(".navspanEs");
      var clicktrue = true;
      navbarsbox.addEventListener('click',()=>{clickBars();});
      function clickBars(){
        if(clicktrue){
          navbodyres.style.animationName = "navAnimate1S";
          navspanD.style.animationName = "navAnimate1S";
          navspanEs[0].style.animationName = "navAnimate4AS";
          navspanEs[1].style.animationName = "navAnimate4BS";
          navspanEs[2].style.animationName = "navAnimate4CS";
          clicktrue=false;
        }
        else{
          navbodyres.style.animationName = "navAnimate1E";
          navspanD.style.animationName = "navAnimate1E";
          navspanEs[0].style.animationName = "navAnimate4AE";
          navspanEs[1].style.animationName = "navAnimate4BE";
          navspanEs[2].style.animationName = "navAnimate4CE";
          clicktrue=true;
        }
      }
    </script>
  </body>
</html>
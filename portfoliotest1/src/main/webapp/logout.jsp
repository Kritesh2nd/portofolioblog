<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Portfolio | Log Out</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <style>
      .mainbody{height:100vh;width:100%;}
      .broomA1{height:60px;overflow: hidden;position:fixed;width:100%;z-index:1;}
      .broomA2{padding:60px 0 100px 0;flex-grow: 1;}
      .ibroomA2{flex-grow: 1;}
      .bloginsertform{padding:20px;border-radius:5px;}
      @media only screen and (max-width: 450px) {
        .broomA1{height:100vh;}
        .broomA2{padding-bottom:120px;}
      }
      .logoutbox1{width:220px;font-size:20px;font-weight:300;text-align: center;padding-bottom:15px;}
      .submitcancelbtn{font-size:18px;font-weight:300;padding:3px 15px;color:#000;text-decoration:none;cursor: pointer;}
      .submitbtn{background:#ff4444;color:#fff;border:none;}
    </style>
  </head>
  <body>
    <div class="mainbody borde">
      <div class="inrmainbody borde h100 flex fdc">
        <div class="broomA1 borde w100">
            <%@ include file="navbar.jsp" %>
        </div>
        <div class="broomA2 borde flex fdc">
          <div class="ibroomA2 borde flex jcc aic">
            <form action="logout.jsp" method="post" class="bloginsertform border3 flex fdc">
            <%
                String nlogoutstr = request.getParameter("nlogout");
                if(nlogoutstr!=null){
                    if(nlogoutstr.equals("Log Out")){
                        session.removeAttribute("uemail");
                        response.sendRedirect("index.jsp");
                    }
                }
            %>
              <div class="logoutbox1 borde">
                Are you sure you want to log out?
              </div>
              <div class="logoutbox2 borde flex jcsa">
                <input type="submit" class="submitbtn submitcancelbtn" value="Log Out" name="nlogout">
                <a href="index.jsp" class="cancelbtn submitcancelbtn border3">Cancel</a>
              </div>
            </form>
          </div>
        </div>
        <div class="broomA3 borde"></div>
      </div>
    </div>
  </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "blog";
String userid = "root";
String password = "";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String btn = request.getParameter("button");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Notice Board | Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <style>
      .mainbody{height:100vh;}
      .box1{}
      .box2{flex-grow: 1;}
      .form{padding:25px;border-radius:3px;width:350px;}
      .formtitle{font-size:26px;text-align:center;}
      .formtxt0{font-size:18px;padding:5px 0 5px 0;}
      .inpbox0{width:100%;font-size:18px;padding:5px 7px;border-radius:3px;}
/*      .formtxt3{padding:5px 0 5px 0;}*/
      .formmsg1{font-size:15px;padding:5px 0 0 0;}
      .btnbox1{padding-top:5px;}
      .submitbtn{background:#007bff;color:#fff;padding:10px 20px;border-radius:3px;border:none;font-size:17px;cursor:pointer;}
      .btnbox2{padding-top:10px;}
      .ahrlink{color: #000;}
     
      .formmsgbox{padding-top:5px;}
      .borderx1{border:1px solid #999;}
    </style>
  </head>
  <body>
    <div class="mainbody flex fdc">
      <div class="box1 borde">
          <%@ include file="navbar.jsp" %>
      </div>
      <div class="box2 borde flex aic jcc">
        <form action="register.jsp" method="POST" class="form borderx1">
            <%
              boolean registertrue = false;
              if(btn!=null){
                if(btn.equals("Register")){
                  registertrue = true;
                } 
              }
              String inpname = request.getParameter("name");
              String inpemail = request.getParameter("email");
              String inppassword = request.getParameter("password");
              String inpuname = request.getParameter("username");
              String tblemail="",tbluname="";
              boolean inputempty=true,emailregister=false,usernameexist=false,registersucess=false;
//              out.print("Name = "+inpname+"<br/>Email = "+inpemail+"<br/>Password = "+inppassword+"<br/>Class = "+inpclass+"<br/>");
              try{
              String sql;
              Class.forName("com.mysql.jdbc.Driver");  
              connection = DriverManager.getConnection(connectionUrl+database, userid, password);
              statement=connection.createStatement();
              sql = "select * from userinfo";
              resultSet = statement.executeQuery(sql);
              while(resultSet.next()&&emailregister==false){
                tblemail = resultSet.getString("email");
                if(tblemail.equals(inpemail)){
                    emailregister=true;
                }
              }
              resultSet = statement.executeQuery(sql);
              while(resultSet.next()&&usernameexist==false){
                tbluname = resultSet.getString("username");
                if(tbluname.equals(inpuname)){
                    usernameexist=true;
                }
              }
              if(inpname!=null&&inpemail!=null&&inppassword!=null&&inpuname!=null){
                if(!inpname.equals("")&&!inpemail.equals("")&&!inppassword.equals("")&&!inpuname.equals("null")){
                    inputempty=false;
                }
              }
              
              if(inputempty==false&&emailregister==false&&usernameexist==false){
                sql = "insert into userinfo(name,email,password,username,utype)values('"+inpname+"','"+inpemail+"','"+inppassword+"',"+inpuname+",'user');";
                statement.executeUpdate(sql);
                session.setAttribute("uemail",inpemail);
                response.sendRedirect("blog.jsp");
              }
              connection.close();
              }catch(Exception ex) {
              System.out.println(ex.toString());
              }
            %>
            
          <div class="formtitle">Register</div>
          <div class="formtxt1 formtxt0 borde">Name</div>
          <input type="text" class="inpbox1 inpbox0 borderx1" name="name" <%if(registertrue){%>value=<%out.print(inpname);}%>>
          <div class="formmsg1 formtxt0 borde"></div>
          <div class="formtxt1 formtxt0 borde">Email</div>
          <input type="text" class="inpbox2 inpbox0 borderx1" name="email" <%if(registertrue){%>value=<%out.print(inpemail);}%>>
          <div class="formmsg1 formtxt0 borde">
            <%if(emailregister){out.print("This email is already registered.");}%>
          </div>
          <div class="formtxt3 formtxt0 borde">User name</div>
          <input type="text" class="inpbox3 inpbox0 borderx1" name="username" <%if(registertrue){%>value=<%out.print(inpuname);}%>>
          <div class="formmsg1 formtxt0 borde">
            <%if(usernameexist){out.print("This username already exists.");}%>
          </div>
          <div class="formtxt4 formtxt0 borde">Password</div>
          <input type="text" class="inpbox4 inpbox0 borderx1" name="password">
          <div class="formmsg1 formtxt0 borde"></div>
          <div class="formmsgbox borde">
            <%
              if(inputempty==true && registertrue==true){
                out.print("Please fill in all boxes.");
              }
              else if(inputempty==false&&emailregister==false&&usernameexist==false&&registertrue==true){
                  out.print("Successfully registered");
                  
              }
            %>  
          </div>
          <div class="btnbox1 borde">
            <input type="submit" class="submitbtn w100" value="Register" name="button">
          </div>
          <div class="btnbox2 flex jcc">
            <a href="login.jsp" class="ahrlink ">
              Go to Log In
            </a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
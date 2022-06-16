<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sessemail = String.valueOf(session.getAttribute("uemail"));
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "blog";
String userid = "root";
String password = "";
String sql="",sql1="",sql2="",sql3="";
Connection con=null,con1=null,con2=null,con3=null;
Statement stm=null,stm1=null,stm2=null,stm3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null;
String inpusrname="";
inpusrname = request.getParameter("inpusername");
try{
    Class.forName("com.mysql.jdbc.Driver");  
    con = DriverManager.getConnection(connectionUrl+database, userid, password);
    stm=con.createStatement();
    sql ="select * from users;";
    rs = stm.executeQuery(sql);
    while(rs.next()){
    }
    con.close();
}
catch(Exception ex) {
    System.out.println(ex.toString());
    out.print("ERROR: "+ex.toString());
}
//"Select * from users where USERNAME=? and PASSWORD=?"
%>
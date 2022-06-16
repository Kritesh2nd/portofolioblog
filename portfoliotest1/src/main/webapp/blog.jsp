 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.*,java.util.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sessemail = String.valueOf(session.getAttribute("uemail")),sessname="",sessusername="",sessutype="";
String blogupdatestr="";
int sessuserid=0;
boolean sessadmin=false;
if(sessemail.equals("null")){
  response.sendRedirect("login.jsp");
  out.print("user email = "+sessemail);
}
else if(!sessemail.equals("")){
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "blog";
String userid = "root";
String password = "";
String sql="",sql1="",sql2="",sql3="";
Connection con=null,con1=null,con2=null,con3=null;
Statement stm=null,stm1=null,stm2=null,stm3=null;
ResultSet rs=null,rs1=null,rs2=null,rs3=null;

try{
Class.forName("com.mysql.jdbc.Driver");  
con = DriverManager.getConnection(connectionUrl+database, userid, password);
stm=con.createStatement();
sql ="select * from userinfo where email='"+sessemail+"';";
rs = stm.executeQuery(sql);
while(rs.next()){
  sessname = rs.getString("name");
  sessusername = rs.getString("username");
  sessutype = rs.getString("utype");
  sessuserid = rs.getInt("userid");
}
if(sessutype.equals("admin")){sessadmin=true;}
con.close();
}catch(Exception ex) {
System.out.println(ex.toString());
}

String imgupload = request.getParameter("imgupload");
String imgcount = request.getParameter("imgcount");
String blogcmt = request.getParameter("blogcomment");
String blogedit = request.getParameter("blogedit");
String blogdel = request.getParameter("blogdelete");
blogupdatestr = request.getParameter("blogupdate");
boolean showblogcmt=false,showblogedit=false,showblogdelete=false;
int blogcmtint=0,blogeditint=0,blogdelint=0,blogupdated=0;
int imgsucs=0;
int imgcountint=0;
if(imgupload!=null){
    if(imgupload.equals("success")){imgsucs=1;imgcountint=Integer.parseInt(imgcount);}
    else if(imgupload.equals("fail")){imgsucs=2;}
}
if(blogupdatestr!=null){
    if(blogupdatestr.equals("success")){blogupdated=1;}
    else if(blogupdatestr.equals("fail")){blogupdated=2;}
}
if(blogcmt!=null){showblogcmt=true;blogcmtint=Integer.parseInt(blogcmt);}
if(blogedit!=null){showblogedit=true;blogeditint=Integer.parseInt(blogedit);}
if(blogdel!=null){showblogdelete=true;blogdelint=Integer.parseInt(blogdel);}
%> 
<!DOCTYPE html>
<html>
  <head>
    <title>Portfolio | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <style>
      ::-webkit-scrollbar {width: 10px;}
      ::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      ::-webkit-scrollbar-thumb{background:rgba(170,170,170,.2);border-radius:10px;transition: 0.3s;}
      ::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .mainbody{height:auto;width:100%;}
      .broomA1{height:60px;overflow: hidden;position:fixed;width:100%;z-index:1;}
      .broomA2{padding:60px 0;min-height:100vh;padding-bottom:200px;}
      .ibroomA2{height:auto;}
      .insertroom{padding:0 200px;}
      .a2topboxA,.a2topboxB{width:50%;font-weight:300;}
      .a2topboxA{font-size:34px;}
      .formopt0{height:34px;width:34px;font-size:22px;border-radius:4px;background:#ccc;margin-left:10px;cursor: pointer;}
      .formopt0:nth-child(1){background:#4285F4;color:#fff;}
      .far1left{width:55%;padding:20px 20px 10px 0;}
      .far1right{width:45%;padding:20px 0 10px 20px;}
      .hidden{height:1px;width:1px;opacity:0.01;}
      .fainp1{font-size:18px;font-weight:300;padding:5px 10px;border:1px solid #aaa;border-radius:8px;
        margin-bottom:10px;width:100%;}
      .fainp2{font-size:16px;font-weight:300;padding:5px 10px;border:1px solid #aaa;border-radius:8px;
        resize:none;height:120px;width:100%;}
      .fabox3{border-radius:8px;overflow: hidden;}
      .fabox3img{z-index:-1;}
      .fab3imgbox{z-index:-2;background-size: cover;}
      .fab3imgboxedit{z-index:-2;background-repeat: no-repeat;
        background-size: cover;overflow: hidden;}
      .fAroom3{padding-bottom:5px;font-size:16px;font-weight:300;}
      .uploadimgbtn{font-size:18px;padding:7px 20px;border-radius:3px;background:#4285F4;color:#fff;
        cursor: pointer;}
      .postcancelbtn{font-size:18px;padding:5px 20px;border-radius:3px;border:none;color:#fff;cursor: pointer;}
      .postblog{background:#4285F4;margin-right:10px;}
      .cancelblog{background:#ff4444;text-decoration: none;}
      @media only screen and (max-width: 450px) {
        .broomA1{height:60px;overflow: hidden;position:fixed;width:100%;z-index:1;}
        .broomA2{padding:0;padding-top:60px;}
        .insertroom{padding:0 20px;}
        .binserttop{flex-direction:column;}
        .a2topboxA,.a2topboxB{width:100%;padding-top:10px;}
        .a2topboxB{justify-content:flex-start;}
        .formopt0{margin:0 10px 0 0;}
        
        .binsertbelow{padding-top:20px;}
        .fAroom1{flex-direction:column;}
        .far1left,.far1right{width:100%;padding:0 0 5px 0;}
        .far1right{height:100px;padding-bottom:10px;}
      }

      /* =============================================== Display Room =============================================== */
      .displayroom{padding:0 200px;padding-top:50px;}
      .inrdisplayroom{padding-bottom:50px;overflow:hidden;}
      .discontrolid{width:100%;top:-95px;}
      @media only screen and (max-width: 450px) {}
      /* =============================================== dr level 1 =============================================== */
      .drl1r1{width:55%;padding:20px 20px 10px 0;}
      .drl1txt0{font-weight:300;}
      .drl1txt1{font-size:34px;}
      .drl1txt2{font-size:13px;color:#777;}
      .drl1txt3{font-size:16px;line-height:30px;padding:10px 0;}
      .drl1r2{width:45%;padding:20px 10px 10px 10px;}
      .drl1imagebox{box-shadow:0 0 10px rgba(0,0,0,.8);border-radius:5px;padding:10px;}
      @media only screen and (max-width: 450px) {
        .inrdrlevel1show{flex-direction:column;}
        .drl1txt1{font-size:30px;}
        .drl1txt2{font-size:12;}
        .drl1txt3{font-size:16px;line-height:25px;padding:5px 0;}
        .drl1r1,.drl1r2{width:100%;padding:0;}
        .drl1r2{padding:0 0 12px 0;}
      }  
/*       =============================================== dr level 2 =============================================== */
      .drl2ctrlbtn0{height:30px;width:30px;margin-right:30px;cursor:pointer;}
      .ahrdrl2ctrlbtn1{cursor:pointer;border:none;}
      @media only screen and (max-width: 450px){
        .drl2ctrlbtn0{height:25px;width:25px;margin-right:20px;}
      }
      /* =============================================== dr level 3 =============================================== */
      .drlevel3{font-size:16px;padding:5px 0 10px 0;}
      @media only screen and (max-width: 450px) {
        .drlevel3{font-size:16px;padding:5px 0;}
      }
      /* =============================================== dr level 4 =============================================== */
      .drlevel4{max-height:160px;overflow:auto;}
      .inrdrlevel4{padding:15px 0 10px 0;}
      .drl4span1{height:1px;width:100%;left:0;bottom:0;background:#777;}
      .drl4box1{width:6%;}
      .drl4b1imgbox{height:45px;width:45px;border-radius:50%;overflow:hidden;box-shadow:0 0 4px rgba(0,0,0,1);margin:2px;}
      .drl4box2{width:90%;}
      .drl4b2txt1{font-size:15px;font-weight:500;}
      .drl4b2txt2{font-size:15px;}
      .drl4box3{width:4%;}
      .drl4likebtn{height:16px;width:16px;cursor: pointer;}
      .drl4likecount{font-size:14px;padding-top:2px;}
      @media only screen and (max-width: 450px) {
          .inrdrlevel4{padding:5px 0;}
          .drl4box1{display:none;}
          .drl4box2{width:95%;}
          .drl4box3{width:5%;}
      }
      /* =============================================== dr level 5 =============================================== */
      .inrdrlevel5{max-height:120px;overflow:auto;padding:5px 0 15px 0;}
      .drl5span1{height:1px;width:100%;left:0;bottom:0;background:#777;}
      .drl5box2{width:85%;}
      .drl5box3{width:9%;}
      .drl5form{width:96%;}
      .drl5formbox1{flex-grow:1;padding-left:10px;}
      .drl5inp{font-size:18px;font-weight:300;padding:5px 10px;border:1px solid #aaa;border-radius:8px;width:100%;}
      .drl5submitbtn{font-size: 18px;padding: 7px 20px;border-radius: 10px;margin-left: 15px;background: #4285F4;
        border: none;cursor: pointer;color: #fff;transition: .3s;font-weight: 300;}
      @media only screen and (max-width: 450px) {
        .inrdrlevel5{padding:5px 0 10px 0;}
        .drl5form{width:100%;}
        .drl5formbox1{width:100%;padding:0;}
      }
      /* =============================================== dr level 1 edit =============================================== */
      .drl1edittitle{font-size:26px;font-weight:300;padding-top:30px;}
      .fainp1edit{font-size:20px;}
      @media only screen and (max-width: 450px) {}
      /* =============================================== dr level 1 delete =============================================== */
      .drlevel1delete{background:rgba(255,255,255,.7);}
      .confirmdelete{padding:20px;border-radius:5px;background:#fff;box-shadow:0 0 4px rgba(0,0,0,0.8);}
      .cdtxt1{width:240px;text-align: center;padding-bottom:15px;font-weight:300;font-size:18px;}
      .dltblog{background:#ff4444;margin-right:10px;}
      .cancelblog1{background:#fff;text-decoration: none;color:#000;border:1px solid #777;}
      @media only screen and (max-width: 450px) {}
      
      .drlevel1edit{padding-bottom:15px}
      @media only screen and (max-width: 450px) {
         /* =============================================== Display Room =============================================== */
        .displayroom{padding:30px 20px 10px 20px;}
        .inrdisplayroom{padding-bottom:15px;}
      }
    </style>
  </head>
  <body>
    <div class="mainbody borde w100">
      <div class="inrmainbody borde h100">
          <div class="broomA1 borde w100">
              <%@include file="navbar.jsp"%>
          </div>
        <div class="broomA2 borde">
          <div class="ibroomA2 borde flex fdc">
<!--            insert room start down div -->
            <%if(sessadmin){%>
            <div class="insertroom borde flex fdc">
              <div class="binserttop borde flex">
                <div class="a2topboxA borde">
                  Create a blog
                </div>
                <div class="a2topboxB borde flex jcfe aic">
                  <div class="formopt1 formopt0 flex jcc aic borde">1</div>
                  <div class="formopt2 formopt0 flex jcc aic borde">2</div>
                  <div class="formopt3 formopt0 flex jcc aic borde">3</div>
                  <div class="formopt4 formopt0 flex jcc aic borde">4</div>
                </div>
              </div>
              <div class="binsertbelow borde">
                <form method="post" action="fileuploadservlet" enctype="multipart/form-data" class="bloginsertform borde">
                  <div class="fAroom1 borde flex">
                    <div class="far1left borde">
                      <div class="fabox1 borde">
                        <input type="hidden" class="inputdate" name="nblogdate">
                        <input type="text" class="fainp1 border3" name="nblogtitle" placeholder="blog post title..." value="">
                      </div>
                      <div class="fabox2 borde">
                        <textarea class="fainp2 border3" name="nblogcontent" placeholder="write your blog here..."></textarea>
                      </div>
                    </div>
                    <div class="far1right bord flex aic jcc rel w100">
                      <div class="fabox3 border3 flex aic jcc rel ins">
                          <div class="fab3imgbox abs borde ins">
                          </div>
                        <label class="uploadimgbtn borde" for="insertimageid">
                            Upload Image
                        </label>
                        <input type="file" id="insertimageid" class = "abs hidden" accept="image/jpeg, image/png, image/jpg"  name="file">
                      </div>
                    </div>
                  </div>
                  <div class="fAroom3 borde">
                    <!-- <%
                        if(imgsucs==1){out.print("<script>alert('Blog uploaded sucessfull.');</script>");}
                        else if(imgsucs==2){out.print("Please fill all input boxes and upload image.");}
                    %> -->
                  </div>
                  <div class="fAroom2 borde">
                    <input type="submit" class="postblog postcancelbtn" value="Post">
                    <input type="reset" class="cancelblog postcancelbtn" value="Reset">
                  </div>
                </form>
              </div>
            </div>
            <%}%>
<!--            insert room end up div-->
            <div class="displayroom borde">
<!--              from here-->
            <%
                String tbltitle="",tblcontent="",tblimgpath="",tbldate="";
                int tblblogid=0;
                try{
                Class.forName("com.mysql.jdbc.Driver");  
                con = DriverManager.getConnection(connectionUrl+database, userid, password);
                stm=con.createStatement();
                sql ="select * from blog";
                rs = stm.executeQuery(sql);
                while(rs.next()){
                    tblblogid = rs.getInt("bid");
                    tbltitle = rs.getString("title");
                    tblcontent = rs.getString("content");
                    tbldate = rs.getString("date");
                    tblimgpath = rs.getString("imgpath");
                
            %>
              <div class="inrdisplayroom borde flex fdc rel">
                <div class="discontrolid abs borde" id="blogpost<%=tblblogid%>"></div>
                <div class="drlevel1 borde flex fdc">
                  <%if(!showblogedit || (showblogedit&&blogeditint!=tblblogid)){%>
                  <div class="drlevel1show flex fdc rel">
                    <div class="inrdrlevel1show flex rel borde">
                      <div class="drl1r1 borde">
                        <div class="drl1txt1 drl1txt0 borde"><%=tbltitle%></div>
                        <div class="drl1txt2 drl1txt0 borde"><%=tbldate%></div>
                        <div class="drl1txt3 drl1txt0 borde">
                          <%=tblcontent%>
                        </div>
                      </div>
                      <div class="drl1r2 borde">
                        <div class="drl1imagebox borde h100">
                            <img src="upload/<%=tblimgpath%>" alt="" class="drl1image w100">
                        </div>
                      </div>
                    </div>
                    <%if(showblogdelete&&blogdelint==tblblogid){%>
                    <div class="drlevel1delete borde abs flex jcc aic ins this">
                      <div class="confirmdelete borde flex fdc">
                        <div class="cdtxt1">Are you sure you want to delete this blog</div>
                        <form action="deleteblog" method="post" class="dltform">
                          <input type="hidden" value="<%=tblblogid%>" name="delblog">
                          <input type="submit" value="Delete" name="delbtn" class="dltblog postcancelbtn">
                          <a href="blog.jsp?#blogpost<%=tblblogid%>" class="cancelblog1 postcancelbtn border">Cancel</a>
                        </form>
                      </div>
                    </div>
                    <%}%>
                  </div>
                  <%}else if(showblogedit&&blogeditint==tblblogid){%>
                  <div class="drlevel1edit flex fdc rel borde this">
                    <div class="drl1edittitle borde">
                      Edit this blog post
                    </div>
                    <form method="post" action="updateblog" enctype="multipart/form-data" class="bloginsertform borde w100">
                      <input type="hidden" value="<%=tblblogid%>" name="updblogid">
                      <div class="fAroom1 borde flex">
                        <div class="far1left borde">
                          <div class="fabox1 borde">
                              <input type="text" class="fainp1 fainp1edit border3" name="updblogtitle" placeholder="blog post title..." value="<%=tbltitle%>">
                          </div>
                          <div class="fabox2 borde">
                            <textarea class="fainp2 border3" name="updblogcontent" placeholder="write your blog here..."><%=tblcontent%></textarea>
                          </div>
                        </div>
                        <div class="far1right borde flex aic jcc rel w100">
                          <div class="fabox3 border3 flex aic jcc rel ins">
                              <div class="fab3imgboxedit abs borde ins">
                              </div>
                              <label class="uploadimgbtn borde" for="image-input-update">
                                  Upload Image
                              </label>
                            <input type="file" id="image-input-update" class = "abs hidden" accept="image/jpeg, image/png, image/jpg"  name="updfile">
                          </div>
                        </div>
                      </div>
                      <div class="fAroom3 borde">
                        <%
                            if(blogupdated==1){out.print("<script>alert('Blog updated sucessfull.');</script>");}
                            else if(blogupdated==2){out.print("Please fill all input boxes and upload image.");}
                        %> 
                      </div>
                      <div class="fAroom2 borde">
                        <input type="submit" class="postblog postcancelbtn" value="Update">
                        <a href="blog.jsp?#blogpost<%=tblblogid%>"  class="cancelblog postcancelbtn" >Cancel</a>
                      </div>
                    </form>
                  </div>
                  <%}%>
                </div>
                <div class="drlevel2 borde flex">
                  <div class="drl2ctrlbtn1 drl2ctrlbtn0 borde">
                    <%
                        int likeuid=0,likebid=0,likecount=0,likeuid_=0,likebid_=0,newlikeuid=0,newlikebid=0;
                        boolean heartred=false;
                        try{
                        Class.forName("com.mysql.jdbc.Driver");  
                        con1 = DriverManager.getConnection(connectionUrl+database, userid, password);
                        stm1=con1.createStatement();
                        stm2=con1.createStatement();
                        sql1 ="select * from likes";
                        rs1 = stm1.executeQuery(sql1);
                        rs2 = stm2.executeQuery(sql1);
                        while(rs1.next()){
                            likeuid_ = rs1.getInt("uid");
                            likebid_ = rs1.getInt("bid");
                            if(likebid_==tblblogid&&likeuid_==sessuserid){
                                heartred=true;
                            }
                        }
                        while(rs2.next()){
                            likeuid = rs2.getInt("uid");
                            likebid = rs2.getInt("bid");
                            if(likebid==tblblogid){likecount++;newlikebid=likebid;}
                        }
                        con1.close();
                        }catch(Exception ex) {
                        System.out.println(ex.toString());
                        }
                    %>
                    <form action="bloglikes" method="post" class="borde ins">
                        <input type="hidden" name="heartred" value="<%=heartred%>">
                        <input type="hidden" name="blikeuid" value="<%=sessuserid%>">
                        <input type="hidden" name="blikebid" value="<%=tblblogid%>">
                        <button class="ahrdrl2ctrlbtn1 ahrdrl2ctrlbtn0 borde ins">
                            <%if(heartred){%>
                                <%@include file="svg/heartred.html"%>
                            <%}else{%>
                                <%@include file="svg/heart.html"%>
                            <%}%>
                        </button>
                    </form>
                    <a href="#blogpost<%=tblblogid%>" class="ahrdrl2ctrlbtn1 ahrdrl2ctrlbtn0 borde none"></a>
                  </div>
                  <div class="drl2ctrlbtn2 drl2ctrlbtn0 borde">
                    <a href="blog.jsp?blogcomment=<%=tblblogid%>#blogpost<%=tblblogid%>" class="ahrdrl2ctrlbtn2 ahrdrl2ctrlbtn0">
                      <%@include file="svg/comment.html"%>
                    </a>
                  </div>
                  <div class="drl2ctrlbtn3 drl2ctrlbtn0 borde">
                    <a href="#blogpost<%=tblblogid%>" class="ahrdrl2ctrlbtn3 ahrdrl2ctrlbtn0">
                      <%@include file="svg/send.html"%>
                    </a>
                  </div>
                  <%if(sessadmin){%>
                  <div class="drl2ctrlbtn4 drl2ctrlbtn0 borde">
                    <a href="blog.jsp?blogdelete=<%=tblblogid%>#blogpost<%=tblblogid%>" class="ahrdrl2ctrlbtn4 ahrdrl2ctrlbtn0">
                      <%@include file="svg/trash.html"%>
                    </a>
                  </div>
                  <div class="drl2ctrlbtn5 drl2ctrlbtn0 borde">
                    <a href="blog.jsp?blogedit=<%=tblblogid%>#blogpost<%=tblblogid%>" class="ahrdrl2ctrlbtn5 ahrdrl2ctrlbtn0">
                      <%@include file="svg/edit.html"%>
                    </a>
                  </div>
                  <%}%>
                </div>
                <div class="drlevel3 borde">
                  <%
                    if(likecount==0||likecount==1){out.print(likecount+" like");}
                    else {out.print(likecount+" likes");}
                  %>
                </div>
                <%if(showblogcmt&&blogcmtint==tblblogid){%>
                <div class="drlevel4 borde">
                  <%
                    try{
                        String commentstr="",cmtusername="";
                        int cmtbid=0,cmtuid=0;
                        Class.forName("com.mysql.jdbc.Driver");  
                        con = DriverManager.getConnection(connectionUrl+database, userid, password);
                        stm1=con.createStatement();
                        stm2=con.createStatement();
                        sql1 ="select * from comment;";
                        rs1 = stm1.executeQuery(sql1);
                        while(rs1.next()){
                            cmtbid = rs1.getInt("bid");
                            cmtuid = rs1.getInt("uid");
                            commentstr = rs1.getString("content");
                            sql2 ="select * from userinfo where userid="+cmtuid+";";
                            rs2 = stm2.executeQuery(sql2);
                            while(rs2.next()){
                                cmtusername = rs2.getString("username");
                            }
                            if(tblblogid==cmtbid){
                  %>
                  <div class="inrdrlevel4 borde rel">
                    <span class="drl4span1 abs"></span>
                    <div class="drlevel4thisbox borde flex">
                      <div class="drl4box1 borde">
                        <div class="drl4b1imgbox">
                          <img src="image/person.jpg" alt="" class="drl4b1img w100">
                        </div>
                      </div>
                      <div class="drl4box2 borde">
                        <div class="drl4b2txt1 borde">@<%=cmtusername%></div>
                        <div class="drl4b2txt2 borde">
                          <%=commentstr%>
                        </div>
                      </div>
                      <div class="drl4box3 borde flex fdc">
                        <div class="drl4likebox flex fdc aic">
                          <div class="drl4likebtn borde">
                            <%@include file="svg/heart.html"%>
                          </div>
                          <div class="drl4likecount borde"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%
                        }}
                        con.close();
                    }
                    catch(Exception ex) {
                        System.out.println(ex.toString());
                    }
                  %>
                </div>
                <%}%>
                <div class="drlevel5 borde">
                  <div class="inrdrlevel5 borde rel">
                    <span class="drl5span1 abs"></span>
                    <div class="drlevel4thisbox borde flex">
                      <div class="drl4box1 borde">
                        <div class="drl4b1imgbox borde">
                          <img src="image/person.jpg" alt="" class="drl4b1img w100">
                        </div>
                      </div>
                      <form action="comment" method="post" class="drl5form borde flex">
                        <div class="drl5formbox1 borde flex aic">
                          <input type="hidden" value="<%=tblblogid%>" name="ncmtbid">
                          <input type="hidden" value="<%=sessuserid%>" name="ncmtuid">
                          <input type="text" class="drl5inp" placeholder="add a comment..." name="ncommet">
                        </div>
                        <div class="drl5formbox2 borde flex aic">
                          <input type="submit" value="Post" class="drl5submitbtn">
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            <%
                }              
                con.close();
                }catch(Exception ex) {
                System.out.println(ex.toString());
                }
            %>
<!--              to here-->
            </div>
          </div>
        </div>
        <div class="broomA3 borde">
          <%@include file="footer.html"%>
        </div>
      </div>
    </div>
    <script>
      
      var inputdate = document.querySelector(".inputdate");
      setInterval(()=>{
        var d=new Date(),hr=d.getHours(),min=d.getMinutes(),ap="AM",dt=d.getDate(),mt=d.getMonth(),mth,ddate;
        switch(mt){
        case 0:mth="January";break;
        case 1:mth="February";break;
        case 2:mth="March";break;
        case 3:mth="April";break;
        case 4:mth="May";break;
        case 5:mth="June";break;
        case 6:mth="July";break;
        case 7:mth="August";break;
        case 8:mth="September";break;
        case 9:mth="October";break;
        case 10:mth="November";break;
        case 11:mth="December";break;
      }
      if(hr>12){hr=hr-12;hr=hr.toString();hr="0"+hr;ap="PM";}
      if(hr<10){hr=hr.toString();hr="0"+hr;}
      if(min<10){min=min.toString();min="0"+min;}
      ddate=hr+":"+min+" "+ap+" "+dt+" "+mth;
      inputdate.value=ddate;
      console.log(ddate);
      },100);
      
    </script>
    <Script>
      const insertimageid = document.getElementById("insertimageid");
      const fab3imgbox = document.querySelector(".fab3imgbox");
      insertimageid.addEventListener("change", function() {
        console.log("one");
        const readerinsert = new FileReader();
        readerinsert.addEventListener("load", () => {
            console.log("two",insertimageid.value);
          const insert_image = readerinsert.result;
          console.log("three",insert_image);
          document.querySelector(".fab3imgbox").style.backgroundImage = `url(${insert_image})`;
        });
        readerinsert.readAsDataURL(this.files[0]);
        console.log("five");
      });
//      const image_input = document.querySelector("#image-input");
//      image_input.addEventListener("change", function() {
//        const reader = new FileReader();
//        reader.addEventListener("load", () => {
//          const uploaded_image = reader.result;
//          document.querySelector(".fab3imgbox").style.backgroundImage = `url(${uploaded_image})`;
//        });
//        reader.readAsDataURL(this.files[0]);
//      });

//      const image_input_new = document.querySelector("#image-input-update");
//      image_input_new.addEventListener("change", function() {
//        const readernew = new FileReader();
//        readernew.addEventListener("load", () => {
//          const uploaded_image_new = readernew.result;
//          document.querySelector(".fab3imgboxedit").style.backgroundImage = `url(${uploaded_image_new})`;
//        });
//        readernew.readAsDataURL(this.files[0]);
//      });
    </Script>
  </body>
</html>
<%}%>

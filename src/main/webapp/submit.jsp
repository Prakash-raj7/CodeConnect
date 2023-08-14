<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
body{
background-color:#164464;
color:#FFFFFF;
}
.heading
{
margin-top:10vh;
text-align:center;
}
.heading a
{
 margin-right:3vw;
 color:#38E54D;
}
.signout
{
position:absolute;
margin-top:-35px;
margin-left:90%;
}
.name{
position:absolute;
margin-top:-35px;
margin-left:75%;
color:#D23369;

}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
           response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
           if(session.getAttribute("uname")==null)
           {
        	   out.println("please login First..");
        	   response.sendRedirect("login.jsp");
           }
      %>
<form action="logout" class="signout">
      <input type="submit" value="logout" />
      </form>
<div class="name">
<strong>Welcome ${uname}!!!</strong>

</div>

<div class="heading">
<img  src="free.png" width="738px" height="110px">
<br>
<a href="welcome2.jsp">Home Page</a>
<a href="latest.jsp">Latest Project</a>
<a href="Applied.jsp">My Applied Projects</a>
<br>
<br>
<h2>Project Submission</h2>
<hr>
<br>
</div>
<form action="submission" method="post" enctype="multipart/form-data">
Project Name:<input type="text" name="ppname" value=""/><br><br>
Select File<input type="file" name="file1" value=""/><br><br>
Details(How to execute etc...):<br>
<textarea rows="6" cols="60" name="details"></textarea><br><br>
<input type="submit" name="sub6" value="Submit"/>

</form>
</body>
</html>
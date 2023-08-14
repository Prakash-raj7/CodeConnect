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
<h2>Submitted Projects</h2>
<hr>
<br>
</div>
<form action="submitted" method="post" >
Project Name:<input type="text" name="file3" value=""/><br><br>


<input type="submit" name="sub7" value="Submit"/>
</form>

</body>
</html>
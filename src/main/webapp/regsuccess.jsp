<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  color:#73F847;
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
margin-left:80%;
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
<a href="welcome.jsp">Home Page</a>
<a href="new.jsp">Post New Project</a>
<a href="details.jsp">My Past Projects</a>
<br>
<br>
<hr>
<br>
</div>
<br>
<h2>Project Registration Successfull...</h2>

</body>
</html>
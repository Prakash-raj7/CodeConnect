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
hr{
width:80%;
height:5px;
background-color:#4FA095;
height:5px;
border:none;
}
p{
width:50%;
line-height:30px;

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
<a href="latest.jsp">Latest Projects</a>
<a href="Applied.jsp">My Applied Projects</a>
<br>
<br>
<hr>
<br>
<center><p>Thank You for logging in !!!! Click on any one of the links above. By clicking "Latest Projects" you can view all the latest projects available. You can click on a particular project to view the details of that project. After viewing, you can pose questions (if any) related to the project. And if you are interested you can bid for the project.
</p></center>
<center><p>By clicking "My Applied Projects" you can view all the projects that you have bid. You can click on a particular project to view the details of that project. You can view the status of the project, queries and answers of the queries posed by you.</p></center>
</div>
</body>
</html>
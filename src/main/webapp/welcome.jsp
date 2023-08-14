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
<a href="welcome.jsp">Home Page</a>
<a href="new.jsp">Post New Project</a>
<a href="details.jsp">My Past Projects</a>
<br>
<br>
<hr>
<br>
<center><p>Thank You for logging in !!!! Click on any one of the links above.

By clicking "Post New Project" you can post a project that you want programmers to do within a specified time. You can specifiy the languages and backend to be used in the project and also specify the minimum and maximum bid that can be put by programmers.
</p></center>
<center><p>By clicking "My Past Projects" you can view the list of projects posted by you. You can also view the bids of various programmers interested in your project. If the programmers have any queries, you can also answer them.</p></center>
</div>
</body>
</html>
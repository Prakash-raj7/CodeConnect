<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
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
<hr>
<br>
</div>

<center><h2>List of Queries</h2></center>
<% 
    String question=request.getParameter("question");
    String role=(String)session.getAttribute("r");
    String answer=request.getParameter("answer");
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	
	st.executeUpdate("insert into queries(question) values('"+question+"')");
	
	out.println("Query submitted");
	
	con.close();
	
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</body>
</html>
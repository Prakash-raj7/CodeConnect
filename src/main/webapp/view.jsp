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
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	
	ResultSet rs=st.executeQuery("select *from queries");
	while(rs.next())
		
	{

		String question1=rs.getString("question");
		String answer1=rs.getString("answer");
		
		if(question1!=null){%>
		Question:<%=question1 %><% }%><br>
		<% if(answer1!=null){%>
		Answer :<%=answer1 %><%} %><br>
		<% 
	}
	con.close();
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</body>
</html>
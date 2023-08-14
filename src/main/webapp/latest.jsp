<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
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
.data
{
margin-left:50px;
font-size:20px;

}
.data a
{
color:#D23369;
}

.name{
position:absolute;
margin-top:-35px;
margin-left:75%;
color:#D23369;

}
hr{
text-align:center;
width:80%;
height:5px;
background-color:#4FA095;
height:5px;
border:none;
}
td,th{
padding:12px;
}
table, th, td {
  width:75vw;
  border: 1px solid black;
  border-collapse:collapse;
}
.data{
margin-left:-10px;
display:flex;
justify-content:center;
align-content:center;
text-align:center;

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
<center><h2>Latest Projects</h2></center>
<br>
<hr>
<br>
</div>
<div class="data">
<%
   
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select pname,project,buyer from projectDetails");
	%>
	<div>
	<table><tr><th>Project</th><th>Category</th><th>Buyer</th></tr>
	
	<% 
	while(rs.next())
		
	{
		String name = rs.getString("pname");
	    String category=rs.getString("project");
	    String buyer=rs.getString("buyer");
	 
		
		%>
		<tr><td>
		<strong><a href="projectDetails3.jsp?name=<%=name%>"><%=name %></a></strong></td>
		<td>
		<%=category %></td>
		<td>
		<strong><a href="profile.jsp?buyer=<%=buyer %>"><%=buyer %></a></strong>
		</td></tr>
		<% 
		
	}
	
	
	con.close();
}catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%></table>
</div>

</body>
</html>
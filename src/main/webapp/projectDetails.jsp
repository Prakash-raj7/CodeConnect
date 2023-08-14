<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
background-color:black;
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
.data
{
margin-left:50px;
font-size:20px;

}
table
{
border:1px solid white;
border-collapse:collapse;
width:80%;
border-spacing:20px;
margin-top:10vh;
color:white;
}
hr{
width:80%;
height:5px;
background-color:#4FA095;
height:5px;
border:none;
}
.tab{
display:flex;
justify-content:center;

}
td
{
width:50%;
border:1px solid white;
border-collapse:collapse;
padding-top:10px;
padding-bottom:10px;
padding-left:4px;
}
h2{
color:white;
}
.name{
position:absolute;
margin-top:-35px;
margin-left:75%;
color:#D23369;

}
.link{
display:flex;
justify-content:space-evenly;
margin-left:12vw;

}
.link a{
 color:#38E54D;
}
.text{

margin-left:174px;
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
<center><h2 >Project Details</h2></center>

<hr>
<br>
</div>
<div class="data">
<%

String name=(String)request.getParameter("name"); 
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from projectDetails where pname='"+name+"'");
	while(rs.next())
		
	{
		String type = rs.getString("project");
		String name1 = rs.getString("pname");
		String details = rs.getString("details");
		String langs = rs.getString("langs");
		%>
		<div class="tab">
		<table >
		<tr>
		<td>
	Project Category:	</td>
	<td>
	<%=type %></td></tr>
	<tr>
	<td>Project Name:</td><td>
	<%=name1 %></td></tr><tr>
	<td>Project Details: </td><td>
	<%=details %></td></tr><tr><td>Programming Options:</td>
<td><ul><li><%=langs %></li></ul></td></tr>
<tr><td>Database Options:</td><td><ul><li>MySQL</li></ul></td></tr>
		
		</table>
		</div>
		<% 
	}
	con.close();
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</div>
<div class="link">
<a href="#">Ask Query</a>
<a href="view.jsp">View Queries</a>
<a href="view.jsp">Bids</a>
<a href="submitted.jsp">Submitted_projects</a>
<br>
<br>

</div>
<div class="text">
<form action="queries2.jsp">
<label style="color:white">Type Your Reply here :</label><br>
<textarea name="answer" rows="8" cols="60"></textarea><br>

<input type="submit" name="sub4" value="Submit">
</form>
</div>

</body>
</html>
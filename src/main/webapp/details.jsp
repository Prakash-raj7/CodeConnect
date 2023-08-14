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
width:80%;
height:5px;
background-color:#4FA095;
height:5px;
border:none;
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
<center><h2>My Projects</h2></center>
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
	ResultSet rs=st.executeQuery("select pname from projectDetails");
	
	while(rs.next())
		
	{
		String name = rs.getString("pname");
	    
	 
		
		%>
		<strong><a href="projectDetails.jsp?name=<%=name%>"><%=name %></a></strong>
		<br>
		<br>
		<% 
		
	}
	
	con.close();

}catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</div>

</body>
</html>
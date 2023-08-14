<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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

.signout
{
position:absolute;
margin-top:-35px;
margin-left:90%;
}
.name{
position:absolute;
margin-top:-35px;
margin-left:78%;
color:#D23369;

}

.details
{
line-height:20px;
display:flex;
align-content:center;
justify-content:center;
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
<a href="details.jsp">My Applied Projects</a>
<br>
<h2>User Details</h2>
<br>
<hr>
<br>
</div>

<%
   String n=request.getParameter("buyer");
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select name,address,phone,email from register where name='"+n+"'");
	
	while(rs.next())
		
	{
		String name = rs.getString("name");
	    String address=rs.getString("address");
	    String phone=rs.getString("phone");
	    String email=rs.getString("email");
	 
		
		%>
		<div class="details">
<table><tr><td align="right">
		Username <b>:</b></td><td><%=name %></td></tr><tr><td align="right">
		Address <b>:</b></td><td><%=address %></td></tr><tr><td align="right">
		Mobile No.(+91) <b>:</b></td><td><%=phone %></td></tr><tr><td align="right">
		E-mail <b>:</b></td><td><%=email %></td></tr>
		</table>


	</div>
		<% 
		
	}con.close();
	
	

}catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>


</body>
</html>
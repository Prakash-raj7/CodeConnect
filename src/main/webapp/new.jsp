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
.signout
{
position:absolute;
margin-top:-35px;
margin-left:90%;
}
.label
{
margin-left:70px;
}
.pass
{
margin-left:20px;
}
.check{
margin-left:155px;
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
		
		<center><h2>Post New Project</h2></center>
		<hr>
		<br>
		</div>
		<div class="label">
		<form action="projectData" method="post">
		      <label>Project Category :</label><select name="type">
		      <option>software</option>
		      <option>web design</option>
		      </select>
		      <br>
		      <br>
		      Project Name :<input type="text" name="txt1" value="" class="pass">
		      <br>
		      <br>
		      <table>
		      <tr>
		      <td>
		      <label>Project Details :</label>
		      </td>
		      <td>
		      <textarea name="txt2"   rows="6" cols="50"></textarea>
		      </td>
		      </tr>
		      </table>
		      
		      Programming Options :
		       <input type="checkbox" name="language" value="ASP">ASP</input>
		      <input type="checkbox" name="language" value="C/C++">C/C++</input>
		      <input type="checkbox" name="language" value=".NET">.NET</input>
		      <br>
		      <div class="check">
		      <input type="checkbox" name="language" value="JSP">JSP</input>
		      <input type="checkbox" name="language" value="PHP">PHP</input>
		      <input type="checkbox" name="language" value="XML">XML</input>
		       <br>
		      
		       <br>
              
              </div>
              Budget(in Rs.):<input type="text" name="budget" value=""/>
              <table>
              <tr>
              <td>
               Buyer Name :</td><td ><input type="text" name="txt3" value="" ></td></tr>
               <tr><td></td><td><input type="submit" name="sub5" value="save"></td></tr>
               </table>
		</form>
		</div>
		
</body>
</html>
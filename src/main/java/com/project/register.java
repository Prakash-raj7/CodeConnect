package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setHeader("Cache-Control"," no-cache, no-store, must-revalidate");
	
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		          
		String name=request.getParameter("name");  
		String password=request.getParameter("password");  
		String radio=request.getParameter("radio2");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		 
		          
		try{  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");  
		  
		PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?)");  
		  
		ps.setString(1,name);  
		ps.setString(2,password);
		ps.setString(3, radio);
		ps.setString(4, address);
		ps.setString(5, email);
		ps.setString(6, phone);
		
		          
		int i=ps.executeUpdate();  
		if(i>0)  
		out.print("You are successfully registered...");  
		out.println("<br><a href='login.jsp'>Login</a>");
		      
		con.close();          
		}catch(Exception e2) 
		{
		System.out.println(e2);}  
		          
		out.close();  
		}  
	
}



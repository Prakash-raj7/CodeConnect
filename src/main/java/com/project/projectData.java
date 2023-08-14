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

@WebServlet("/projectData")
public class projectData extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();   
		
        
   
		
		          
		String project=request.getParameter("type");  
		String pname=request.getParameter("txt1");  
		String details=request.getParameter("txt2"); 
		String buyer=request.getParameter("txt3");
		String budget=request.getParameter("budget");
		String[] check=request.getParameterValues("language");  
		String langs=" ";
		for(int i=0;i<check.length;i++)
		{
			langs+=check[i]+" ";
		}
		          
		try{  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");  
		  
		PreparedStatement ps=con.prepareStatement("insert into projectDetails values(?,?,?,?,?,?)");  
		  
		ps.setString(1,project);  
		ps.setString(2,pname);  
		ps.setString(3,details);  
		ps.setString(4,langs);  
		ps.setString(5,buyer); 
		ps.setString(6,budget);
		int i=ps.executeUpdate();  
		if(i>0)  
		response.sendRedirect("regsuccess.jsp"); 
		
		      
		con.close();          
		}
		
		catch(Exception e2) 
		{
		System.out.println(e2);}  
		          
		out.close();  	
	}

}

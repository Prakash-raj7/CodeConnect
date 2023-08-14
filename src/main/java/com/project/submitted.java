package com.project;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/submitted")
public class submitted extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   response.setContentType("text/html");
	       String file=request.getParameter("file3");
	       String sql="select *from projectSub where name='"+file+"'";
	       PrintWriter out=response.getWriter();
		   
		try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");  
			              
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				String f=rs.getString(1);
				
				String details=rs.getString(3);
				out.println("  "+"File Name:"+f);
				out.println("<br>");
				out.println("  "+"How to Execute:"+details);
			Blob b=rs.getBlob(2);
			byte barr[]=b.getBytes(1,(int)b.length());
			FileOutputStream fos=new FileOutputStream("d:\\"+file);
			fos.write(barr);
			fos.close();
			}
			System.out.println("success");  
			}catch (java.lang.Exception e) {e.printStackTrace();  }  
			}
		
	}



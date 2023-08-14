package com.project;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/submission")
@MultipartConfig( maxFileSize = 16177215)
public class submission extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		   String ppname=request.getParameter("ppname");
		   String[] details=request.getParameterValues("details");
		   String detail="";
		   for(int i=0;i<details.length;i++) {
			   detail+=details[i]+" ";
		   }
		  
		   Part filePart = request.getPart("file1");
		   InputStream inputStream = null;
		   if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	            
	        }
            PrintWriter out=response.getWriter();
            try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

			PreparedStatement ps = conn.prepareStatement("insert into projectSub(name,project,details) values(?,?,?)");
			//InputStream  in = filePart.getInputStream();
			//File f=new File("");
			//FileInputStream fis=new FileInputStream(inputStream);
			ps.setString(1,ppname);
			
            ps.setBinaryStream(2,inputStream,inputStream.available());
	 
			ps.setString(3,detail);
			ps.executeUpdate();

             out.println("Uploaded Successfully");
			              
			}catch (java.lang.Exception e) {e.printStackTrace();}  
	
	}

}

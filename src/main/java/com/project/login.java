package com.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.Dao.LoginDao;


public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		PrintWriter out=response.getWriter();
		String n=request.getParameter("name1");
		String p=request.getParameter("password1");
		String r=request.getParameter("radio2");
		
          LoginDao dao=new LoginDao();
          response.setContentType("text/html");
          try {
		if(dao.check(n, p))
		{   
			
			HttpSession session=request.getSession();
			session.setAttribute("uname",n);
			session.setAttribute("r",r);
			if(r.equals("Buyer")) {
			response.sendRedirect("welcome.jsp");
			}
			if(r.equals("Programmer"))
			{
				response.sendRedirect("welcome2.jsp");
			}
		}
          
		if(dao.check(n, p)==false) {
			 out.println("Please Enter Correct Username and Password!");
	        	  
        	 out.println("<br>");
        	 out.println("<a href='index.html'>Login</a>");
		}
          }catch(Exception e) {
        	  out.println("Please enter Correct Data");
        	
        	 out.println("<br>");
        	 out.println("<a href='index.html'>Login</a>");
          }
		
	}

}

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


@WebServlet("/logout")
public class logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session =request.getSession();
		session.removeAttribute("uname");
		session.invalidate();
		
		
		
		
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		out.println("logouted");
		rd.forward(request, response);
		out.println("logouted");
		
	}

	
}

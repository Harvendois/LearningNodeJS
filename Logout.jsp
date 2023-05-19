<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <%
   		
   		//response.sendRedirect("Login.jsp");
   		session.setAttribute("loginForm","inherited");
   		session.setAttribute("logoutBtn","none");
   		response.sendRedirect("Login.jsp");
   %>
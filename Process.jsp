<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- Login Process here -->

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//원래는 DB에서 아이디와 비밀번호를 저장해두고 사용해야 하지만, 지금은 생략
if("CHO".equals(id) && "1234".equals(pwd)){
	session.setAttribute("loginForm", "none");
	session.setAttribute("logoutBtn", "block");
	response.sendRedirect("Login.jsp");
}
else{
	request.setAttribute("mismatchError", "아이디 비번 불일치");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}

%>
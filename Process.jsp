<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- Login Process here -->

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//������ DB���� ���̵�� ��й�ȣ�� �����صΰ� ����ؾ� ������, ������ ����
if("CHO".equals(id) && "1234".equals(pwd)){
	session.setAttribute("loginForm", "none");
	session.setAttribute("logoutBtn", "block");
	response.sendRedirect("Login.jsp");
}
else{
	request.setAttribute("mismatchError", "���̵� ��� ����ġ");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}

%>
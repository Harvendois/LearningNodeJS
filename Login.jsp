<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

%>	
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Login.jsp</title>
	<style>
        /*점보트론 세로폭 및 마진바툼 줄이기*/
        .jumbotron{
            padding-top:1rem;
            padding-bottom:1rem;            
            margin-bottom: .5rem;
            
            border-top-left-radius:0;
            border-top-right-radius:0;
        }
    </style>
</head>
<body>
	<div class="container" style="margin-top:50px">
		<div class="jumbotron bg-info">
			<h1>로그인</h1>            
		</div><!--jumbotron-->
		<fieldset class="form-group border p-3">
			<legend class="w-auto px-3">웹 스토리지를 이용한 아이디 저장</legend>
			​<span style="color: red; font-weight: bold">
			<%=request.getAttribute("mismatchError")==null?"":request.getAttribute("mismatchError") %>
			</span>
			<form class="form-inline" method="post" action="Process.jsp" onsubmit="login(event)">
				<label>아이디</label>
    			<input  type="text" name="id" class="form-control mx-2" value="<%=request.getParameter("id")==null?"":request.getParameter("id")%>"/>    			
    			<label>비밀번호</label>
    			<input type="password" name="pwd" class="form-control mx-2" value="<%=request.getParameter("pwd")==null?"":request.getParameter("pwd")%>" />
    			<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="id-save" value="Y" id="id-save" />
					<label class="custom-control-label" for="id-save" checked>아이디 저장</label>
				</div>
    			<input type="submit" class="btn btn-danger mx-2" value="로그인" />
			</form>
			<hr/>
			<!-- 아래 버튼 클릭시 Logout.jsp로 이동. 로그아웃 처리 -->
			​<input type="button" value="로그아웃" class="btn btn-danger" onclick="logout()" style="display:none"/>
		</div><!--container-->
		<script>
            //var idSave = document.querySelector("#id-save");
            var id = document.querySelector("input[name='id']");
			var pwd = document.querySelector("input[name='pwd']");
            var span = document.querySelector("span");
			var form = document.querySelector("form");
			var logoutBtn = document.querySelector("input[type='button']");
			var idSave = document.querySelector("#id-save");

			function login(e){
				if(id.value===""){
					e.preventDefault();
					alert('아이디 입력')
					id.focus();
					return;
				}
				if(pwd.value===""){
					e.preventDefault();
					alert('비밀번호 입력')
					pwd.focus();
					return;
				}
			};
			
			
			
			window.addEventListener('DOMContentLoaded',function(){
				console.log('hi');
				form.style.display = "<%=session.getAttribute("loginForm") %>";
				logoutBtn.style.display = "<%=session.getAttribute("logoutBtn")%>";
				if(idSave.checked===true){
					sessionStorage.setItem("username","<%=request.getParameter("id")%>);
				}
			})
			
			function logout(){
                location.href="Logout.jsp";
            }
		</script>
	
</body>
</html>
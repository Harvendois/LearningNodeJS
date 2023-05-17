<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<title>Cart.jsp</title>
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
			<legend class="w-auto p-3">웹스토리지를 이용한 장바구니 예제</legend>

				<div class="form-group">				
					<div class="d-flex">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0001" id="product1" />
							<label class="custom-control-label" for="product1">상품1</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0002" id="product2" />
							<label class="custom-control-label" for="product2">상품2</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0003" id="product31" />
							<label class="custom-control-label" for="product3">상품3</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0004" id="product4" />
							<label class="custom-control-label" for="product4">상품4</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0005" id="product5" />
							<label class="custom-control-label" for="product5">상품5</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0006" id="product6" />
							<label class="custom-control-label" for="product6">상품6</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0007" id="product7" />
							<label class="custom-control-label" for="product7">상품7</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0008" id="product81" />
							<label class="custom-control-label" for="product8">상품8</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P0009" id="product9" />
							<label class="custom-control-label" for="product9">상품9</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="P00010" id="product10" />
							<label class="custom-control-label" for="product10">상품10</label>
						</div>
					</div>
				</div>
					
		</fieldset>
		<hr/>
		<fieldset class="form-group border p-3">
			<input type="button" value="장바구니 담기"  class="btn btn-danger" onclick="fillCart()"/>		
			<input type="button" value="장바구니 비우기" class="btn btn-warning" onclick="emptyCart()"/>
			<input type="button" value="장바구니 보기" class="btn btn-info" onclick="viewCart()"/>	
		</fieldset>
		<ul class="list-unstyled">
		<!--장바구니 보기 버튼 클릭시 여기에 상품 목록을 뿌려줘라 -->
		</ul>
	</div>
	<script>
	var ul = document.querySelector("ul");
	var btn1 = document.querySelector("input[type=button]:nth-child(1)");
	var btn2 = document.querySelector("input[type=button]:nth-child(2)");
	var btn3 = document.querySelector("input[type=button]:nth-child(3)");
	var checked;
	function fillCart() {
		//checked checkbox value will be stored within sessionStorage
		checked = document.querySelectorAll("input[type=checkbox]:checked");
		console.log(checked);
		var obj = {};
		for(var i=0; i<checked.length; i++){
			key = checked[i].value;
			value = checked[i].nextElementSibling.textContent;
			obj[key] = value;
		}
		strObj = JSON.stringify(obj);
		console.log(obj);
		sessionStorage.setItem("cart", strObj);
	}
	function emptyCart(){
		sessionStorage.removeItem("cart");
		ul.innerHTML = "";
		for(var index in checked){
			checked[index].checked = false;
		}
	}
	function viewCart(){
		var obj = sessionStorage.getItem("cart");
		var objParsed = JSON.parse(obj);
		console.log(objParsed);
		var html = "";
		if(objParsed != null){
			for(var key in objParsed){
			 	html += "<li>" + objParsed[key] + "</li>";
			}
			console.log(html);
			ul.innerHTML = html;
		}
	}
	</script>
</body>
</html>
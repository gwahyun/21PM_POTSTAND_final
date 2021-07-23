<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<c:if test="${empty cookie.c }">
	<c:set value="checked" var="checked"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인-PotStand</title>
    <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>
    <script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
   	<style>
		.modal__background{
			  background: rgba(0, 0, 0, 0.8);
		}
		.modal__box{
			top: calc(38vh - 100px); left: calc(45vw - 200px);
			border-radius: 10px;
			width: 600px;
			height: 400px;
		}
	</style>
</head>
<body>
    <div class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="absolute bg-gray-200 opacity-60 inset-0 z-0"></div>
        <div class="max-w-md w-full space-y-8 p-10 bg-white rounded-xl z-10">
            <div class="text-center">
                <h2 class="mt-6 text-3xl font-bold text-gray-900">Welcome!</h2>
                <p class="mt-2 text-sm text-gray-600">로그인 하셔야 이용이 가능합니다.</p>
            </div>
            <div class="flex items-center justify-center space-x-2">
                <span class="h-px w-16 bg-gray-300"></span>
                <span class="text-gray-500 font-normal">POTSTAND</span>
                <span class="h-px w-16 bg-gray-300"></span>
            </div>
            <form class="mt-8 space-y-6" action="#" method="POST">
                <input type="hidden" name="remember" value="true" />
                <div class="relative">  
                    <label class="text-sm font-bold text-gray-700 tracking-wide">ID</label>
                    <input class="w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
                    type="text" name="memberId" value="${cookie.saveId.value }" placeholder="Enter your ID" required/>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">Password</label>
                    <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" name="memberPwd" type="password" placeholder="Enter your password" required/>
                </div>
                <div class="content-center">
                	<span id="errMsg" class="text-red-500"></span>
                </div>
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember_me" name="remember_me" type="checkbox" class="h-4 w-4 bg-indigo-500 
                        focus:ring-indigo-400 border-gray-300 rounded" ${checked }/>
                        <label for="remember_me" class="ml-2 block text-sm text-gray-900">아이디 저장</label>
                    </div>
                    <div class="text-sm flex flex-col">
                        <a href="javascript:void(0)" id="searchId" class="font-medium text-red-500 
                        hover:text-red-500">아이디 찾기</a>
                        <a href="#" class="font-medium text-red-500 hover:text-red-500">비밀번호 재설정</a>
                    </div>
                </div>
                <div>
                    <button type="button" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
                    tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
                    cursor-pointer transition ease-in duration-300" onclick="fn_memberLogin_login();">
                    	Login
                    </button>
                </div>
                <p class="flex flex-col items-center justify-center mt-10 text-center text-md text-gray-500">
                    <a href="${path}/" class="text-gray-500 hover:text-red-500 no-underline hover:underline cursor-pointer 
                    transition ease-in duration-300">돌아가기</a>
                </p>
                <p class="flex flex-col items-center justify-center mt-10 text-center text-md text-gray-500">
                    <span>계정이 없으신가요?</span>
                    <a href="${path}/member/memberEnroll.do" class=" text-red-500 hover:text-red-500 no-underline hover:underline cursor-pointer 
                    transition ease-in duration-300">회원가입</a>
                </p>
            </form>
            <div class="modal__background fixed inset-0 hidden">
				<div class="modal__box flex flex-col justify-center absolute bg-white items-center">
					<form class="w-1/2" action="${path }/member/memberSearchId.do" method="post">
			            <div class="w-1/2 relative flex flex-col m-4">  
			            	<label class="text-lg font-bold text-gray-700 tracking-wide">아이디 찾기</label>
			            	<input class="w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
			            	type="text" name="memberEmail" placeholder="이메일주소" required/>
			            </div>
						<div class="w-1/2 relative flex flex-col">
			                <button type="submit" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1">
			                	아이디찾기
			                </button>
			                <button type="button" class="w-full flex justify-center bg-white text-gray-500 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1" id="modalClose">
			                	나가기
			            	</button>
			        	</div>   
			    	</form>
				</div>
			</div>
        </div>
    </div>
</body>
<script>
	const errMsg="! 아이디 또는 비밀번호를 확인해주세요.";
	//ajax를 이용하여 로그인을 눌렀을때 계정이 틀리면 err메세지출력하는 함수
	function fn_memberLogin_login(){ 
		$("#errMsg").text(''); //errMsg창을 비워주고 시작
		$.ajax({
			url:"${path}/member/memberLoginEnd.do",
			data:{
				"memberId":$("input[name=memberId]").val(),
				"memberPwd":$("input[name=memberPwd]").val(),
				"saveId":$("#remember_me").is(":checked")
			},
			success:data=>{
				if(data==''){ //로그인 실패
					$("#errMsg").text(errMsg);
				}else{ //로그인 성공
					alert('로그인 성공!');
					location.replace('${path}/');//메인페이지로 이동
				}
			}
		});
	}
	
	//아이디찾기 모달창 이벤트
	$("#searchId").click(e=>{
			$(".modal__background").fadeIn();
	});
	$("#modalClose").click(e=>{
		$(".modal__background").fadeOut();
	});
	
</script>
</html>
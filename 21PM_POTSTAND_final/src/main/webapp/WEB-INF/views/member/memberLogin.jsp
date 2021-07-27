<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<c:if test="${not empty cookie.saveId.value }">
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
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
            <form class="mt-8 space-y-6" action="${path}/member/memberLoginEnd.do" method="POST">
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
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember_me" name="remember_me" type="checkbox" class="h-4 w-4 bg-indigo-500 
                        focus:ring-indigo-400 border-gray-300 rounded" value="true" ${checked }/>
                        <label for="remember_me" class="ml-2 block text-sm text-gray-900">아이디 저장</label>
                    </div>
                    <div class="text-sm flex flex-col">
                        <a href="javascript:void(0)" id="searchId" class="font-medium text-red-500 
                        hover:text-red-500">아이디 찾기</a>
                        <a href="javascript:void(0)" id="searchPwd" class="font-medium text-red-500 
                        hover:text-red-500">비밀번호 재설정</a>
                    </div>
                </div>
                <div>
                    <button type="submit" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
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
            <div id="idmodal" class="modal__background fixed inset-0 hidden">
				<div class="modal__box flex flex-col justify-center absolute bg-white items-center">
					<form class="w-full flex flex-col justify-center items-center" action="${path }/member/memberSearchId.do" method="post">
			            <div class="w-1/2 relative flex flex-col m-4">  
			            	<label class="text-lg font-bold text-gray-700 tracking-wide">아이디 찾기</label>
			            	<input class="w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
			            	type="text" name="memberEmail" placeholder="이메일주소 입력" required/>
			            </div>
						<div class="w-1/2 relative flex flex-col">
			                <button type="submit" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1">
			                	아이디 찾기
			                </button>
			                <button type="button" class="w-full flex justify-center bg-white text-gray-500 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1" id="idmodalClose">
			                	나가기
			            	</button>
			        	</div>   
			    	</form>
				</div>
			</div>
			<div id="pwdmodal" class="modal__background fixed inset-0 hidden">
				<div class="modal__box flex flex-col justify-center absolute bg-white items-center">
					<form class="w-full flex flex-col justify-center items-center" action="${path }/member/memberResetPwd.do" method="post">
			            <div class="w-1/2 relative flex flex-col m-4">  
			            	<label class="text-lg font-bold text-gray-700 tracking-wide">비밀번호 재설정</label>
			            	<input class="w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
			            	type="text" name="memberId" placeholder="아이디 입력" required/>
			            	<input class="w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
			            	type="text" name="memberEmail" placeholder="이메일주소 입력" required/>
			            </div>
						<div class="w-1/2 relative flex flex-col">
			                <button type="submit" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1">
			                	비밀번호 재설정
			                </button>
			                <button type="button" class="w-full flex justify-center bg-white text-gray-500 p-4 rounded-full 
			                tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
			                cursor-pointer transition ease-in duration-300 m-1" id="pwdmodalClose">
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
	//아이디찾기 모달창 이벤트
	$("#searchId").click(e=>{
		$("#idmodal").fadeIn();
	});
	$("#idmodalClose").click(e=>{
		$("#idmodal").fadeOut();
	});
	//비밀번호찾기 모달창 이벤트
	$("#searchPwd").click(e=>{
		$("#pwdmodal").fadeIn();
	});
	$("#pwdmodalClose").click(e=>{
		$("#pwdmodal").fadeOut();
	});
	
</script>
</html>
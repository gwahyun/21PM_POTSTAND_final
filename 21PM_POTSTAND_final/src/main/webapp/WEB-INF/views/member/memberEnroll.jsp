<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입-PotStand</title>
	<link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script language="javascript">
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";
		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    	var pop = window.open("${path}/member/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
							, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			$("#roadAddrPart1").val(roadAddrPart1);
			$("#roadAddrPart2").val(roadAddrPart2);
			$("#addrDetail").val(addrDetail);
			$("#zipNo").val(zipNo);
		}
	</script>
</head>
<body>
    <div class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 relative items-center">
        <div class="absolute bg-gray-200 opacity-60 inset-0 z-0"></div>
        <div class="max-w-md w-full space-y-8 p-10 bg-white rounded-xl z-10">
            <div class="text-center">
                <h2 class="mt-6 text-3xl font-bold text-gray-900">회원가입</h2>
                <p class="mt-2 text-sm text-gray-600">Welcome POTSTAND</p>
            </div>
            <form class="mt-8 space-y-6" action="${path}/member/memberEnrollEnd.do" method="POST" 
            onsubmit="return enrollSubmit();">
                <input type="hidden" name="remember" value="true" />
                <div class="relative">
                   
                    <label class="text-sm font-bold text-gray-700 tracking-wide">아이디</label>
                    <input class=" w-full text-base py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500" 
                    type="text" id="userId" name="memberId" placeholder="Enter your ID" required/>
                    <div class="content-center">
                		<span class="text-red-500"></span>
                		<span class="text-green-500"></span>
               	 	</div>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">비밀번호</label>
                    <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="password" name="memberPwd" type="password" placeholder="Enter your password" required/>
                    <div class="content-center">
                		<span class="text-red-500"></span>
                	</div>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">비밀번호 확인</label>
                    <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="checkPw" type="password" placeholder="Enter your password" required/>
                    <div class="content-center">
                		<span class="text-red-500"></span>
                	</div>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">이름</label>
                    <input class=" w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="userName" name="memberName" type="text" placeholder="홍길동" required/>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">이메일</label>
                    <input class=" w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="email" name="memberEmail" type="text" placeholder="Email@gmail.com" required/>
                	<div class="content-center">
                		<span class="text-red-500"></span>
                		<span class="text-green-500"></span>
               	 	</div>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">휴대전화</label>
                    <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="phone" name="memberPhone" type="text" placeholder="01000000000" required/>
                </div>
                <div class="mt-8 content-center">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">생년월일</label>
                    <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
                    focus:border-indigo-500" id="birth" name="memberBirth" type="date" required/>
                </div>
                <div class="mt-8 content-center flex justify-between">
                    <label class="text-sm font-bold text-gray-700 tracking-wide">성별</label>
                    <div>
                        <label for="gender-m">남성</label>
                        <input id="gender-m" name="memberGender" type="radio" value="m" class="h-4 w-4 bg-indigo-500 
                        focus:ring-indigo-400 border-gray-300 rounded" required/>
                        <label for="gender-f">여성</label>
                        <input id="gender-f" name="memberGender" type="radio" value="f" class="h-4 w-4 bg-indigo-500 
                        focus:ring-indigo-400 border-gray-300 rounded" required/>
                    </div>
                </div>
                <div class="content-center flex justify-between">
                	<label class="text-sm font-bold text-gray-700 tracking-wide">주소</label>
                	<div>   		
                    	<input type="checkbox" id="baseAddress" name="defaultAddr" value="Y" class="h-4 w-4 bg-indigo-500 
                        focus:ring-indigo-400 border-gray-300 rounded"/> 기본배송지로 등록
                	</div>
                </div>
                <div class="content-center flex flex-col">
	                <div>
	                	<input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input class="w-1/2 content-center text-base py-2 border-b border-gray-300 focus:outline-none 
						focus:border-indigo-500" type="text" id="zipNo" name="postNo" readonly required> <!-- 우편번호 -->
						<input class="w-1/3 text-xs bg-red-500 text-gray-100 p-2 rounded-full tracking-wide font-semibold 
						focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer transition 
						ease-in duration-300" type="button"  value="주소검색" onclick="goPopup();" style="width: 48%;" required>
					</div>
					<div>
				        <input class="w-full content-center text-base py-2 border-b border-gray-300 focus:outline-none 
		                focus:border-indigo-500" type="text" id="roadAddrPart1" name="roadAddr" required><!-- 도로명주소 -->
	                </div>
	            	<div>
		                <input class="content-center text-base py-2 border-b border-gray-300 focus:outline-none 
	                    focus:border-indigo-500" type="text" id="addrDetail" name="oldAddr" value="" style="width: 49%;" required> <!-- 상세주소 -->
	                    <input class="content-center text-base py-2 border-b border-gray-300 focus:outline-none 
	                    focus:border-indigo-500" type="text" id="roadAddrPart2" name="detailAddr" value="" style="width: 49%;" required> <!-- 상세주소2 -->
                    </div>
                </div>
                <div class="flex items-center">
                    <input id="agree1" name="agree" type="checkbox" class="h-4 w-4 bg-indigo-500 
                    focus:ring-indigo-400 border-gray-300 rounded"/>
                    <label for="remember_me" class="ml-2 block text-sm text-gray-900">
                        이용약관 동의<span class="text-red-500">(필수)</span>
                    </label>
                </div>
                <div class="flex items-center">
                    <input id="agree2" name="agree" type="checkbox" class="h-4 w-4 bg-indigo-500 
                    focus:ring-indigo-400 border-gray-300 rounded"/>
                    <label for="remember_me" class="ml-2 block text-sm text-gray-900">
                        개인정보 수집 및 이용 동의<span class="text-red-500">(필수)</span>
                    </label>
                </div>
                <div>
                    <button type="submit" class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
                    tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
                    cursor-pointer transition ease-in duration-300">가입하기</button>
                </div>
                <p class="flex flex-col items-center justify-center mt-10 text-center text-md text-gray-500">
                    <a href="${path}/" class="text-red-500 hover:text-red-500 no-underline hover:underline cursor-pointer 
                    transition ease-in duration-300">돌아가기</a>
                </p>
            </form>
        </div>
    </div>
    <script>
    	let idResult;
    	let pwResult;
    	let checkPwResult;
    	let emailResult;
    	
    	//아이디 정규표현식으로 체크
    	function fn_memberEnroll_checkId(userId){
    		let id=userId.val();
    		var idReg = /^[a-z]+[a-z0-9]{4,19}$/g;
            if(!idReg.test(id)) {
            	userId.next().children().eq(0).text("아이디는 영문자로 시작하는 5~20자 영문자 또는 숫자이어야 합니다.");         	
                return false;
            }else{
            	return true;
            }
    	}   
    	//아이디 중복체크
    	function fn_memberEnroll_memberCheckId(userId){
    		let flag=false;
    		$.ajax({
				url:"${path}/member/memberCheckId.do",
				data:{
					"memberId":userId.val()
				},
				async:false,
				success:data=>{
					if(data==''){ //중복아이디 없음
						userId.next().children().eq(1).text("사용가능한 아이디입니다.");
						flag=true;
					}else{ //중복아이디 있음
						userId.next().children().eq(0).text("중복된 아이디입니다.");
						flag=false;
					}
				}
			});
    		return flag;
    	}
    	//비밀번호 정규표현식으로 체크
    	function fn_memberEnroll_checkPw(password){
    		let pw=password.val();
    		var num = pw.search(/[0-9]/g);
    		var eng = pw.search(/[a-z]/ig);
    		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    		if(pw.length<8 || pw.length>20){
    			password.next().children().text("8자리~20자리 이내로 입력해주세요.");
    			return false;
    		}else if(pw.search(/\s/) != -1){
    			password.next().children().text("비밀번호는 공백없이 입력해주세요.");
    			return false;
    		}else if(num<0 || eng<0 || spe<0 ){
    			password.next().children().text("영문,숫자,특수문자를 혼합하여 입력해주세요.");
    			return false;
    		}else { 
    			return true;
    		}
    	}	
    	//이메일 중복체크
    	function fn_memberEnroll_memberCheckEmail(email){
    		flag=false;
    		$.ajax({
				url:"${path}/member/memberCheckEmail.do",
				data:{
					"memberEmail":email.val()
				},
				async:false,
				success:data=>{
					if(data==''){ //중복이베일 없음
						email.next().children().eq(1).text("사용가능한 이메일입니다.");
						flag=true;
					}else{ //중복이메일 있음
						email.next().children().eq(0).text("중복된 이메일입니다.");
						flag=false;
					}
				}
			});
    		return flag;
    	}
    	$("#userId").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#userId").next().children().text("");
    	});
    	$("#userId").blur(function(e){
    		idResult=fn_memberEnroll_checkId($(e.target));
    		if(idResult){
    			idResult=fn_memberEnroll_memberCheckId($(e.target));
    		}
    		console.log(idResult);
    	});
    	$("#password").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#password").next().children().text("");
    	});
    	$("#password").blur(function(e){
    		fn_memberEnroll_checkPw($(e.target));
    		if($("#password").val()==$("#checkPw").val()){
				pwResult=true;		
				$("#checkPw").next().children().text("");
			}else{
				pwResult=false;
				if($("#checkPw").val()!=''){
    				$("#checkPw").next().children().text("비밀번호가 일치하지 않습니다.");
    			}
			}
    	});
    	$("#checkPw").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#checkPw").next().children().text("");
    	});
    	$("#checkPw").blur(function(e){
    		if(fn_memberEnroll_checkPw($(e.target))){ //정규표현식에 해당할때 비밀번호가 일치하는지 확인
    			if($("#password").val()==$(e.target).val()){
    				pwResult=true;		
    			}else{
    				$("#checkPw").next().children().text("비밀번호가 일치하지 않습니다.");
    			}
    		}
    	});
    	$("#email").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#email").next().children().text("");
    	});
    	$("#email").blur(function(e){ //포커싱 아웃되었을때 이메일 중복확인
    		emailResult=fn_memberEnroll_memberCheckEmail($(e.target));
    		console.log(emailResult);
    	});
    	
    	//회원가입 버튼 클릭시
    	function enrollSubmit(){
			let agreeResult=$("#agree1").is(':checked') && $("#agree2").is(':checked');		
    		if(agreeResult && idResult && pwResult && emailResult){ //약관동의가 되어있으면 가입
    			return true;
    		} else{
    			if(!idResult){ //아이디가 제대로 작성이 안되었을 경우
    				alert('아이디를 확인하세요.');
    				$("#userId").focus();
    			} else if(!pwResult){ //비밀번호가 틀리거나 작성이 제대로 안되어있을 경우
    				alert('비밀번호를 확인하세요');
    				$("#password").focus();
    			} else if(!agreeResult){ //약관에 동의가 안되어있을경우
    				alert('약관에 동의해주세요.');
    			} else if(!emailResult){
    				alert('이메일을 확인하세요');
    				$("#email").focus();
    			}
    			return false;
    		}
    	}

    </script>
</body>
</html>
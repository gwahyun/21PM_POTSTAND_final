<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
	<section class="body-font">
    	<div class="container mx-auto flex justify-start">
        	<div class="w-1/4 h-full py-8">
	            <h3 class="text-4xl font-extrabold">마이페이지</h3>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>개인</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/notice/noticeSelectList.do">고객센터</a></li>
			                <li class="py-2"><a href="${path}/member/memberCheckPwd.do">정보변경</a></li>
			                <li class="py-2"><a href="#">장바구니</a></li>
			                <li class="py-2"><a href="#">찜 목록</a></li>
			                <li class="py-2"><a href="#">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>구매/혜택</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="#">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="#">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do?memberId=${loginMember.memberId}">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">정보변경</h3>
        		</div>
        		<div class="flex w-full flex-col justify-center mt-5 border" >
        			<div class="flex">
        				<div class="w-2/5 border h-11 p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
        					<h3 class="text-lg font-bold">아이디</h3>
	        			</div>
	        			<div class="w-full border h-11 p-2 px-3">
	        				<h4>${loginMember.memberId }</h4>
	        			</div>
        			</div>
        			<div class="flex">
        				<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        				<h3 class="text-lg font-bold">비밀번호</h3>
	        			</div>
	        			<div class="w-full border p-2 px-3 flex content-center">
	        				<form method="post" action="${path }/member/memberUpdatePwd.do" onsubmit="return fn_memberUpdatePwd()" 
	        				class="w-full">
	        					<div class="mb-2">
	        						<input type="hidden" name="memberId" value="${loginMember.memberId }">
						            <input type="password" name="memberPwd" id="oldPw" placeholder="현재 비밀번호"
						        	class="border-2 w-1/3">
						            <div class="content-center">
										<span class="text-red-500"></span>
									</div>
	        					</div>
					        	<div class="mb-2">
					        		<input type="password" name="newPw" id="newPw" placeholder="새 비밀번호"
				                	class="border-2 w-1/3">
				                	<div class="content-center">
							    		<span class="text-red-500"></span>
							    	</div>
					        	</div>
								<div class="mb-2">
									<input type="password" name="newPw2" id="newPw2" placeholder="새 비밀번호 확인"
					                class="border-2 w-1/3">
					                <div class="content-center">
								    	<span class="text-red-500"></span>
								    </div>
								</div>
								<div class="mb-2">
									<button type="submit" class="w-1/5 h-1/4 border bg-red-500 text-gray-100 rounded-full 
									tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 
									shadow-lg cursor-pointer transition ease-in duration-300">
							    		비밀번호 변경
							    	</button>
								</div>
							   
							</form>
	        			</div>
        			</div>
        			<div class="flex">
        				<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        				<h3 class="text-lg font-bold">이름</h3>
	        			</div>
	        			<div class="w-full border p-2 px-3 flex content-center">
	        				<h4>${loginMember.memberName }</h4>
	        			</div>    
        			</div>
        			<div class="flex">
        				<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        				<h3 class="text-lg font-bold">이메일</h3>
	        			</div>
	        			<div class="w-full border p-2 px-3 flex content-center">
	        				<h4>${loginMember.memberEmail }</h4>
	        			</div>    
        			</div>
        			<form method="post" action="${path }/member/memberUpdateEnd.do">
        				<input type="hidden" name="memberId" value="${loginMember.memberId }">
        				<input type="hidden" name="memberEmail" value="${loginMember.memberEmail }">
        				<input type="hidden" name="memberName" value="${loginMember.memberName }">
        				<div class="flex">
        					<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        					<h3 class="text-lg font-bold">휴대전화</h3>
		        			</div>
		        			<div class="w-full border p-2 px-3 flex content-center">
		        				<input type="tel" name="memberPhone" class="border-2 w-1/3" value="${loginMember.memberPhone }" required>
		        			</div>
	        			</div>
	        			<div class="flex">
        					<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        					<h3 class="text-lg font-bold">생년월일</h3>
		        			</div>
		        			<div class="w-full border p-2 px-3 flex content-center">
		        				<input type="date" name="memberBirth" class="border-2 w-1/3" value="${loginMember.memberBirth }" required>
		        			</div>
	        			</div>
	        			<div class="flex">
        					<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        					<h3 class="text-lg font-bold">성별</h3>
		        			</div>
		        			<div class="w-full border p-2 px-3 flex content-center">
		        				<c:if test="${loginMember.memberGender eq 'm' }">
		                            	<c:set value="checked" var="mChecked"/>
		                        </c:if>
		                        <c:if test="${loginMember.memberGender eq 'f' }">
		                            	<c:set value="checked" var="fChecked"/>
		                        </c:if>
		                        <div>
		                        	<label for="gender-m">남성</label>
					                <input id="gender-m" name="memberGender" type="radio" value="m" class="h-4 w-4 
					                bg-indigo-500 focus:ring-indigo-400 border-gray-300 rounded" ${mChecked } required/>
					                <label for="gender-f">여성</label>
					                <input id="gender-f" name="memberGender" type="radio" value="f" class="h-4 w-4 
					                bg-indigo-500 focus:ring-indigo-400 border-gray-300 rounded" ${fChecked } required/>
		                        </div>
		                        
		        			</div>
	        			</div>
	        			<div class="flex">
        					<div class="w-2/5 border p-2 bg-red-100 pr-3 flex flex-row-reverse content-center">
	        					<h3 class="text-lg font-bold">주소</h3>
		        			</div>
		        			<div class="w-full border p-2 px-3 flex content-center">
			        			<div class="w-full">
			        				<div class="mb-2">
			        					<input type="hidden" id="confmKey" name="confmKey" value="" >
			                            <input type="text" id="zipNo" name="postNo" class="border-2" style="width:25%"
			                            value="${loginMember.addresses.get(0).postNo }" required> <!-- 우편번호 -->
			                            <input type="button"  value="주소검색" onclick="goPopup();">
			        				</div>
			        				<div class="mb-2">
			        					<input type="text" id="roadAddrPart1" class="border-2" style="width: 51%" name="roadAddr"
			                            value="${loginMember.addresses.get(0).roadAddr }" required>
			        				</div>
			        				<div class="mb-2">
			        					<input type="text" id="addrDetail" class="border-2 w-1/4" name="oldAddr" style="width:25%"
			                            value="${loginMember.addresses.get(0).oldAddr }" required> <!-- 상세주소 -->
			                            <input type="text" id="roadAddrPart2" class="border-2 w-1/4" name="detailAddr" style="width:25%"
			                            value="${loginMember.addresses.get(0).detailAddr }" required> <!-- 상세주소2 -->
			        				</div>       	
			        			</div>
		        			</div>
	        			</div>
	        			<div class="h-16 w-full p-2 flex justify-center border">
			            	<button type="button" onclick="location.replace('${path}/member/memberDelete.do')" class="border 
			            	w-1/6 bg-white text-black rounded-full tracking-wide font-semibold focus:outline-none 
			            	focus:shadow-outline hover:bg-red-500 hover:text-white shadow-lg cursor-pointer transition 
			            	ease-in duration-300">회원탈퇴</button>
			            	<button type="submit" class="border w-1/6 bg-red-500 text-gray-100 rounded-full tracking-wide 
	        				font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
	        				transition ease-in duration-300">수정</button>            
			        	</div>		
        			</form>	
        		</div>
			</div>
		</div>
    </section>
    <script>
	    let oldPwResult=true;
		let newPwResult=false;
		let newPw2Result=false;
    
	  	//비밀번호 정규표현식으로 체크
		function fn_memberUpdate_checkPw(password){
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
	  	
	  	//비밀번호체킹 로직
		$("#oldPw").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#oldPw").next().children().text("");
    	});
    	$("#oldPw").blur(function(e){  		
    		if($(e.target).val().trim()<1){
    			$(e.target).next().children().text("");
    		} else if(fn_memberUpdate_checkPw($(e.target))){
    			$.ajax({ //현재 비밀번호가일치한지 확인
    				url:"${path}/member/memberUpdateCheckPwd.do",
    				data:{
    					"memberId":'${loginMember.memberId}',
    					"memberPwd":$(e.target).val()
    				},
    				async:false,
    				success:data=>{
    					if(data==''){
    						oldPwResult=false;
    						$(e.target).next().children().text("기존 비밀번호가 일치하지 않습니다.");
    					}
    					oldPwResult=true;
    				}
    			});
    		}
    	});
    	$("#newPw").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#newPw").next().children().text("");
    	});
    	$("#newPw").blur(function(e){
    		if($(e.target).val().trim()<1){
    			$(e.target).next().children().text("");
    			newPwResult=false;
    		} else if(fn_memberUpdate_checkPw($(e.target))){
    			$.ajax({ //새로운 비밀번호는 기존 비밀번호와 달라야함.
    				url:"${path}/member/memberUpdateCheckPwd.do",
    				data:{
    					"memberId":'${loginMember.memberId}',
    					"memberPwd":$(e.target).val()
    				},
    				async:false,
    				success:data=>{
    					if(data==''){
    						newPwResult=true;
    					}else{
    						$(e.target).next().children().text("새 비밀번호는 기존 비밀번호와 달라야 합니다.");
    						newPwResult=false;
    					}	
    				}
    			});
    			if(newPwResult==true && $("#newPw2").val().length>0){
    				if($("#newPw2").val()==$(e.target).val()){
	    				$("#newPw2").next().children().text("");
	    			}else{
	    				$("#newPw2").next().children().text("새 비밀번호와 일치하지 않습니다.");
						newPw2Result=false;
	    			}
				}
    		}
    	});
    	$("#newPw2").focus(function(){ //포커싱 되었을때 메세지 지우기
    		$("#newPw2").next().children().text("");
    	});
    	$("#newPw2").blur(function(e){
    		if($(e.target).val().trim()<1){
    			$(e.target).next().children().text("");
    			newPw2Result=false;
    		} else if(fn_memberUpdate_checkPw($(e.target))){
    			if($("#newPw").val()==$(e.target).val()){
    				$("#newPw2").next().children().text("");
    				newPw2Result=true;
    			}else{
    				$(e.target).next().children().text("새 비밀번호와 일치하지 않습니다.");
    				newPw2Result=false;
    			}		
    		}
    	});
    	
    	//비밀번호변경 버튼
    	function fn_memberUpdatePwd(){
    		if(oldPwResult && newPwResult && newPw2Result){ //약관동의가 되어있으면 가입
    			return true;
    		} else{
    			alert('비밀번호를 확인');
    			return false;
    		}
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
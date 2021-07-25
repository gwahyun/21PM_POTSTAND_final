<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
			                <li class="py-2"><a href="#">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">정보변경</h3>
        		</div>
        		<div class="felx flex-col justify-center mt-5 border-2">
        			<form method="post" action="" class="center">
		                <table class="w-full">
		                    <tbody class="w-full">
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100">아이디</th>
		                            <td class="px-3">
		                            	<h4>${loginMember.memberId }</h4>
		                            	<input type="hidden" name="userId" value="${loginMember.memberId }">
		                            </td>
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">비밀번호</th>
		                            <td class="px-3">
		                            	<input type="password" name="password" placeholder="현재 비밀번호"
		                            	class="border-2 w-1/3">
		                            </td>         
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100""></th>
		                            <td class="px-3">
		                            	<input type="password" name="newpw" placeholder="새 비밀번호"
		                            	class="border-2 w-1/3">
		                            </td>
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100""></th>
		                            <td class="px-3">
		                            	<input type="password" name="newpw2" placeholder="새 비밀번호 확인"
		                            	class="border-2 w-1/3">
		                            </td>
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">이메일</th>
		                            <td class="px-3">
		                            	<h4>${loginMember.memberEmail }</h4>
		                            	<input type="hidden" name="email" value="${loginMember.memberEmail }">
		                            </td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">휴대전화</th>
		                            <td class="px-3">
		                            	<input type="tel" name="phone" class="border-2 w-1/3" value="${loginMember.memberPhone }">
		                            </td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">생년월일</th>
		                            <td class="px-3">
		                            	<input type="date" name="birth" class="border-2 w-1/3" value="${loginMember.memberBirth }">
		                            </td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">성별</th>
		                            <td class="px-3">
		                            	<label for="gender-m">남성</label>
				                        <input id="gender-m" name="memberGender" type="radio" value="m" class="h-4 w-4 
				                        bg-indigo-500 focus:ring-indigo-400 border-gray-300 rounded" required/>
				                        <label for="gender-f">여성</label>
				                        <input id="gender-f" name="memberGender" type="radio" value="f" class="h-4 w-4 
				                        bg-indigo-500 focus:ring-indigo-400 border-gray-300 rounded" required/>
		                            </td>
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100"">주소</th>              
		                            <td class="px-3"><input type="checkbox" name="baseAddress" value="y">기본 배송지로 설정</td>
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100""></th>
		                            <td class="px-3">
		                                <input type="hidden" id="confmKey" name="confmKey" value="" >
		                                <input type="text" id="zipNo" name="zipNo" readonly class="border-2" style="width:100px"> <!-- 우편번호 -->
		                                <input type="button"  value="주소검색" onclick="goPopup();">
		                            </td> 
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100""></th>
		                            <td class="px-3"><input type="text" id="roadAddrPart1" class="border-2" style="width:85%"></td> <!-- 도로명주소 -->
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2 text-right pr-3 bg-red-100""></th>
		                            <td class="px-3">
		                                <input type="text" id="addrDetail" class="border-2" style="width:40%" value=""> <!-- 상세주소 -->
		                                <input type="text" id="roadAddrPart2" class="border-2" style="width:40%" value=""> <!-- 상세주소2 -->
		                            </td>
		                        </tr>
		                    </tbody>   
		                </table>
		                <div class="h-16 w-full p-2 flex justify-center">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
		                            <th class="w-1/4 border-r-2">아이디</th>
		                            <td class="px-3">
		                            	<h4>${loginMember.memberId }</h4>
		                            	<input type="hidden" name="userId" value="${loginMember.memberId }">
		                            </td>
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2">비밀번호</th>
		                            <td class="px-3">
		                            	<input type="password" name="password" placeholder="현재 비밀번호">
		                            </td>         
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2"></th>
		                            <td class="px-3">
		                            	<input type="password" name="newpw" placeholder="새 비밀번호">
		                            </td>
		                        </tr>
		                        <tr class="h-10 p-1">
		                            <th class="w-1/4 border-r-2"></th>
		                            <td class="px-3">
		                            	<input type="password" name="newpw2" placeholder="새 비밀번호 확인">
		                            </td>
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2">이메일</th>
		                            <td class="px-3">
		                            	<h4>${loginMember.memberEmail }</h4>
		                            	<input type="hidden" name="email" value="${loginMember.memberEmail }">
		                            </td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2">휴대전화</th>
		                            <td class="px-3"><input type="tel" name="phone"></td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2">생년월일</th>
		                            <td class="px-3"><input type="text" name="birth"></td>    
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2">성별</th>
		                            <td class="px-3">
		                                <input type="radio" name="gender" value="male">남
		                                <input type="radio" name="gender" value="female">여
		                            </td>
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2">주소</th>              
		                            <td class="px-3"><input type="checkbox" name="baseAddress" value="y">기본 배송지로 설정</td>
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2"></th>
		                            <td class="px-3">
		                                <input type="hidden" id="confmKey" name="confmKey" value="" >
		                                <input type="text" id="zipNo" name="zipNo" readonly style="width:100px"> <!-- 우편번호 -->
		                                <input type="button"  value="주소검색" onclick="goPopup();">
		                            </td> 
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2"></th>
		                            <td class="px-3"><input type="text" id="roadAddrPart1" style="width:85%"></td> <!-- 도로명주소 -->
		                        </tr>
		                        <tr class="h-16 p-2">
		                            <th class="w-1/4 border-r-2"></th>
		                            <td class="px-3">
		                                <input type="text" id="addrDetail" style="width:40%" value=""> <!-- 상세주소 -->
		                                <input type="text" id="roadAddrPart2"  style="width:40%" value=""> <!-- 상세주소2 -->
		                            </td>
		                        </tr>
		                    </tbody>   
		                </table>
		                <div class="h-16 p-2 flex justify-center">
		                    <button type="button" onclick="" style="width: 150px;">회원탈퇴</button>
		                    <button type="submit" style="width: 150px;">수정</button>            
		                </div>
		            </form>
                </div>
			</div>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	<section class="body-font">
    	<div class="container mx-auto flex justify-start">
        	<div class="w-1/4 h-full py-8">
	            <h3 class="text-4xl font-extrabold"><a href="${path}/member/memberMypage.do">마이페이지</a></h3>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>개인</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/notice/noticeSelectList.do">고객센터</a></li>
			                <li class="py-2"><a href="${path}/member/memberCheckPwd.do">정보변경</a></li>
			                <li class="py-2"><a href="${path}/member/cartList.do">장바구니</a></li>
			                <li class="py-2"><a href="${path}/member/memberHeartList.do">찜 목록</a></li>
			                <li class="py-2"><a href="${path }//member/memberMyReview.do">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>구매/혜택</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="#">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="#">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">내 리뷰 관리</h3>
        		</div>
        		<c:if test="${list=='[]'}">
        			<div class="flex justify-center mt-5">
        				<h3 class="text-lg font-bold">등록한 리뷰가 없습니다.</h3>
        			</div>
        		</c:if>
        		<c:if test="${list!='[]'}">
        		<div class="flex w-full flex-col justify-center mt-5" >
        			<div class="flex justify-end mb-2">
        				<h4>총 <span class="text-blue-500 font-semibold">${totalData }</span>개의 리뷰를 등록했습니다.</h4>
        			</div>
        			<c:forEach var="r" items="${list }">
        			<!-- 기본 리뷰 -->
        			<div class="border mb-2">
	        			<form action="${path}/member/memberReviewDelete.do" onsubmit="return fn_myReview_reviewDelete()" 
	        			method="post">
	        				<input type="hidden" name="bookCode" value="${r.book.bookCode }"/>
	        				<input type="hidden" name="memberId" value="${loginMember.memberId }"/>
		        			<div class="flex mx-8 h-64">
		        				<div class="w-4/5 h-full p-2 flex flex-col">
		        					<div class="flex flex-col justify-center h-1/4">
		        						<h3 class="text-xl font-semibold">${r.book.bookTitle }</h3>
		        					</div>
		        					<div class="h-1/4 flex">
		        						<c:if test="${r.point==1 }">
		        							<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        							<c:forEach begin="0" end="3">
		        								<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        							</c:forEach>
		        						</c:if>
		        						<c:if test="${r.point==2 }">
			        						<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
			        						<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        							<c:forEach begin="0" end="2">
		        								<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        							</c:forEach>
		        						</c:if>
		        						<c:if test="${r.point==3 }">
		        							<c:forEach begin="0" end="2">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        							</c:forEach>
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        						</c:if>
		        						<c:if test="${r.point==4 }">
		        							<c:forEach begin="0" end="3">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        							</c:forEach>
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        						</c:if>
		        						<c:if test="${r.point==5 }">
		        							<c:forEach begin="0" end="4">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1" >
		        							</c:forEach>
		        						</c:if>
		        						<div class="pl-2">${r.reviewDate }</div>
		        					</div>   
		        					<div class="h-2/4">
		        						<h4>${r.reviewContent }</h4>
		        					</div>   					
			        			</div>
			        			<div class="w-1/5 flex justify-center h-full p-2 ">
			        				<div class="h-full flex items-center">
			        					<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
					        			focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
					        			transition ease-in duration-300 w-20 h-8" type="button"
					        			onclick="fn_myReview_reviewUpdate(event);">수정</button>
					        			<button class="border bg-white text-black rounded-full tracking-wide font-semibold 
					        			focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
					        			transition ease-in duration-300 hover:text-gray-100 w-20 h-8" type="submit">삭제</button>
			        				</div>		
			        			</div>
		        			</div>	
		        		</form>
	        		</div>
	        		<!-- 리뷰 수정 div -->
	        		<div class="hidden border mb-2">
		        		<form action="${path}/member/memberReviewUpdate.do" onsubmit="return fn_myReview_reviewUpdateEnd()" method="post">
			        		<div class="flex mx-8 h-72">
			        			<input type="hidden" name="bookCode" value="${r.book.bookCode }"/>
	        					<input type="hidden" name="memberId" value="${loginMember.memberId }"/>
	        					<input type="hidden" name="point" value="${r.point }"/>
			        			<div class="w-full h-full p-2 flex flex-col">
			        				<div class="h-1/6">
			        					<h3 class="text-xl font-medium">${r.book.bookTitle }</h3>
			        				</div>
			        				<div class="h-1/6 flex">
		        						<c:if test="${r.point==1 }">
		        							<img src="${path}/resources/img/star_on.png" alt="" class="w-8 h-8 mr-1"
		        							onclick="fn_myReview_point(event);">
		        							<c:forEach begin="0" end="3">
		        								<img src="${path}/resources/img/star_off.png" alt="" class="w-8 h-8 mr-1"
		        								onclick="fn_myReview_point(event);">
		        							</c:forEach>
		        						</c:if>
		        						<c:if test="${r.point==2 }">
			        						<img src="${path}/resources/img/star_on.png" alt="" id="star" class="w-8 h-8 mr-1"
			        						onclick="fn_myReview_point(event);">
			        						<img src="${path}/resources/img/star_on.png" alt="" class="w-8 h-8 mr-1"
			        						onclick="fn_myReview_point(event);">
		        							<c:forEach begin="0" end="2">
		        								<img src="${path}/resources/img/star_off.png" alt="" class="w-8 h-8 mr-1"
		        								onclick="fn_myReview_point(event);">
		        							</c:forEach>
		        						</c:if>
		        						<c:if test="${r.point==3 }">
		        							<c:forEach begin="0" end="2">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-8 h-8 mr-1"
		        								onclick="fn_myReview_point(event);">
		        							</c:forEach>
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-8 h-8 mr-1"
		        							onclick="fn_myReview_point(event);">
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-8 h-8 mr-1"
		        							onclick="fn_myReview_point(event);">
		        						</c:if>
		        						<c:if test="${r.point==4 }">
		        							<c:forEach begin="0" end="3">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-8 h-8 mr-1"
		        								onclick="fn_myReview_point(event);">
		        							</c:forEach>
		        							<img src="${path}/resources/img/star_off.png" alt="" class="w-8 h-8 mr-1"
		        							onclick="fn_myReview_point(event);">
		        						</c:if>
		        						<c:if test="${r.point==5 }">
		        							<c:forEach begin="0" end="4">
		        								<img src="${path}/resources/img/star_on.png" alt="" class="w-8 h-8 mr-1"
		        								onclick="fn_myReview_point(event);">
		        							</c:forEach>
		        						</c:if>
			        				</div>   
			        				<div class="h-3/6">
			        					<textarea name="reviewContent" class="w-full border h-full">${r.reviewContent }</textarea>
			        				</div>   	
			        				<div class="h-1/6 flex items-center">
				        				<button class="border bg-white text-black rounded-full tracking-wide font-semibold 
						        		focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
						        		transition ease-in duration-300 hover:text-gray-100 w-14 h-8" type="button"
						        		onclick="fn_myReview_reviewUpdateCancel(event);">취소</button>
						        		<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
						        		focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
						        		transition ease-in duration-300 w-24 h-8" type="submit"">수정완료</button>
				        			</div>				
								</div>
			        		</div>
						</form>
					</div>
        			</c:forEach>				
        		</div>
        		<div class="pageBar flex my-5">${pageBar}</div>
        		</c:if>
			</div>
		</div>
    </section>
    <script>
    	//리뷰 수정창
    	function fn_myReview_reviewUpdate(e){
    		let reviewContainer=$(e.target).parent().parent().parent().parent().parent();
    		let updateContainer=$(e.target).parent().parent().parent().parent().parent().next();
    		reviewContainer.hide(); //기존 리뷰창 숨기기
    		updateContainer.show(); //리뷰 수정창 보이기
    	}
    	
    	//리뷰 수정창 나가기
    	function fn_myReview_reviewUpdateCancel(e){
    		let reviewContainer=$(e.target).parent().parent().parent().parent().parent().prev();
    		let updateContainer=$(e.target).parent().parent().parent().parent().parent();
    		reviewContainer.show(); //기존 리뷰창 보이기
    		updateContainer.hide(); //리뷰 수정창 숨기기
    	}
    	
    	//리뷰 별점 수정
    	function fn_myReview_point(e){
    		let starOff=[];
    		let starOn=[];
    		starOff=$(e.target).nextAll();
    		starOn=$(e.target).prevAll();
    		//이미지 누르는 별접으로 변경하는 로직
    		for(var i=0; i<starOn.length; i++){
    			starOn[i].src='${path}/resources/img/star_on.png';
    		}
    		$(e.target).attr("src",'${path}/resources/img/star_on.png');
    		for(var i=0; i<starOff.length; i++){
    			starOff[i].src='${path}/resources/img/star_off.png';
    		}		
    		//변경된 이미지에 맞춰 point값을 넣어줌
    		if(starOn.length==0){
    			$(e.target).parent().parent().parent().children().eq(2).val(1);
    		}else if(starOn.length==1){
    			$(e.target).parent().parent().parent().children().eq(2).val(2);
    		}else if(starOn.length==2){
    			$(e.target).parent().parent().parent().children().eq(2).val(3);
    		}else if(starOn.length==3){
    			$(e.target).parent().parent().parent().children().eq(2).val(4);
    		}else{
    			$(e.target).parent().parent().parent().children().eq(2).val(5);
    		}
    		
    	}
    	
    	//리뷰 수정
    	function fn_myReview_reviewUpdateEnd(){
    		
    	}
    	
    	//리뷰 삭제
    	function fn_myReview_reviewDelete(){
    		if(confirm("정말 삭제하시겠습니까?")){
    			return true;
    		}
    		return false;
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
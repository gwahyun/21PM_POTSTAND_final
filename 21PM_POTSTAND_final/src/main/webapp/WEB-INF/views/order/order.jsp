<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:forEach var="a" items="${memberInfo.addresses}">
	<c:if test="${a.defaultAddr eq 'Y'}">
		<c:set var="defAddr" value="${a}"/>
	</c:if>
</c:forEach>
<c:if test="${fn:length(memberInfo.memberPhone)==11}">
	<c:set var="phone1" value="${fn:substring(memberInfo.memberPhone,0,3)}"/>
	<c:set var="phone2" value="${fn:substring(memberInfo.memberPhone,3,7)}"/>
	<c:set var="phone3" value="${fn:substring(memberInfo.memberPhone,7,11)}"/>
</c:if> 
<c:if test="${fn:length(memberInfo.memberPhone)==10}">
	<c:set var="phone1" value="${fn:substring(memberInfo.memberPhone,0,3)}"/>
	<c:set var="phone2" value="${fn:substring(memberInfo.memberPhone,3,6)}"/>
	<c:set var="phone3" value="${fn:substring(memberInfo.memberPhone,6,10)}"/>
</c:if>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			$("#postNo").val(zipNo);
		}
	</script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!------------------------------------------------------------------------------------------------------------------------------------------------------------->
<section class="mx-80">
	<div>
		<h1 class="text-4xl font-bold m-5 text-center">상품 구매</h1>
	</div>


	<c:if test="${!empty cartList}">
		<div class="content-container">
			<div class="cart-list w-full border border-solid border-gray-400 p-4">
				<h3
					class="inline-block text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 ">
					상품확인 : ${fn:length(cartList)} 건</h3>
				<span class="inline-block text-xs ml-4">상품정보 변경을 원하시면 →</span>
				<button class="bg-gray-300 
                			border border-solid border-gray-400 
                			py-1 px-1 
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				font-bold text-xs
	          				mt-4 md:mt-0"
	          			onclick="location.assign('${path}/member/cartList.do')">장바구니로</button>
				<!-- 카트 항목 출력 -->
				<c:forEach var="cart" items="${cartList}" varStatus="i">
					<div
						class="cart-obj 
	                		flex m-1 py-1 
	                		border-t border-b border-solid border-gray-400 
	                		items-center">


						<!-- 책 표지 -->
						<div class="img-area w-24 h-24 mx-5">
							<img src=
							
							 <c:if test="${cart.book.bookCover.contains('http') }">
	              				<c:out value="${cart.book.bookCover}"/>
	              			</c:if>
	              			<c:if test="${!cart.book.bookCover.contains('http') }">
	              				${path }/resources/upload/book/${cart.book.bookCover }
		              		</c:if>
							
							 class="w-full h-full">
						</div>


						<!-- 책 제목, 작가, 삭제버튼 -->
						<div class="obj-info ml-6 w-5/12">
							<h2 class="bookTitle my-3 text-base font-bold">
								<c:out value="${cart.book.bookTitle}" escapeXml="false" />
							</h2>
							<h4 class="my-3 text-sm font-medium">
								<c:out value="${cart.book.bookWriter}" />
							</h4>
							<!-- 수량 -->
							<div>
								<label class="text-sm">수량 : </label> <input type="number"
									class="w-2/12 text-right border border-solid border-gray-300 text-sm"
									name="bookAmount" value="${cart.bookAmount}" readonly>권
								<input type="hidden" name="cartNo" value="${cart.cartNo}" />
								<input type="hidden" name="cartBookAmount" value="${cart.cartNo}" />
							</div>
						</div>


						<!--수량, 가격, 쿠폰적용 -->
						<div class="price ml-6 w-7/12 flex">
							<!-- 가격-->
							<div class="price-info text-sm w-6/12">
								<!-- 원래 가격 -->
								<label>권당 가격 : </label>
								<h3 class="inline ori-price m-3 text-base text-right my-3">
									<fmt:formatNumber type="currency" value="${cart.book.bookCost}" />
								</h3>
								<br>


								<!-- 구매가격 -->
								<label>구매 가격 : </label>
								<c:if test="${cart.usedCouponNo==0}">
									<h3
										class="inline ori-price-total m-3 text-base text-right font-bold ">
										<fmt:formatNumber type="currency"
											value="${cart.book.bookCost * cart.bookAmount}" />
										<input type="hidden" name="cartBookCost" value="${cart.book.bookCost * cart.bookAmount}" />
									</h3>
								</c:if>
								<c:if test="${cart.usedCouponNo!=0}">
									<h3
										class="inline ori-price-total m-3 text-base text-right font-bold line-through text-gray-400">
										<fmt:formatNumber type="currency"
											value="${cart.book.bookCost * cart.bookAmount}" />
									</h3>
								</c:if>



								<!-- 할인 가격 -->
								<br>
								<c:if test="${cart.usedCouponNo==0}">
									<label class="discalc hidden">할인 가격 : </label>
									<h2
										class="inline hidden dis-price m-3 text-base text-right font-bold ">

									</h2>
								</c:if>
								<c:if test="${cart.usedCouponNo!=0}">
									<label class="discalc">할인 가격 : </label>
									<h2
										class="inline dis-price m-3 text-base text-right font-bold ">
										<c:forEach var="cp" items="${cart.coupon}">
											<c:if test="${cp.couponNo==cart.usedCouponNo}">
												<fmt:formatNumber type="currency"
													value="${cart.book.bookCost * cart.bookAmount *(1-cp.event.discount)}" />
												<input type="hidden" name="cartBookCost" value="${cart.book.bookCost * cart.bookAmount *(1-cp.event.discount)}" />
											</c:if>
										</c:forEach>
									</h2>
								</c:if>
							</div>



							<!-- 쿠폰 : 쿠폰 없는경우 / 쿠폰 있는데 적용 안한경우 / 쿠폰 있고 적용한경우-->
							<div class="w-6/12">
								<c:choose>
									<c:when
										test="${fn:length(cart.coupon)==1 and empty cart.coupon[0].couponEnd}">
										<label class="coupon text-base font-bold mt-4 block">사용
											가능한 쿠폰이 없습니다.</label>
									</c:when>
									<c:otherwise>
										<label class="coupon text-sm font-bold  block mt-1">
											사용 쿠폰</label>
										 <select name="bookCoupon" class="text-sm appearance-none" disabled="disabled">
											<option value="${cart.cartNo}:0:0">쿠폰 사용 안함</option>
											<c:forEach var="cp" items="${cart.coupon}">
												<c:if test="${cp.couponEnd eq 'N'}">
													<c:choose>
														<c:when test="${cart.usedCouponNo==cp.couponNo}">
															<option
																value="${cart.cartNo}:${cp.couponNo}:${cp.event.discount}"
																selected>
																<c:out value="${cp.event.eventTitle}" />
															</option>
														</c:when>
														<c:otherwise>
															<option
																value="${cart.cartNo}:${cp.couponNo}:${cp.event.discount}">
																<c:out value="${cp.event.eventTitle}" />
															</option>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</select>
									</c:otherwise>
								</c:choose>
							</div>


						</div>


					</div>
				</c:forEach>
			</div>

			<!-- 가격표시창 -->
			<div
				class="buy-container w-full border border-solid border-blue-400 items-center my-5 h-24 flex">
				<div class="cart-price w-full flex">
					<div id="sum-price" class="li w-3/12 text-center align-middle">
						<h3 class="my-3 text-xl font-semibold">총 상품 금액</h3>
						<h3 class="money my-3 text-xl font-semibold text-center"></h3>
					</div>
					<div id="sale-price"
						class="li bg-blue-300 w-3/12 text-center align-middle">
						<h3 class="my-3 text-xl font-semibold">할인 금액</h3>
						<h3 class="money my-3 text-xl font-semibold text-center"></h3>
					</div>
					<div id="send-cost" class="li w-3/12 text-center align-middle">
						<h3 class="my-3 text-xl font-semibold">배송비</h3>
						<h3 class="money my-3 text-xl font-semibold text-center">₩3,000</h3>
					</div>
					<div id="total"
						class="li bg-green-300 w-3/12 text-center align-middle">
						<h3 class="my-3 text-xl font-bold">합계</h3>
						<h3 class="money my-3 text-xl font-bold text-center"></h3>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<div
		class="member-container w-full border border-solid border-gray-400 p-4">
		<div class="flex">
			<h3	class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 w-4/12">주문고객</h3>
			<h3	class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 w-8/12">배송지정보</h3>
		</div>
		<div class="flex">
			<div
				class="member-info w-4/12 mr-2 border border-solid border-gray-400 pl-1">
				<div class="memberName my-3">
					<span class="inline-block w-3/12 text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">이름</span>
					<input type="text" name="memberName"
						value="<c:out value='${memberInfo.memberName}'/>">
				</div>
				<div class="memberPhone my-3">
					<span class="inline-block w-3/12 text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">휴대폰</span>
					<input type="text" name="memberPhone"
						value="<c:out value='${memberInfo.memberPhone}'/>">
				</div>
				<div class="memberEmail my-3">
					<span class="inline-block w-3/12 text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">이메일</span>
					<input type="text" name="memberEmail"
						value="<c:out value='${memberInfo.memberEmail}'/>">
				</div>
			</div>		
			<div
				class="member-addr w-8/12 ml-2 border border-solid border-gray-400 p-1">
				<div class="address-radio mb-1">
					<span class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">배송지</span>
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address-type" value="default" checked>기본배송지</label> 
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address-type" value="recent">최근배송지</label> 
					<label class="text-sm"><input class="modal-open pl-2 mx-3 my-2" type="radio" name="address-type" value="list">주소록</label>
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address-type" value="new">새로입력</label>
				</div>
				<div class="receiver">
					<span class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">받는사람</span>
					<input class="border-b border-gray-400 border-solid focus:outline-none" type="text" name="receiver" value="${memberInfo.memberName}">
				</div>
				<div class="address-info">
					<h3 class="text-base font-bold border-l-4 border-red-400 border-solid mt-2 mx-2 pl-3 focus:outline-none">배송주소</h3>
					<div class="ml-6">
						<label class="inline-block text-sm mr-3 w-20">우편번호</label>
						<input id="postNo" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid focus:outline-none" type="text" name="postNo" value="${defAddr.postNo}" readonly>
						<button class="find-addr inline-block w-1/12 text-xs border border-gray-400 border-solid" onclick="goPopup();">주소찾기</button>
					</div>
					<div class="ml-6">
						<label class="inline-block text-sm mr-3 w-20">도로명 주소</label>
						<input id="roadAddrPart1" class="text-xs w-6/12 mr-3 border-b border-gray-400 border-solid focus:outline-none" type="text" name="roadAddr1" value="${defAddr.roadAddr}" readonly>
					</div>
					<div class="ml-6 b">
						<label class="inline-block text-sm mr-3 w-20">상세주소</label>
						<input id="addrDetail" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid focus:outline-none" type="text" name="addrDetail" value="${defAddr.oldAddr}">
						<input id="roadAddrPart2" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid focus:outline-none" type="text" name="roadAddr2" value="${defAddr.detailAddr}" readonly>
						<button class="add-addr inline-block ml-3 w-2/12 text-xs border border-gray-400 border-solid hidden" onclick="add_address();">주소록에 추가</button>
					</div>
				</div>
				<div class="phone">
				<h3 class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">연락처</h3>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">휴대폰</label>
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone1" value="${phone1}">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone2" value="${phone2}">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone3" value="${phone3}">
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div
		class="pay-container my-5 w-full border border-solid border-gray-400 p-4">
		<div class="w-full flex">
			<h3	class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 w-4/12">추가 및 확인사항</h3>
		</div>
		<div class="flex">
			<div class="payMethodSelect w-4/12 mx-1 border border-solid border-gray-400 text-sm ">
				<div class="w-full mt-2 mb-4 pl-4 pr-2">
					<span class="inline-block w-3/12">영수증</span>
					<label class="inline-block w-4/12">
						<input type="radio" name="billprice" value="Y" checked>
						가격표시
					</label>
					<label class="inline-block w-4/12">
						<input type="radio" name="billprice" value="N">
						표시안함
					</label>
				</div>
				<div class="w-full flex mb-2 px-4">
					<span class="inline-block w-3/12">받는분에게<br>메세지</span>
					<input class="w-9/12 border-b border-solid border-gray-400" type="text" name="message" value="">
				</div>
				<div class="w-full flex mb-2 px-4">
					<span class="inline-block w-3/12">택배사에게<br>메세지</span>
					<input class="w-9/12 border-b border-solid border-gray-400" type="text" name="post-message" value="">
				</div>
			</div>
			<div class="pay-info w-4/12 mx-1 border border-solid border-gray-400 text-sm">
				<div class="w-full bg-blue-100 flex pl-4 pr-2 pt-3 pb-3">
					<span class="inline-block w-4/12 text-blue-600 text-xl font-bold">결제금액</span>
					<span id="final-price" class="w-8/12 text-red-600 text-xl font-bold text-right pr-9"></span>
				</div>
				<div class="w-full flex pl-4 pr-2 pt-3 pb-3">
				<span class="inline-block w-4/12 text-lg font-bold">누적 포인트</span>
					<span id="point-stack" class="w-8/12 text-red-600 text-base font-bold text-right pr-9"></span>
				</div>
				<div class="w-full flex pl-4 pr-2 pt-3 pb-3">
					<span class="inline-block w-5/12 text-lg font-bold">적용가능 쿠폰</span>
					<c:choose>

						<c:when
							test="${fn:length(couponList)==1 and empty couponList[0].couponEnd}">
							<label class="coupon w-6/12 text-base text-right font-bold mt-4 block">
								사용 가능한 쿠폰이 없습니다.
							</label>
						</c:when>

						<c:otherwise>
							<select name="couponData" class="w-7/12 text-sm border-b border-solid border-gray-400" style="text-align-last:right">
								<option class="text-right" value="0:0">쿠폰 사용 안함</option>
								<c:forEach var="cp" items="${couponList}">
									<c:if test="${cp.couponEnd eq 'N' and cp.couponAmount!=0}">
										<option class="text-right" 
											value="${cp.couponNo}:${cp.event.discount}">
											<c:out value="${cp.event.eventTitle} : ${cp.couponAmount}개" />
										</option>
									</c:if>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="pay-info w-4/12 mx-1 border border-solid border-gray-400 text-sm">
				<div class="w-full">
					<span class="inline-block p-5 bg-red-200 w-full text-center text-sm font-bold">주문하실 상품, 가격, 배송정보, 할인정보 등을 <br>확인하였으며, 구매에 동의하시겠습니까?</span>
 					<label class="flex px-5 py-2 w-full text-xs font-bold justify-center">
 					<input type="checkbox" name="trade-agree">
 						&nbsp&nbsp동의합니다. (전자상거래법 제 8조 제2항)
 					</label>
				</div>
				<div class="w-full flex justify-center align-middle h-1/4 ">		
					<button id="pay-button" class="border border-solid border-gray-400 w-3/12 bg-green-200" onclick="requestPay()">결제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
  <div class="modal opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    
    <div class="modal-container bg-white w-11/12 md:w-5/12 mx-10 rounded shadow-lg z-50 overflow-y-auto">
      
      <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
          <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
        </svg>
        <span class="text-sm">(Esc)</span>
      </div>

      <!-- Add margin if you want to see some of the overlay behind the modal-->
      <div class="modal-content py-3 text-left px-3">
        <!--Title-->
        <div class="flex justify-between items-center pb-3">
          <p class="text-2xl font-bold">Simple Modal!</p>
          <div class="modal-close cursor-pointer z-50">
            <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
              <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
            </svg>
          </div>
        </div>

        <!--Body-->
        <table class="w-full border border-solid border-gray-400">
        	<tr class="border border-solid border-gray-400">
        		<th class="w-2/12 m-1 text-sm text-center border border-solid border-gray-400">수령자</th>
        		<th class="w-6/12 m-1 text-sm text-center border border-solid border-gray-400">배송지</th>
        		<th class="w-2/12 m-1 text-sm text-center border border-solid border-gray-400">관리</th>
        	</tr>
        	
        	<!-- 반복문으로 주소록 조회 -->
        	<c:forEach var="a" items="${memberInfo.addresses}">
	        	<tr class="border border-solid border-gray-400">
	        		<input type="hidden" name="addrNo" value="${a.addrNo}">
	        		<td class="text-xs m-1 border border-solid border-gray-400"><input type="text" class="focus:outline-none text-center" name="receiverName" value="${memberInfo.memberName}" readonly/></td>
	        		<td class="text-xs m-1 border border-solid border-gray-400"><input type="text" class="focus:outline-none w-full cursor-pointer text-center hover:underline" name="receiverAddr" value="${a.postNo +=' '+= a.roadAddr +=' '+= a.oldAddr +=' '+= a.detailAddr}" readonly/></td>
	        		<td class="text-xs m-1 border border-solid border-gray-400"><button class="inline-block w-full text-xs border border-gray-400 border-solid hover:bg-blue-200">수정</button></td>
	        	</tr>
        	</c:forEach>
        </table>

        <!--Footer-->
        <div class="flex justify-end pt-2">
          <button class="px-4 bg-transparent p-3 rounded-lg text-indigo-500 hover:bg-gray-100 hover:text-indigo-400 mr-2">Action</button>
          <button class="modal-close px-4 bg-indigo-500 p-3 rounded-lg text-white hover:bg-indigo-400">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	
	
	<form id="successForm" action="${path}/member/memberMypage.do" method="post"/>
	<form id="failForm" action="${path}/order/orderItems.do" method="post"/>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
var IMP = window.IMP;
IMP.init("imp89075565"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

// IMP.request_pay(param, callback) 호출
//주문번호(merchant_uid) 생성하기
function requestPay() {
	if(!$("input[name='trade-agree']").is(":checked")){
		alert("구매정보를 확인하고 동의해주세요");
		return;
		
	}else if($("input[name='receiver']").val("")=="" || $("input[name='receiver']").val("")==null 
			|| $("#postNo").val()=="" || $("#postNo").val()==null 
			||$("#roadAddrPart1").val()=="" || $("#roadAddrPart1").val()==null 
			||$("#addrDetail").val()=="" || $("#addrDetail").val()==null 
			||$("#roadAddrPart2").val()=="" || $("#roadAddrPart2").val()==null){
    		alert("배송지 정보를 다시 확인해주세요"); return;
	
	}else{
		
		//****************************************client에서 parameter 조작됐는지 검사하는 로직 있어야됨**********************************
		//hidden value써서 대강 처리함
		
		//할인적용됐는지 확인
		let arr = $("select[name='couponData']").val().split(":");
		let couponNo = arr[0];
		let discount = arr[1];
		if(arr[0]!=0){
			realPrice=Math.round(realPrice*(1-discount));
		}
		
		let bookTitle = $(".bookTitle");
		let cartNo=[];
		$("input[name='cartNo']").each(function(i,v){
			cartNo.push(Number($(v).val()));
		})
		
		var param=JSON.stringify({
			pg:"html5_inicis",
		    pay_method: "temp",
		    merchant_uid:null,
		    name: $($(".bookTitle").get(0)).text().trim()+"등 "+$(".bookTitle").length+"건",
		    amount: realPrice,
		    buyer_email: "${memberInfo.memberEmail}",
		    buyer_name: "${memberInfo.memberName}",
		    buyer_tel: "${memberInfo.memberPhone}",
		    buyer_addr: "${defAddr.roadAddr}",
		    buyer_postcode: "${defAddr.postNo}",
		    receiverName:$("input[name='receiver']").val(),
		    receiverAddress:$("#postNo").val()+":"+$("#roadAddrPart1").val()+":"+$("#addrDetail").val()+":"+$("#roadAddrPart2").val(),
		    message:$("input[name='message']").val(),
		    postMessage:$("input[name='post-message']").val(),
		    billPrice: $("input[name='billprice']").val(),
		    digital:false,
		    cartNo:cartNo,
		    used_coupon_no:couponNo,
		    point: Number($("#point-stack").text().split(" ")[0])
		});
		
		//주문 선입력
		$.ajax({
	          url: '${path}/ajax/beforePayment.do',
	          method:'post',
	          contentType:'application/json',
	          dataType :'json',
	          data: param,
	          success:function(data){
	        	  param=data;
	          }
	      });
		
	}
	
  // IMP.request_pay(param, callback) 호출
   param=JSON.parse(param);
   IMP.request_pay(param,
	function (rsp) { // callback
	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	      // jQuery로 HTTP 요청
	      param.pay_method=rsp.pay_method;
	      param.cAmount=rsp.paid_amount;
	      $.ajax({
	          url: "${path}/ajax/paymentCheck.do", // 가맹점 서버
	          method: "POST",
	          dataType : "json",
	          contentType:'application/json',
	          data: JSON.stringify({
	              imp_uid: rsp.imp_uid,
	              merchant_uid: rsp.merchant_uid
			  })
	      }).done(function (data) {
	    		if(param.amount == param.cAmount){
	    			param.check=true;
	    			$.ajax({
	    		          url: "${path}/ajax/paymentComplete.do",
	    		          method: "POST",
	    		          dataType : "json",
	    		          contentType:'application/json',
	    		          data: JSON.stringify(param),
	    		          success:function(data){
	    		        	  $("#successForm").submit();
	    					}
	    		      });
	    		}else{
	    			param.check=false;
	    			$.ajax({
	    		          url: "${path}/ajax/paymentComplete.do",
	    		          method: "POST",
	    		          dataType : "json",
	    		          contentType:'application/json',
	    		          data: JSON.stringify(param),
	    		          success:function(data){
	    						$("#failForm").submit();
	    				  }
	    		      });
	    		}
	      })
	} else {
	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	      param.check=false;
			$.ajax({
		          url: "${path}/ajax/paymentComplete.do",
		          method: "POST",
		          dataType : "json",
		          contentType:'application/json',
		          data: JSON.stringify(param),
		          success:function(data){
		        	  $("#failForm").submit();
				  }
		   });
	}
  }); 
}




//hidden 값 (조작방지)
let realPrice = 3000;
let realValue =$("input[name='cartBookCost']");
	realValue.each(function(i,v){
		realPrice+=Number($(v).val());
	});	



function fn_priceCalc(){
		//책 원래가격
		let oriPrice=$(".ori-price-total");
		//책 할인가격
		let disPrice=$(".dis-price");
		
		
		//전체 합
		let sumPrice=0;
			oriPrice.each(function(i,v){
				let price = $(v).text().trim().replace("₩","").replace(",","");
				sumPrice+=Number(price);
			});
		
		// 할인해주는 가격 합
		let discountPrice=0;
			disPrice.each(function(i,v){
					let price = $(v).text().trim().replace("₩","").replace(",","");
					let ori = $(v).siblings(".ori-price-total").text().trim().replace("₩","").replace(",","");
					let dis=0;
					if(price!=0||price!=""){
						dis+= ori-price	
					}
					discountPrice-=Number(dis);
			});
		
		//배송비...3000원 고정인데 나중에 로직을 추가하던가 뭐
		
		//
		
		//결제금액
		let totalPrice=sumPrice+discountPrice+3000;
		
		//text 수정
			$("#sum-price>.money").text(sumPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
		
			$("#sale-price>.money").text(discountPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
			
			$("#total>.money").text(totalPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
			$("#final-price").text(realPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
			$("#point-stack").text((Math.round(realPrice*0.05))+" point");		

}
	
	$("select[name='couponData']").change((e)=>{
		let arr = $("select[name='couponData']").val().split(":");
		let couponNo = arr[0];
		let discount = arr[1];
		
		//쿠폰 사용시
		if(arr[0]!=0){
			let disPrice = realPrice*(1-discount);
			$("#final-price").text(disPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
			$("#final-price").removeClass("text-red-600");
			$("#final-price").addClass("text-blue-600");
		//쿠폰 사용안함
		}else{
			$("#final-price").text(realPrice.toLocaleString('ko-KR',{style:'currency',currency:'KRW'}));
			$("#final-price").addClass("text-red-600");
			$("#final-price").removeClass("text-blue-600");
		}
	}); 
		

	
	
	
	//페이지 로드시 장바구니 리스트 가격 출력
	$(document).ready(function(){
		$("input[name='cartObj']").attr("checked",true);
		fn_priceCalc();
	});
	
	$(".method-radio").click((e)=>{
		if($(e.target).is(":checked")){
			$(".method-radio").parents("label").removeClass("bg-red-400");
			$(".method-radio").parents("label").removeClass("text-white");
			$(".method-radio").parents("label").removeClass("font-bold");
			$(".method-radio").parents("label").removeClass("border-4");
			$(".method-radio").parents("label").removeClass("border-red-600");
			$(".method-radio").parents("label").removeClass("border-solid");
	
			$(e.target).parents("label").addClass("bg-red-400");
			$(e.target).parents("label").addClass("text-white");
			$(e.target).parents("label").addClass("font-bold");
			$(e.target).parents("label").addClass("border-4");
			$(e.target).parents("label").addClass("border-red-600");
			$(e.target).parents("label").addClass("border-solid");
		}		
	});

	$("input[name='trade-agree']").click((e)=>{
		if($(e.target).is(":checked")){
			$(e.target).parents("label").addClass("bg-green-200");
			$(e.target).parents("label").addClass("text-green-800");
		}else{
			$(e.target).parents("label").removeClass("bg-green-300");
			$(e.target).parents("label").removeClass("text-green-800");
		}
	});
	
	
	var openmodal = document.querySelectorAll('.modal-open')
    for (var i = 0; i < openmodal.length; i++) {
      openmodal[i].addEventListener('change', function(event){
    	event.preventDefault()
    	toggleModal()
      })
    }
    
    const overlay = document.querySelector('.modal-overlay')
    overlay.addEventListener('click', toggleModal)
    
    var closemodal = document.querySelectorAll('.modal-close')
    for (var i = 0; i < closemodal.length; i++) {
      closemodal[i].addEventListener('click', toggleModal)
    }
    
    document.onkeydown = function(evt) {
      evt = evt || window.event
      var isEscape = false
      if ("key" in evt) {
    	isEscape = (evt.key === "Escape" || evt.key === "Esc")
      } else {
    	isEscape = (evt.keyCode === 27)
      }
      if (isEscape && document.body.classList.contains('modal-active')) {
    	toggleModal()
      }
    };
    
    
    function toggleModal () {
      const body = document.querySelector('body')
      const modal = document.querySelector('.modal')
      modal.classList.toggle('opacity-0')
      modal.classList.toggle('pointer-events-none')
      body.classList.toggle('modal-active')
    }
	
    
    $("input[name='address-type']").change((e)=>{
    	let type =$(e.target).val();
    	switch(type){
    		case "default" : 
    			$(".add-addr").addClass("hidden");
    			$.ajax({
    				url:"${path}/ajax/defaultAddr.do",
    				success:function(data){
    					$("input[name='receiver']").val('${memberInfo.memberName}');
    					$("#postNo").val(data.postNo);
    	    			$("#roadAddrPart1").val(data.roadAddrPart1);
    	    			$("#addrDetail").val(data.addrDetail);
    	    			$("#roadAddrPart2").val(data.roadAddrPart2);		
    				}
    			});
    			break;
    			
    		case "recent" : 
    			$(".add-addr").addClass("hidden");
    			$.ajax({
    				url:"${path}/ajax/recentAddr.do",
    				success:function(data){
    					$("input[name='receiver']").val('${memberInfo.memberName}');
    					$("#postNo").val(data.postNo);
    	    			$("#roadAddrPart1").val(data.roadAddrPart1);
    	    			$("#addrDetail").val(data.addrDetail);
    	    			$("#roadAddrPart2").val(data.roadAddrPart2);		
    				}
    			});
    			break;
    			
    		case "new" : 
    			$("#postNo").val("");
    			$("#roadAddrPart1").val("");
    			$("#addrDetail").val("");
    			$("#roadAddrPart2").val("");
    			$("input[name='receiver']").val("");
    			$(".add-addr").removeClass("hidden");
    			break;
    			
    		case "list" :
    			$(".add-addr").addClass("hidden");
    			break;
    	}
    });
    
    
    
    function add_address(){
    	
    	let receiver = $("input[name='receiver']").val("");
    	let postNo = $("#postNo").val();
    	let roadAddr = $("#roadAddrPart1").val();
    	let oldAddr = $("#addrDetail").val();
    	let detailAddr = $("#roadAddrPart2").val();
    	
    	if(receiver=="" || receiver==null || postNo=="" || postNo==null ||roadAddr=="" || roadAddr==null ||oldAddr=="" || oldAddr==null ||detailAddr=="" || detailAddr==null){
    		alert("배송지 정보를 다시 확인해주세요"); return;
    	};
    	
    	
    	let param={
			"receiver" : receiver,
    		"postNo" : postNo,
    		"roadAddr" : roadAddr,
			"oldAddr" : oldAddr,
			"detailAddr":detailAddr
    	};
    	
    	
    	$.ajax({
    		url:"${path}/ajax/insertAddress.do",
    		data:JSON.stringify(param),
    		dataType:"json",
    		method:'post',
    		contentType:'application/json',
    		success:function(data){
    			data?alert("입력되었습니다."):alert("입력에 실패했습니다.")
    		}
    	});
    } 
</script>

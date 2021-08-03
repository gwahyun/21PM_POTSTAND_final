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
			$("#zipNo").val(zipNo);
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
							<img src="${cart.book.bookCover}" class="w-full h-full">
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
										 <select name="couponData" class="text-sm appearance-none" disabled="disabled">
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
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address" value="default" checked>기본배송지</label> 
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address" value="recent">최근배송지</label> 
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address" value="list">주소록</label>
					<label class="text-sm"><input class="pl-2 mx-3 my-2" type="radio" name="address" value="new">새로입력</label>
				</div>
				<div class="receiver">
					<span class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">받는사람</span>
					<input class="border-b border-gray-400 border-solid" type="text" name="receiver" value="${memberInfo.memberName}">
				</div>
				<div class="address-info">
					<h3 class="text-base font-bold border-l-4 border-red-400 border-solid mt-2 mx-2 pl-3">배송주소</h3>
					<div class="ml-6">
						<label class="inline-block text-sm mr-3 w-20">우편번호</label>
						<input id="postNo" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid" type="text" name="postNo" value="${defAddr.postNo}">
						<button class="inline-block w-1/12 text-xs border border-gray-400 border-solid" onclick="goPopup();">주소찾기</button>
					</div>
					<div class="ml-6">
						<label class="inline-block text-sm mr-3 w-20">도로명 주소</label>
						<input id="roadAddrPart1" class="text-xs w-6/12 mr-3 border-b border-gray-400 border-solid" type="text" name="roadAddr1" value="${defAddr.roadAddr}">
					</div>
					<div class="ml-6 b">
						<label class="inline-block text-sm mr-3 w-20">상세주소</label>
						<input id="addrDetail" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid" type="text" name="addrDetail" value="${defAddr.oldAddr}">
						<input id="roadAddrPart2" class="text-xs w-3/12 mr-3 border-b border-gray-400 border-solid" type="text" name="roadAddr2" value="${defAddr.detailAddr}">
						<button class="inline-block ml-3 w-2/12 text-xs border border-gray-400 border-solid">주소록에 추가</button>
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
			<h3	class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 w-8/12">결제방법</h3>
			<h3	class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 w-4/12">추가입력사항</h3>
		</div>
		<div class="flex">
			<div class="payMethodSelect w-8/12 mx-1 ">
				<ul class="w-full flex flex-wrap h-3/4">
					<li class="w-3/12">
						<label for="card" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center py-2">
							<input id="card" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="card">
							<span>
								신용카드
							</span>
						</label>
					</li>
					<li class="w-3/12">
						<label for="trans" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center py-2">
							<input id="trans" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="trans">
							<span>
								실시간 계좌이체
							</span>
						</label>
					</li>
					<li class="w-3/12">
						<label for="vbank" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center py-2">
							<input id="vbank" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="vbank">
							<span>
								가상계좌
							</span>
						</label>
					</li>
					<li class="w-3/12">
						<label for="phone" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center py-2">
							<input id="phone" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="phone">
							<span>
								휴대폰 소액결제
							</span>
						</label>
					</li>
					<li class="w-3/12">
						<label for="samsung" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center">
							<input id="samsung" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="samsung">
							<img src="${path}/resources/img/samsungpay.png" class="w-5/12">
						</label>
					</li>
					<li class="w-3/12">
						<label for="kakaopay" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center ">
							<input id="kakaopay" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="kakaopay">
							<img src="https://image.yes24.com/sysimage/common/icon/ico_kakaopay.gif" class="w-4/12">
						</label>
					</li>
					<li class="w-3/12">
						<label for="naverpay" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center ">
							<input id="naverpay" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="naverpay">
							<img src="https://image.yes24.com/sysimage/common/icon/ico_naverPay.gif" class="w-6/12">
						</label>
					</li>
					<li class="w-3/12">
						<label for="tosspay" class="flex w-full h-full border border-gray-400 border-solid justify-center items-center">
							<input id="tosspay" class="method-radio appearance-none" type="radio" name="payMethodSelected" value="tosspay">
							<img src="https://wp-blog.toss.im/wp-content/uploads/2019/01/BI_L.png" class="w-6/12 ">
						</label>
					</li>
				</ul>
				<div class="w-full flex justify-center align-middle h-1/4 pt-5">		
					<button class="border border-solid border-gray-400 w-3/12 bg-green-200" onclick="requestPay()">결제하기</button>
				</div>
			</div>
			<div class="pay-info w-4/12 mx-1 border border-solid border-gray-400 text-sm">
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
				<div class="w-full flex mb-4 pl-4 pr-2">
					<span class="inline-block w-3/12">택배사에게<br>메세지</span>
					<input class="w-9/12 border-b border-solid border-gray-400" type="text" name="post-message" value="">
				</div>
				<div class="w-full flex mb-2 pl-4 pr-2">
					<span class="inline-block w-3/12">받는분에게<br>메세지</span>
					<input class="w-9/12 border-b border-solid border-gray-400" type="text" name="message" value="">
				</div>
				<div class="w-full bg-blue-100 flex pl-4 pr-2 pt-3 pb-3">
					<span class="inline-block w-3/12 text-blue-600 text-xl font-bold">결제금액</span>
					<span id="final-price" class="w-9/12 text-red-600 text-xl font-bold text-right pr-9"></span>
				</div>
				<div class="w-full mt-4 mb-4 pl-4 pr-2">
					<span class="inline-block w-full text-sm font-bold">주문하실 상품, 가격, 배송정보, 할인정보 등을 <br>확인하였으며, 구매에 동의하시겠습니까?</span>
 					<label class="inline-block w-full text-xs font-bold mt-3 align-middle">
 					<input type="checkbox" name="trade-agree">
 						동의합니다. (전자상거래법 제 8조 제2항)
 					</label>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp89075565"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

// IMP.request_pay(param, callback) 호출
//주문번호(merchant_uid) 생성하기
function requestPay() {
	if(!$("input[name='trade-agree']").is(":checked")){
		alert("구매정보를 확인하고 동의해주세요");
		return;
		
	}else if(!$("input[name='payMethodSelected']").is(":checked")){
		alert("결제방법을 확인해주세요");
		return;
	
	}else{
		
		//****************************************client에서 parameter 조작됐는지 검사하는 로직 있어야됨**********************************
		//hidden value써서 대강 처리함
		
		
		let bookTitle = $(".bookTitle");
		let cartNo=[];
		$("input[name='cartNo']").each(function(i,v){
			cartNo.push(Number($(v).val()));
		})
		
		var param={
			pg: "html5_inicis",
		    pay_method: $("input[name='payMethodSelected']").val(),
		    merchant_uid: "인서트 실행하고 리턴받아야됨",
		    name: $($(".bookTitle").get(0)).text().trim()+"외 "+$(".bookTitle").length+"건",
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
		    cartNo:cartNo
		}
		
		//주문 선입력
		$.ajax({
	          url: '${path}/ajax/beforePayment.do',
	          method:'post',
	          dataType :'json',
	          data: param,
	          success:function(data){
	        	  console.log("성공");
	        	  console.log(data);
	          }
	      });
		
		return;
	}
  // IMP.request_pay(param, callback) 호출
  
   IMP.request_pay(param,
	function (rsp) { // callback
	  if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	      // jQuery로 HTTP 요청
	      $.ajax({
	          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
	          method: "POST",
	          dataType : "json",
	          data: {
	              imp_uid: rsp.imp_uid,
	              merchant_uid: rsp.merchant_uid
			  }
	      }).done(function (data) {
	        // 가맹점 서버 결제 API 성공시 로직
	      })
	} else {
	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
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

}
			


	
	//쿠폰 할인 적용
	const fn_discount=(e)=>{
		let arr = $(e.target).siblings("select[name='couponData']").val().split(":");
		let cartNo=arr[0];
		let couponNo=arr[1];
		let discount=arr[2];
		let oriprice = $(e.target).parent("div").siblings(".price-info").children(".ori-price-total");
		let disprice =$(e.target).parent("div").siblings(".price-info").children(".dis-price");
		
		let param={
				'cartNo':cartNo,
				'couponNo':couponNo
		}
		$.ajax({
			url:'${path}/ajax/updateCartCoupon.do',
			type:'post',
			data:param,
			dataType:'json',
			success:function(data){
				document.location.reload(true);
			}
		})
	}
	
	$("input[name='cartObj']").change((e)=>{
		if($(e.target).is(":checked")) {
			fn_priceCalc();
		}else{
			fn_priceCalc();
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
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
					class="text-xl font-bold pl-2 border-l-4 border-blue-400 border-solid my-3 ">
					상품확인 : ${fn:length(cartList)} 건</h3>

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
							<h2 class="my-3 text-base font-bold">
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
											사용 가능 쿠폰</label>
										<select name="couponData" class="text-sm">
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

										<button
											class="inline-flex items-center 
						                			bg-gray-300 
						                			border border-solid border-gray-400 
						                			p-1 mb-1 
						                			focus:outline-none 
						                			hover:bg-red-200 
							          				hover:text-white rounded 
							          				text-sm 
							          				mt-4 md:mt-0"
											onclick="fn_discount(event);">쿠폰적용</button>
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
					<input class="pl-2 mx-3 my-2" type="radio" name="address" value="기본배송지" checked><label>기본배송지</label> 
					<input class="pl-2 mx-3 my-2" type="radio" name="address" value="최근배송지"><label>최근배송지</label> 
					<input class="pl-2 mx-3 my-2" type="radio" name="address" value="주소록"><label>주소록</label>
					<input class="pl-2 mx-3 my-2" type="radio" name="address" value="새로입력"><label>새로입력</label>
				</div>
				<div class="receiver">
					<span class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">받는사람</span>
					<input type="text" name="receiver" value="${memberInfo.memberName}">
				</div>
				<div class="address-info">
					<h3 class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">배송주소</h3>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">우편번호</label>
						<input class="text-xs w-3/12 mr-3 border border-gray-400 border-solid" type="text" name="postNo" value="우편번호">
						<button class="inline-block w-1/12 text-xs border border-gray-400 border-solid">주소찾기</button>
					</div>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">도로명 주소</label>
						<input class="text-xs w-8/12 mr-3 border border-gray-400 border-solid" type="text" name="roadAddr" value="도로명주소">
					</div>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">지번 주소</label>
						<input class="text-xs w-8/12 mr-3 border border-gray-400 border-solid" type="text" name="oldAddr" value="지번주소">
						<button class="inline-block w-2/12 text-xs border border-gray-400 border-solid">주소록에 추가</button>
					</div>
				</div>
				<div class="phone">
				<h3 class="text-base font-bold border-l-4 border-red-400 border-solid m-2 pl-3">연락처</h3>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">휴대폰</label>
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone1" value="010">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone2" value="0000">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="phone3" value="0000">
					</div>
					<div class="ml-6 border border-gray-400 border-solid">
						<label class="inline-block text-sm mr-3 w-20">일반전화</label>
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="call1" value="02">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="call2" value="000">
						-
						<input class="text-xs w-1/12 border border-gray-400 border-solid" type="text" name="call3" value="0000">
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div
		class="pay-container my-5 w-full border border-solid border-gray-400 p-4 flex h-40">
		<div class="pay-info w-4/12 mr-2 border border-solid border-gray-400"></div>
		<div
			class="pay-option w-8/12 ml-2 border border-solid border-gray-400"></div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp89075565"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

// IMP.request_pay(param, callback) 호출
IMP.request_pay({ // param
  pg: "html5_inicis",
  pay_method: "card",
  merchant_uid: "ORD20180131-0000011",
  name: "노르웨이 회전 의자",
  amount: 64900,
  buyer_email: "gildong@gmail.com",
  buyer_name: "홍길동",
  buyer_tel: "010-4242-4242",
  buyer_addr: "서울특별시 강남구 신사동",
  buyer_postcode: "01181"
}, function (rsp) { // callback
	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	      // jQuery로 HTTP 요청
	      jQuery.ajax({
	          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
	          method: "POST",
	          headers: { "Content-Type": "application/json" },
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

//주문번호(merchant_uid) 생성하기
function requestPay() {
  // IMP.request_pay(param, callback) 호출
  IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "노르웨이 회전 의자",
      amount: 64900,
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
  }, function (rsp) { // callback
      if (rsp.success) {
          ...,
          // 결제 성공 시 로직,
          ...
      } else {
          ...,
          // 결제 실패 시 로직,
          ...
      }
  });
}








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
	
	
</script>

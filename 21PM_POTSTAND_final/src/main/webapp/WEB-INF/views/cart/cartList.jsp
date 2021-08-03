<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!------------------------------------------------------------------------------------------------------------------------------------------------------------->
<section class="mx-80">
	<div>
		<h1 class="text-4xl font-bold m-5 text-center">장바구니</h1>
	</div>

	<!-- 장바구니 비어있을때 -->
	<c:if test="${empty cartList}">
		<div
			class="cart-obj 
	               flex m-3 py-6 
	               border-t border-b border-solid border-gray-400 
	               items-center">
			<h2 class="my-3 text-2xl font-bold text-center w-full">장바구니에 담긴
				상품이 없습니다.</h2>
		</div>
	</c:if>


	<!-- 장바구니 내용 있을 때 -->
	<c:if test="${!empty cartList}">
		<div class="content-container flex">
			<div
				class="cart-list w-8/12 mx-4 border border-solid border-gray-400 p-4">
				<button
					class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			p-2
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0"
					onclick="fn_allCheck(event);">전체해제</button>

				<!-- 카트 항목 출력 -->
				<c:forEach var="cart" items="${cartList}" varStatus="i">
					<div
						class="cart-obj 
	                		flex m-1 py-1 
	                		border-t border-b border-solid border-gray-400 
	                		items-center">
						<input type="checkbox" name="cartObj" class="ml-3">


						<!-- 책 표지 -->
						<div class="img-area w-24 h-24 mx-5">
							<img src="${cart.book.bookCover}" class="w-full h-full">
						</div>


						<!-- 책 제목, 작가, 삭제버튼 -->
						<div class="obj-info ml-6 w-6/12">
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
									name="bookAmount" value="${cart.bookAmount}">권 <input
									type="hidden" name="cartNo" value="${cart.cartNo}" />
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
									onclick="fn_updateBookAmount(event);">변경</button>
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
									onclick="fn_cartDelete(event);">삭제</button>
								<input type="hidden" name="cartNo" value="${cart.cartNo}" />
							</div>
						</div>


						<!--수량, 가격, 쿠폰적용 -->
						<div class="price ml-6 w-3/12">
							<!-- 가격-->
							<div class="price-info text-sm">
								<!-- 원래 가격 -->
								<label>권당 가격 : </label>
								<h3 class="inline ori-price m-3 text-base text-right ">
									<fmt:formatNumber type="currency" value="${cart.book.bookCost}" />
								</h3>
								<br>


								<!-- 구매가격 -->
								<label>구매 가격 : </label>
								<c:if test="${cart.usedCouponNo==0}">
									<h3
										class="inline ori-price-total m-3 text-base text-right font-bold">
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

							<div>
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
				class="buy-container w-4/12 border border-solid border-blue-400 items-center sticky relative top-0 h-80">
				<div class="cart-price mb-8">
					<div id="sum-price" class="li flex">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">총 상품 금액</h3>
						<h3
							class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right"></h3>
					</div>
					<div id="sale-price" class="li flex bg-blue-300">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">할인 금액</h3>
						<h3
							class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right"></h3>
					</div>
					<div id="send-cost" class="li flex">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">배송비</h3>
						<h3
							class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right">₩3,000</h3>
					</div>
					<div id="total" class="li flex bg-green-300">
						<h3 class="my-3 text-xl font-bold mx-3 w-5/12">합계</h3>
						<h3 class="money my-3 text-xl font-bold ml-10 w-5/12 text-right"></h3>
					</div>
				</div>
				<form id="orderItems" action="${path}/order/orderItems.do" method="post" onsubmit="fn_order();">
				<button
					class="buy-button
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 
                			w-full
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				font-bold
	          				mt-4 md:mt-0"
	          		>구매하기</button>
					<input id="arr" type="hidden" name="cartNo" value="">
				</form>
			</div>	
		</div>
		<div class="button-area m-4">
			<button
				class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 m-3
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0"
				onclick="fn_cartCheckedDelete()">선택삭제</button>
			<button
				class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 m-3
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0"
				onclick="fn_cartAllDelete(event);">전체삭제</button>
		</div>
	</c:if>
</section>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	function fn_priceCalc(){
		//책 원래가격
		let oriPrice=$(".ori-price-total");
		//책 할인가격
		let disPrice=$(".dis-price");
		
		
		//전체 합
		let sumPrice=0;
		oriPrice.each(function(i,v){
			if($(v).parents(".cart-obj").children("input[name='cartObj']").prop("checked")){
			let price = $(v).text().trim().replace("₩","").replace(",","");
			sumPrice+=Number(price);
			}
		});
		
		// 할인해주는 가격 합
		let discountPrice=0;
		disPrice.each(function(i,v){
			if($(v).parents(".cart-obj").children("input[name='cartObj']").prop("checked")){
				let price = $(v).text().trim().replace("₩","").replace(",","");
				let ori = $(v).siblings(".ori-price-total").text().trim().replace("₩","").replace(",","");
				let dis=0;
				if(price!=0||price!=""){
					dis+= ori-price	
				}
				discountPrice-=Number(dis);
			}
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

	const fn_allCheck=(e)=>{
		let str = $(e.target).text().trim();
		if(str=='전체선택'){
			$("input[name='cartObj']").prop("checked", true);
			$(e.target).text('전체해제');
			fn_priceCalc();
		}else{
			$("input[name='cartObj']").prop("checked", false);
			$(e.target).text('전체선택');
			fn_priceCalc();
		}
	};
	
	
	//개별삭제
	const fn_cartDelete=(e)=>{
		let cartNo = $(e.target).siblings("input[name='cartNo']").attr("value");
		$.ajax({
			url:'${path}/ajax/cartObjDelete.do/'+cartNo,
			type:'post',
			success:function(data){
				if(data.result!=0){
					document.location.reload(true);
				}
			}
		})
	}
	
	//전체삭제
	const fn_cartAllDelete=(e)=>{
		$.ajax({
			url:'${path}/ajax/cartObjAllDelete.do',
			type:'post',
			success:function(data){
				if(data.result!=0){
					document.location.reload(true);
				}
			}
		})
	}
	
	//선택삭제
	const fn_cartCheckedDelete=()=>{
		let list = $("input[name='cartObj']");
		let arr=[];
		list.each(function(i,v){
			if($(v).prop("checked")){
				arr.push($(v).siblings(".obj-info").children("div").children("input[name='cartNo']").attr("value"));
			}
		});

		let params={
				"arr":arr
		}		

		$.ajax({
			url:'${path}/ajax/cartObjCheckedDelete.do',
			type:'post',
			dataType:'json',
			data:params,
			success:function(data){
				if(data.result!=0){
					alert(arr.length+"개 항목 삭제");
					document.location.reload(true);
				}
			}
		})
	}
	
	
	//책 수량 update
	const fn_updateBookAmount=(e)=>{
		let orivalue=$(e.target).siblings("input[name='bookAmount']").attr("value");
		let bookAmount = $(e.target).siblings("input[name='bookAmount']").val();
		
		if(bookAmount<=0){
			alert("0또는 음수로 변경할 수 없습니다.");
			$(e.target).siblings("input[name='bookAmount']").val(orivalue);
			return;
		}
		let cartNo = $(e.target).siblings("input[name='cartNo']").val();
		let params={
				"cartNo":cartNo,
				"bookAmount":bookAmount
		}	
		$.ajax({
			url:'${path}/ajax/cartBookAmountUpdate.do',
			type:'post',
			data:params,
			dataType:'json',
			success:function(data){
				if(data.result!=0){
					document.location.reload(true);
				}
			}
		})
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
	
	
	//구매페이지로 이동시 체크된거 리스트 보내줌
	const fn_order=()=>{
		let list = $("input[name='cartObj']");
		let arr=[];
		list.each(function(i,v){
			if($(v).prop("checked")){
				arr.push($(v).siblings(".obj-info").children("div").children("input[name='cartNo']").attr("value"));
			}
		});
		
		let jsonArr = JSON.stringify(arr);
		$("#arr").attr("value",jsonArr);
		return true;
	}
	
	
	alert("쿠폰 개수+사용일 처리 해야됨");
	
</script>
</html>
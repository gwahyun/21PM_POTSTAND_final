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
	<c:if test="${empty cartList}">
		<div
			class="cart-obj 
	               flex m-3 py-6 
	               border-t border-b border-solid border-gray-400 
	               items-center">
			<h2 class="my-3 text-2xl font-bold text-center w-full">
				장바구니에 담긴	상품이 없습니다.
			</h2>
		</div>
	</c:if>
	<!-- 카트 내용 출력 -->

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
					onclick="fn_allCheck(event);">전체선택</button>
				<c:forEach var="cart" items="${cartList}" varStatus="i">
					<!-- 카트 항목 -->
					<div
						class="cart-obj 
	                		flex m-3 py-6 
	                		border-t border-b border-solid border-gray-400 
	                		items-center">
						<input type="checkbox" name="cartObj" class="ml-3">
						<div class="img-area w-2/12 h-36 mx-5">
							<img src="${cart.book.bookCover}" class="w-full">
						</div>
						<div class="obj-info ml-6 w-4/12">
							<h2 class="my-3 text-2xl font-bold">
								<c:out value="${cart.book.bookTitle}" />
							</h2>
							<h4 class="my-3 text-xl font-medium">
								<c:out value="${cart.book.bookWriter}" />
							</h4>
							<button
								class="inline-flex items-center 
	                			bg-gray-300 
	                			border border-solid border-gray-400 
	                			py-1 px-2 mb-3 
	                			focus:outline-none 
	                			hover:bg-red-200 
		          				hover:text-white rounded 
		          				text-base 
		          				mt-4 md:mt-0"
								onclick="fn_cartDelete(event);">삭제</button>
							<input type="hidden" name="cartNo" value="${cart.cartNo}" />
						</div>
						<div class="price ml-6 w-4/12">
							<h3
								class="ori-price m-3 text-xl text-right font-medium font-bold">
								<c:out value="${cart.book.bookCost}" />
							</h3>
							<h2
								class="dis-price m-3 text-xl text-right font-medium font-bold mb-3"></h2>

							<c:forEach var="cp" items="${cart.coupon}">
								<c:choose>
									<c:when
										test="${fn:length(cart.coupon)==1 and empty cp.couponEnd}">
										<label class="coupon text-l font-bold mb-2 block">사용
											가능한 쿠폰이 없습니다.</label>
									</c:when>
									<c:otherwise>
										<label class="coupon text-l font-bold mb-2 block">사용
											가능 쿠폰</label>
										<c:if test="${cp.couponEnd eq 'N'}">
											<input type="radio"
												class="eventTitle w-1/12 border border-solid border-gray-400 "
												name="couponNo${i.index}" value="${cp.couponNo}">
											<input type="hidden" name="dis-ratio"
												value="${cp.event.discount}">
											<span class="w-10/12"><c:out
													value="${cp.event.eventTitle}" /></span>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
	
	<!-- 쿠폰 로직+구조 바꿔야될거같은데..? 한 책에 적용 가능한 쿠폰이 여러개일수도 있는데???(Event 중복)?
                	 한개 쿠폰으로 여러책을 적용해버리는 문제-> 장바구니에서 체크/select 하면 나머지 disable처리?? ajax??
                	 
                	   -->
	</div>

	<!-- 가격표시창 -->
	<div
		class="buy-container w-4/12 border border-solid border-blue-400 items-center sticky relative top-0 h-80">
		<div class="cart-price mb-8">
			<div id="sum-price" class="li flex">
				<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">총 상품 금액</h3>
				<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12"></h3>
			</div>
			<div id="sale-cost" class="li flex bg-blue-300">
				<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">할인 금액</h3>
				<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12"></h3>
			</div>
			<div id="send-cost" class="li flex">
				<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">배송비</h3>
				<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12">3,000원</h3>
			</div>
			<div id="total" class="li flex bg-green-300">
				<h3 class="my-3 text-xl font-bold mx-3 w-5/12">합계</h3>
				<h3 class="money my-3 text-xl font-bold ml-10 w-5/12"></h3>
			</div>
		</div>
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
			onclick="">구매하기</button>
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
		let oriPrice=$(".ori-price");
		//책 할인가격
		let disPrice=$(".dis-price");
		
		
		//전체 합
		let sumPrice=0;
		oriPrice.each(function(i,v){
			let price = $(v).html().trim();
			sumPrice+=Number(price);
		});
		
		// 할인해주는 가격 합
		let discountPrice=0;
		disPrice.each(function(i,v){
			let price = $(v).html().trim();
			discountPrice-=Number(price);
		});
		
		
		
		//배송비...3000원 고정인데 나중에 로직을 추가하던가 뭐
		
		//
		
		//결제금액
		let totalPrice=sumPrice+discountPrice+3000;
		
		//text 수정
			$("#sum-price>.money").text(sumPrice);
			$("#sale-price>.money").text(discountPrice);
			
			$("#total>.money").text(totalPrice);
		
	}

	const fn_allCheck=(e)=>{
		let str = $(e.target).text().trim();
		if(str=='전체선택'){
			$("input[name='cartObj']").prop("checked", true);
			$(e.target).text('전체해제');
		}else{
			$("input[name='cartObj']").prop("checked", false);
			$(e.target).text('전체선택');
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
				arr.push($(v).siblings(".obj-info").children("input[name='cartNo']").attr("value"));
			}
		});
			
		let params={
				"arr":arr
		}		

		$.ajax({
			url:'${path}/ajax/cartObjCheckedDelete.do',
			type:'post',
			data:params,
			dataType:'json',
			success:function(data){
				if(data.result!=0){
					alert(arr.length+"개 항목 삭제");
					document.location.reload(true);
				}
			}
		})
	}
	
	
	$(document).ready(fn_priceCalc());
	
</script>
</html>
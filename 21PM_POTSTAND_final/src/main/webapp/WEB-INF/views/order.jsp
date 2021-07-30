<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<h1 class="text-4xl font-bold m-5 text-center">결제</h1>
	</div>

		<div class="content-container flex">
			<div
				class="order-list w-8/12 mx-4 border border-solid border-gray-400 p-4">

				<!-- 주문 항목 출력 -->
				<c:forEach var="order" items="${orderList}" varStatus="i">
					<div
						class="order-obj 
	                		flex m-1 py-1 
	                		border-t border-b border-solid border-gray-400 
	                		items-center">
						<input type="checkbox" name="orderObj" class="ml-3">


						<!-- 책 표지 -->
						<div class="img-area w-24 h-24 mx-5">
							<img src="${order.book.bookCover}" class="w-full">
						</div>


						<!-- 책 제목, 작가, 삭제버튼 -->
						<div class="obj-info ml-6 w-4/12">
							<h2 class="my-3 text-2xl font-bold">
								<c:out value="${order.book.bookTitle}" />
							</h2>
							<h4 class="my-3 text-xl font-medium">
								<c:out value="${order.book.bookWriter}" />
							</h4>
							<!-- 수량 -->
							<div>
								<label class="text-sm">수량 : </label> 
								<input type="number"
									class="w-2/12 text-right border border-solid border-gray-300 text-sm"
									name="bookAmount" value="${order.bookAmount}" readonly>권
								<input type="hidden" name="orderNo" value="${order.orderNo}" />
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
								onclick="fn_orderDelete(event);">삭제</button>
							<input type="hidden" name="orderNo" value="${order.orderNo}" />
							</div>
						</div>


						<!--수량, 가격, 쿠폰적용 -->
						<div class="price ml-6 w-4/12">
							<!-- 가격-->
							<div class="price-info text-sm">
								 <!-- 구매가격 -->
								<label>구매 가격 : </label>
								<c:if test="${order.usedCouponNo==0}">
									<h3
										class="inline ori-price-total m-3 text-base text-right font-medium font-bold">
										<fmt:formatNumber type="currency" value="${order.book.bookCost * order.bookAmount}" />
									</h3>
								</c:if>
								<c:if test="${order.usedCouponNo!=0}">
									<h3
										class="inline ori-price-total m-3 text-base text-right font-medium font-bold line-through text-gray-400">
										<fmt:formatNumber type="currency" value="${order.book.bookCost * order.bookAmount}" />
									</h3>
								</c:if>
								
								
							
								<!-- 할인 가격 -->
								<br>
								<c:if test="${order.usedCouponNo==0}">
									<label class="discalc hidden">할인 가격 : </label>
									<h2
										class="inline hidden dis-price m-3 text-base text-right font-medium font-bold ">
	
									</h2>
								</c:if>
								<c:if test="${order.usedCouponNo!=0}">
									<label class="discalc">할인 가격 : </label>
									<h2
										class="inline dis-price m-3 text-base text-right font-medium font-bold ">
										<c:forEach var="cp" items="${order.coupon}">
											<c:if test="${cp.couponNo==order.usedCouponNo}">
												<fmt:formatNumber type="currency" value="${order.book.bookCost * order.bookAmount *(1-cp.event.discount)}" />
											</c:if>
										</c:forEach>
									</h2>
								</c:if>
							</div>



							<!-- 쿠폰 : 쿠폰 없는경우 / 쿠폰 있는데 적용 안한경우 / 쿠폰 있고 적용한경우-->

							<div>

										<label class="coupon text-sm font-bold  block mt-1"> 사용
											가능 쿠폰</label>
										<select name="couponData" class="text-sm">
											<option value="${order.orderNo}:0:0"> 쿠폰 사용 안함</option>
											<c:forEach var="cp" items="${order.coupon}">
												<c:if test="${cp.couponEnd eq 'N'}">
													<c:choose>
														<c:when test="${order.usedCouponNo==cp.couponNo}">
															<option value="${order.orderNo}:${cp.couponNo}:${cp.event.discount}" selected> <c:out value="${cp.event.eventTitle}" />
															</option>
														</c:when>
														<c:otherwise>
															<option value="${order.orderNo}:${cp.couponNo}:${cp.event.discount}"> <c:out value="${cp.event.eventTitle}" />
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
									
							</div>
							
							
						</div>


					</div>
				</c:forEach>
			</div>

			<!-- 가격표시창 -->
			<div
				class="buy-container w-4/12 border border-solid border-blue-400 items-center sticky relative top-0 h-80">
				<div class="order-price mb-8">
					<div id="sum-price" class="li flex">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">총 상품 금액</h3>
						<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right"></h3>
					</div>
					<div id="sale-price" class="li flex bg-blue-300">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">할인 금액</h3>
						<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right"></h3>
					</div>
					<div id="send-cost" class="li flex">
						<h3 class="my-3 text-xl font-semibold mx-3 w-5/12">배송비</h3>
						<h3 class="money my-3 text-xl font-semibold ml-10 w-5/12 text-right">₩3,000</h3>
					</div>
					<div id="total" class="li flex bg-green-300">
						<h3 class="my-3 text-xl font-bold mx-3 w-5/12">합계</h3>
						<h3 class="money my-3 text-xl font-bold ml-10 w-5/12 text-right"></h3>
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
	

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

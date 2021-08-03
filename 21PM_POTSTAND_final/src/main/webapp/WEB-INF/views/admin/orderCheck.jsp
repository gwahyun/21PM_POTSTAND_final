<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
  <div class="admin-content_area">
                    <div class="admin-content">
                        <div class="admin-content_title">
                            주문통합검색
                        </div>
                    </div>
                </div>
                <form action="${path }/admin/orderSelectList" method="post">
                
                <div class="admin-content_area">
                    <div class="admin-content">
                        <div class="admin-content_title">
                            조회기간
                        </div>
                        <div class="admin-search">
                            <div>결제일</div>
                        </div>
                        <div class="admin-search date-search">
                            <a>오늘</a><a>1주일</a><a>1개월</a><a>3개월</a>
                        </div>
                        <div class="admin-search">
                            <input type="date" name="startDate" class="date1"> <span> &nbsp;~&nbsp; </span> 
                            <input type="date" name="endDate" class="date2">
                        </div>
                    </div>
                </div>
                
                <div class="admin-content_area">
                    <div class="admin-content">
                        <div class="admin-content_title">
                            상세조건
                        </div>
                        <div class="admin-search">
                            <select name="type">
                                <option>전체</option>
                                <option value="creditNo">주문번호</option>
                                <option value="productNo">상품번호</option>
                                <option value="memberId">회원자명</option>
                            </select>
                            <input type="text" name="keyword">
                        </div>
                    </div>
                </div>
                
                <div class="admin-content_area">
                    <div class="admin-content">
                        <div class="admin-content_title">
                            주문상태
                        </div>
                        <div class="admin-search">
                            <select name="dType">
                                <option>전체</option>
                                <option>결제완료</option>
                                <option>배송중</option>
                                <option>배송완료</option>
                            </select>
                        </div>
                    </div>
                </div>
                <button class="submit-btn">검색</button>
                </form>
                
            <div class="admin-content_area" style="margin-top: 45px;">
			<div class="admin-content">
				<div class="admin-content_title">
					상품목록 (총 ${count } 개)
				</div>
				<div class="search-table">
				
				
				
				<form method="post" action="/bookin/purchase/purchaseUpdate.kh">
					<table class="table table-border table-hover table-striped purchase-table">
						<thead>
							<tr>
								<th style="width:5%">주문번호</th>
								<th style="width:5%">회원아이디</th>
								<th style="width:5%">상품번호</th>
								<th style="width:5%">수량</th>
								<th style="width:8%">주문상태</th>
								<th style="width:15%">주문일</th>
								<th style="width:10%">수령인</th>
								<th style="width:15%">배송지</th>
								<th style="width:10%">연락처</th>
								<th style="width:10%">판매가</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach items="${list }" var="v">
						<tr style="text-align:center;">
							<td >
							${v.creditNo }
							</td>
							<td>
							${v.memberId }
							</td>
							<td>
							${v.productNo }
							</td>
							<td style="text-align:center;">
							${v.stock }
							</td>
							<td style="text-align:center;">
							${v.status }
							</td>
							<td style="text-align:center;">
							<fmt:formatDate value="${v.creditDate }" pattern="yy년MM월dd일"/>
							</td>
							<td style="text-align:center;">
							${v.recipient }
							</td>
							<td>
							${v.shopAddress }
							</td>
							<td>
							${v.phone }
							</td>
							<td>
							${v.price }
							</td>
							
						</tr>
						</c:forEach>
						
						</tbody>
					</table>
					<button type="submit" class="confirmOrder s-btn" name="confirmOrder" value="true">주문확인</button> 
					<button type="submit" class="delivery s-btn" name="delivery" value="true">출고</button>
				</form>
	
				</div>
			</div>
		</div>
            </section>
        <script>
	window.addEventListener("load",function(){
		var today = new Date();

		const date2=document.querySelector(".date2")
		const date1=document.querySelector(".date1")
		
		if(date1.value=="" && date2.value==""){
			date2.value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
			date2.valueAsNumber= date2.valueAsNumber+24*60*60*1*1000;
			date1.valueAsNumber = date2.valueAsNumber-24*60*60*1*1000;
			
		}
		
		
		const date_range_btn = document.querySelectorAll(".admin-search.date-search>a")
		for(var i = 0 ; i<date_range_btn.length;i++){
			date_range_btn[i].addEventListener("click",function(){
				if(this.textContent=='오늘'){
					date2.value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
					date2.valueAsNumber= date2.valueAsNumber+24*60*60*1*1000;
					date1.valueAsNumber = date2.valueAsNumber-24*60*60*1*1000;
					for(var j = 0 ; j<date_range_btn.length;j++){
						date_range_btn[j].classList.remove('on')
					}
					this.classList.add('on');
				}else if(this.textContent=='1주일'){
					date1.valueAsNumber = date2.valueAsNumber-24*60*60*7*1000;
					for(var j = 0 ; j<date_range_btn.length;j++){
						date_range_btn[j].classList.remove('on')
					}
					this.classList.add('on');
				}else if(this.textContent=='1개월'){
					date1.valueAsNumber = date2.valueAsNumber-24*60*60*31*1000;
					for(var j = 0 ; j<date_range_btn.length;j++){
						date_range_btn[j].classList.remove('on')
					}
					this.classList.add('on');
				}else if(this.textContent=='3개월'){
					date1.valueAsNumber = date2.valueAsNumber-24*60*60*92*1000;
					for(var j = 0 ; j<date_range_btn.length;j++){
						date_range_btn[j].classList.remove('on')
					}
					this.classList.add('on');
				}
			});
		}
		
		
	})
	</script>
</body>
</html>


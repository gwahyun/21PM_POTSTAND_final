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
                <form action="${path }/admin/orderSelectList" method="get">
                
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
                                <option value="orderNo">주문번호</option>
                                <option value="bookNo">상품번호</option>
                                <option value="receiverName">주문자명</option>
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
                                <option>주문확인</option>
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
								<th style="width:3%"><input class="all_cb" type="checkbox"></th>
								<th style="width:5%">주문번호</th>
								<th style="width:5%">상품번호</th>
								<th style="width:5%">수량</th>
								<th style="width:8%">주문상태</th>
								<th style="width:15%">주문일</th>
								<th style="width:10%">수령인</th>
								<th style="width:15%">배송지</th>
								<th style="width:10%">연락처</th>
								<th style="width:10%">정가</th>
								<th style="width:10%">판매가</th>
							</tr>
						</thead>
						
						<tbody>
						
						<tr>
							
							
							<td><input type="checkbox" value="3" name="purchaseNo"></td>
							
							<td class="tr03">
							
							3
							
							
							</td>
							
							
							<td>
							
							10019
							
							
							</td>
							
							
							<td>
							
							1
							
							
							</td>
							
							
							<td>
							
							배송중
							
							
							</td>
							
							
							<td>
							
							2021-06-02 22:28:42
							
							
							</td>
							
							
							<td>
							
							asdasd
							
							
							</td>
							
							
							<td>
							
							asdasd
							
							
							</td>
							
							
							<td>
							
							01011111111
							
							
							</td>
							
							
							<td>
							
							5900
							
							
							</td>
							
							
							<td>
							
							5310
							
							
							</td>
							
						</tr>
						
						
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
            window.onpageshow = function(event){
                if(event.persisted || (window.performance && window.performance.navigation.type==2)){
                    console.log('뒤로가기')
                    window.location.reload();
                }else{
                    console.log('뒤로가기x')
                    console.log(window.performance)
                    console.log(window.performance.navigation.type)
                }
            }
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
                var mySet = new Set();
                const confirmOrder = document.querySelector('.confirmOrder');
                const delivery = document.querySelector('.delivery');
                const tr = document.querySelectorAll("tbody>tr");
                for(var i = 0  ; i<tr.length;i++){
                    tr[i].addEventListener("mouseover",function(){
                        const sel_tr=document.querySelectorAll("."+this.children[1].className);
                        for(var j = 0  ; j<tr.length;j++){
                            tr[j].style.backgroundColor="white";
                        }
                        for(var j =0 ;j<sel_tr.length;j++){
                            sel_tr[j].parentElement.style.backgroundColor="rgb(231, 241, 253,0.5)";
                        }
                    })
                    
                    tr[i].addEventListener("mouseout",function(){
                        for(var j = 0  ; j<tr.length;j++){
                            tr[j].style.backgroundColor="white";
                        }
                        
                    })
                    
                    tr[i].children[0].children[0].addEventListener("input",function(){
                        var cls_name=this.parentElement.nextElementSibling.className;
                        const sel_tr=document.querySelectorAll("."+cls_name);
                        
                        if(this.checked){
                            for(var j =0 ;j<sel_tr.length;j++){
                                sel_tr[j].previousElementSibling.children[0].checked=true;
                                sel_tr[j].previousElementSibling.children[0].classList.remove("ckfalse");
                                sel_tr[j].previousElementSibling.children[0].classList.add("cktrue");
                            }
                        }else{
                            for(var j =0 ;j<sel_tr.length;j++){
                                sel_tr[j].previousElementSibling.children[0].checked=false;
                                sel_tr[j].previousElementSibling.children[0].classList.remove("cktrue");
                                sel_tr[j].previousElementSibling.children[0].classList.add("ckfalse");
                            }
                        }
                        
                        const ck = document.querySelectorAll(".cktrue");
                        if(ck.length==0){
                            delivery.style.display = 'none'
                            confirmOrder.style.display="none"
                        }
                        for(var j=0;j<ck.length;j++){
                            console.log(this.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent)
                            mySet.add(ck[j].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent)
                            
                            if(mySet.size==1){
                                console.dir(mySet)
                                console.log(mySet)
                                if(mySet.has('\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t주문확인\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t')){
                                    delivery.style.display = 'block'
                                    confirmOrder.style.display="none"
                                }else if(mySet.has('\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t결제완료\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t')){
                                    delivery.style.display = 'none'
                                    confirmOrder.style.display="block"
                                }	
                            }else{
                                delivery.style.display = 'none'
                                confirmOrder.style.display="none"
                            }
                            
                        }
                            mySet.clear();
                    })
                }
                
                const all_cb = document.querySelector(".all_cb");
                if(all_cb){
                    all_cb.addEventListener("input",function(){
                        if(this.checked){
                            for(var i = 0  ; i<tr.length;i++){
                                tr[i].children[0].children[0].checked=true;
                                tr[i].children[0].children[0].classList.remove("ckfalse");
                                tr[i].children[0].children[0].classList.add("cktrue");
                            }
                        }else{
                            for(var i = 0  ; i<tr.length;i++){
                                tr[i].children[0].children[0].checked=false;
                                tr[i].children[0].children[0].classList.remove("cktrue");
                                tr[i].children[0].children[0].classList.add("ckfalse");
                            }
                        }
                        
                    })
                }
                
            })
            </script>
</body>
</html>


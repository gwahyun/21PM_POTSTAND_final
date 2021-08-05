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
					매출 통계
				</div>
			</div>
		</div>
		<div class="admin-home_chart_area">
			<div class="admin-chart">
				<div class="admin-content_title admin-search date-search">
					
					<a style="margin-left:8px;">1주일</a><a>1개월</a><a>3개월</a>
					<form action="" class="date_form">
					<input type="date" name="startDate" class="date1" style="margin-left:20px;" value="21-07-13"> <span> &nbsp;~&nbsp; </span> 
					<input type="date" name="endDate" class="date2" value="21-07-21">
					<input type="submit" value="검색" style="margin-left:12px; padding:0.2rem 1rem; color:white; background-color:#ff9f43;border:none;cursor: pointer;box-shadow: rgb(0 0 0 / 16%) 0px 1px 4px; ">
					</form>
				</div>
				<div class="chart">
					<canvas id="myChart" style="width: 100%; height: 530px; display: block; box-sizing: border-box;" width="1656" height="530"></canvas>
				</div>
			</div>
		</div>
		
		<div class="admin-content_area" style="margin-top: 45px;">
			<div class="admin-content">
				<div class="search-table">
				
					<table class="table table-border table-hover table-striped">
						<thead>
							<tr>
								<th style="width:5%">구매번호</th>
								<th style="width:5%">회원아이디</th>
								<th style="width:10%">회원이름</th>
								<!-- <th style="width:5%">상품번호</th> -->
								<th style="width:10%">결제일</th>
								<th style="width:25%">내용</th>
								<th style="width:20%">배송지</th>
								<!-- <th style="width:5%">수량</th> -->
								<th style="width:5%">판매가</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${list }" var="l">
								<tr style="	text-align: center;">
									<td>${l.orderNo }</td>
									<td>${l.memberId }</td>
									<td>${l.receiverName }</td>
									<td ><fmt:formatDate value="${l.payDate }" pattern="yy년MM월dd일"/> </td>
									<%-- <td>${l.productNo }</td> --%>
									<td>${l.name }</td>
									<td>${l.receiverAddr }</td>
									<%-- <td>${l.stock }</td> --%>
									<td><fmt:formatNumber value="${l.amount }" type="currency"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="text-align: right; padding : 1rem">합계 <fmt:formatNumber value="${sumPrice }" type="currency"/>원</div>
	
				</div>
			</div>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
				
				const date_form = document.querySelector(".date_form");
				
				date_form.submit();
			});
		}
	});
	
	
	const labels = [
		
		${c}
		
		];
	const data = {
	  labels: labels,
	  datasets: [
			{
			    label: '매출',
			    yAxisID: 'y',
			    backgroundColor: '#ff9f43',
			    borderColor: '#ff9f43',
			    data: [
			    	
				${d}
					
			    	],
	       	},
	 	 	{
			    label: '수량',
			    yAxisID: 'y1',
			    backgroundColor: '#ff6b6b',
			    borderColor: '#ff6b6b',
			    data: [
			    	
					${e}
					
			    	],
		 	}
	  ]
	};
	
	
	const config = {
			  type: 'line',
			  data: data,
			  options: {
			    responsive: false,
			    interaction: {
			      mode: 'index',
			      intersect: false,
			    },
			    stacked: false,
			    scales: {
			      y: {
			        type: 'linear',
			        display: false,
			        position: 'left',
			      },
			      y1: {
			        type: 'linear',
			        display: false,
			        position: 'right',

			        // grid line settings
			        grid: {
			          drawOnChartArea: false, // only want the grid lines for one axis to show up
			        },
			      },
			    }
			  },
			};
	var myChart = new Chart(
		    document.querySelector('#myChart'),
		    config
		  );

	
	
	</script>
</body>
</html>


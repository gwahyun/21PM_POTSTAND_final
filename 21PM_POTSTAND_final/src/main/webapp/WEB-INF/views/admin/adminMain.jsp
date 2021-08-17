<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        <section>
            <div class="admin-home_content_area">
                <div class="admin-home_content">
                    <div class="admin-content_title">
                        주문 / 배송 (최근 1주일)
                    </div>
                    <div class="admin-content-itmes">
                    <div><span>신규 주문</span><a href="${path }/admin/orderSelectList?startDate=${startDate }&amp;endDate=${endDate }">${count1 } 건</a></div>
                    <div><span>결제완료</span><a href="${path }/admin/orderSelectList?startDate=${startDate }&amp;endDate=${endDate }&type=전체&keyword=&dType=결제완료">${count2 } 건</a></div>
                    <div><span>배송중</span><a href="${path }/admin/orderSelectList?startDate=${startDate }&amp;endDate=${endDate }&type=전체&keyword=&dType=배송중">${count3 } 건</a></div>
                    <div><span>배송완료</span><a href="${path }/admin/orderSelectList?startDate=${startDate }&amp;endDate=${endDate }&type=전체&keyword=&dType=배송완료">${count4 } 건</a></div>
                    <div><span>결제취소</span><a href="${path }/admin/orderSelectList?startDate=${startDate }&amp;endDate=${endDate }&type=전체&keyword=&dType=결제취소">${count5 } 건</a></div>
                    </div>
                </div>
                <div class="admin-home_content">
                    <div class="admin-content_title">
                        문의/리뷰
                    </div>
                    <div class="admin-content-itmes">
                    <div><span>신규 리뷰</span><a href="${path }/admin/reviewManager">${newReview } 건</a></div>
                    <div><span>미답변 문의</span><a href="${path }/admin/qnaManagerNo">${answerNo } 건</a></div>
                    <div><span>입고 요청</span><a href="${path }/admin/requestSelectNo">${requestCount } 건</a></div>
                    </div>
                </div>
                
            </div>
            <div class="admin-home_chart_area">
			
			<div class="admin-chart">
				<div class="admin-content_title admin-search date-search">
					매출 통계
					<a style="margin-left:20px;">1주일</a><a>1개월</a><a>3개월</a>
					<form action="" class="date_form">
					<input type="date" name="startDate" class="date1" style="visibility: hidden">
					<input type="date" name="endDate" class="date2" style="visibility: hidden">
					</form>
				</div>
				<div class="chart">
					<canvas id="myChart" style="width: 100%; height: 530px; display: block; box-sizing: border-box;" width="1656" height="530"></canvas>
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
                date2.value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() -1)).slice(-2);
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
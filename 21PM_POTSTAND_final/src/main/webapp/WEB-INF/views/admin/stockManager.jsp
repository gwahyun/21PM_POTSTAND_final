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
                <div class="admin-content_title">재고 관리</div>
            </div>
</div>
<div class="admin-content_area" >
                <div class="admin-content">
                    <div class="admin-content_title">
                        상품목록 (총 ${count } 권)
                    </div>
                    <form action="${path }/admin/stockManager" method="post">
	                      <div class="admin-content_title">
	                        <input type="text" placeholder="상품번호 입력하세요." name="type">
	                      	<input type="submit" value="검색" >
	                 	   </div>
                    </form>
                    <div class="search-table">
                    <c:if test="${list.size() >= 1}">
          			
	                    <table class="table table-border table-hover table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>저자</th>
									<th>출판사</th>
									<th>정가</th>
									<th style="width : 10%;">출판일</th>
									<th>재고</th>
									<th>재고충전</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="l">
								<tr>
									<td style="	text-align: center;"><fmt:formatNumber value="${l.bookCode }" ></fmt:formatNumber></td>
									<td><a href="#">${l.bookTitle }</a></td>
									<td>${l.bookWriter }</td>
									<td>${l.bookPub }</td>
									<td style="	text-align: center;">${l.bookCost }</td>
									<td style="	text-align: center;"><fmt:formatDate value="${l.bookDate  }" pattern="yyyy년MM월dd일"></fmt:formatDate></td>
									<td style="	text-align: center;">${l.bookStock }권</td>
									<td style="	text-align: center;"><button style="background-color: #FF5A5A;" class="update-btn" onclick="stockInsert(${l.bookCode});">충전</button></td>
									
									
								</tr>
							</c:forEach>
							</tbody>
						</table>
                    </c:if>
                    <c:if test="${list.size() == 0}">
	                    <span class="no_Data">데이터가 없습니다</span>
                    </c:if>
                    
                    </div>
                     <div class="pageBar flex my-5">${pageBar}</div>
                </div>
            </div>
       
</section>
		<script>
			const stockInsert=(bookCode)=>{
				var no = prompt('숫자만 입력하세요');
				if(no.trim().length != 0 && !isNaN(no)){
					location.assign("${path}/admin/stockUpdate?no="+no+"&bookCode="+bookCode);
				}else{
					alert("숫자만 입력하라고요");
				}
			}
		</script>
</body>
</html>


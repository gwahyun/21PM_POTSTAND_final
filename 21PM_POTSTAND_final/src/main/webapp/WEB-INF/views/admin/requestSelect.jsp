<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
<div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">입고 관리</div>
            </div>
</div>
<div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">입고 요청 (총 ${count } 건)</div>
                <form action="${path }/admin/requestSelect" method="post">
                	<div class="admin-content_title">
                	<input type="text" placeholder="상품번호를 입력하세요." name="type">
                	<input type="submit" value="검색 ">
                	</div>
                	
                </form>
                <div class="align-row choice-genre-area">
                    <div class="search-table" style="min-height: 630px;">
                        <table class="table table-border table-hover table-striped" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">요청번호</th>
                                    <th style="width: 2%;">상품번호</th>
                                    <th style="width: 10%;">첵 제목</th>
                                    <th style="width: 4%;">요청자</th>
                                    <!-- <th style="width: 1%;">요청수량</th> -->
                                    <th style="width: 4%;">등록일자</th>
                                    <th style="width: 4%;">처리일자</th>
                                    <th style="width: 1%;">요청상태</th>
                                    <th style="width: 4%;">상품정보</th>
                                    <th style="width: 4%;">재고충전</th>
                                </tr>
                            </thead>
                            <tbody>
                           	<c:forEach items="${list }" var="r">
                                <tr>
                                    <td>${r.requestNo }</td>
                                    <td>${r.book.bookCode }</td>
                                    <td style="text-align: left;">${r.book.bookTitle }</td>
                                    <td>
                                        
                                        ${r.memberId }
                                    </td>
                                    <td><fmt:formatDate value="${r.requestDate }" pattern="yyyy년MM월dd일"></fmt:formatDate></td>
                                    <td><fmt:formatDate value="${r.responseDate }" pattern="yyyy년MM월dd일"></fmt:formatDate></td>
                                    <td>${r.status }</td>
                                    <td><a class="update-btn" href="/bookin/book/bookDetail.jsp?no=10219">상품정보 이동</a></td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${r.status == 'Y'}">
												         		
                                    		</c:when >
                                    		<c:otherwise>
		                                    	<button class="update-btn" onclick="requestUpdate(${r.book.bookCode},${r.requestNo });" style="background-color: #FF5A5A;">충전</button>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                               
                            
                            </tbody>
                        </table>
                     <c:if test="${list.size() == 0}">
	                    <span class="no_Data">데이터가 없습니다</span>
                    </c:if>
                    </div>
                </div>
                <!-- 페이지 네비게이션 자리 -->
                 <div class="pageBar flex my-5">${pageBar}</div>
                    
            </div>
</section>
		<script>
			const requestUpdate=(bookCode,requestNo)=>{
				var no = prompt('숫자만 입력하세요');
				if(no.trim().length != 0 && !isNaN(no)){
					location.assign("${path}/admin/requestUpdate?no="+no+"&bookCode="+bookCode+"&requestNo="+requestNo);
				}else{
					alert("숫자만 입력하라고요");
				}
			}
		</script>
</body>
</html>


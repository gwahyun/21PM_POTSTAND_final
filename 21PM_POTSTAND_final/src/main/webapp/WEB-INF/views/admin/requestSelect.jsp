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
                <div class="admin-content_title">입고 관리
	                <button class="update-btn" style="background-color:gray"onclick="location.assign('${path}/admin/requestSelectNo')">미요청</button>
	                <button class="update-btn" onclick="location.assign('${path}/admin/requestSelect')">전체</button>
                </div>
            </div>
</div>
<div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">입고 요청 (총 ${count } 건)
                
               <select id="searchType">
							<option value="id" >요청자</option>
							<option value="name">책 제목</option>
							<option value="productNo">상품 번호</option>
						</select>
					<div id="search-id">
						<form action="${path }/admin/requestSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 아이디를 입력해주세요">
							<input type="hidden" name="searchType" value="member_id">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
			  
					<div id="search-name">
						<form action="${path }/admin/requestSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 회원의 이름을 입력해주세요">
							<input type="hidden" name="searchType" value="book_title">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
					<div id="search-productNo">
						<form action="${path }/admin/requestSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="상품 번호를 입력하세요.">
							<input type="hidden" name="searchType" value="r.book_code">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>    
				
				
                </div>
                    <script>
                    
                    $("#searchType").change(e=>{
                   	 const id=$("#search-id");
                   	 const name=$("#search-name");
                   	 const productNo=$("#search-productNo");
                   	id.css("display","none");
                   	name.css("display","none");
                   	productNo.css("display","none");
                   	
                   	 $("#search-"+$(e.target).val()).css("display","inline-block");
                   	 
                    });
                    $(function(){
                   	 $("#searchType").change();
                    });
                   </script>
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
                                    <th style="width: 2%;">요청상태</th>
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


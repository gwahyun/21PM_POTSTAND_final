<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<script
	src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<section>
  <div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">회원 관리</div>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">회원 목록 (총 ${count } 명)</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">아이디</th>
                                        <th style="width: 1%;">이름</th>
                                        <th style="width: 1%;">이메일</th>
                                        <th style="width: 1%;">생년월일</th>
                                        <th style="width: 3%;">주소</th>
                                        <th style="width: 1%;">성별</th>
                                        <th style="width: 1%;">핸드폰 번호</th>
                                        <th style="width: 1%;">가입일</th>
                                        <th style="width: 1%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var ="l" items="${list }" varStatus="vs" >
                                    <tr>
                                        <td>${l.memberId }</td>
                                       
                                        <td >${l.memberName }</td>
                                        <td>
                                        
                                        ${l.memberEmail }
                                        </td>
                                        <td><fmt:formatDate value="${l.memberBirth }" pattern="yyyy년 MM월 dd일"/></td>
                                        <td>
	                                        <c:forEach var="address" items="${l.address }">
	                                        	${address.postNo }
	                                        	${address.roadAddr }
	                                        	${address.oldAddr }
	                                        	${address.detailAddr }
	                                        </c:forEach>
                                        </td>
                                        <td>${l.memberGender }</td>
                                        <td>${l.memberPhone }</td>
                                        <td><fmt:formatDate value="${l.enrollDate }" pattern="yyyy년 MM월 dd일"/></td>
                                        <td><button class="update-btn"style="background-color: #FF5A5A;" onclick="memberDelete('${l.memberId}')">삭제</button></td>
                                    </tr>
                                </c:forEach>
                                  
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <script>
				function memberDelete(memberId){
					if(confirm('삭제 하시겠습니까?')){
						
						location.assign('${path}/admin/memberDelete?memberId='+memberId);
					}
			}
		</script>
                    
                    <!-- 페이지 네비게이션 자리 -->
                    <div class="pageBar flex my-5">${pageBar}</div>
                        
                    <form class="page-form" action="notice.jsp" method="post">
                        <input type="hidden" name="pageNo">
                    </form>
                </div>
                
            </div>
</section>
		
</body>
</html>


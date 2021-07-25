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
<section>
   <div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">NOTICE 관리</div>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">NOTICE 목록</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">번호</th>
                                       
                                        <th style="width: 4%;">제목</th>
                                        <th style="width: 1%;">작성자</th>
                                        <th style="width: 1%;">등록일자</th>
                                        <th style="width: 1%;">조회수</th>
                                        <th style="width: 1%;">수정</th>
                                        <th style="width: 1%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="n">
	                                    <tr>
	                                        <td>${n.noticeNo }</td>
	                                       
	                                        <td style="text-align: left;">${n.noticeTitle }</td>
	                                        <td>
	                                        
	                                        ${n.memberId }
	                                        </td>
	                                        <td><fmt:formatDate value="${n.noticeDate }" pattern="yyyy년MM월dd일"/></td>
	                                        <td>${n.noticeView }</td>
	                                        <td><a class="update-btn" href="${path }/admin/noticeUpdate?no=${n.noticeNo}">수정</a></td>
	                                        <td><a class="update-btn" style="background-color: #FF5A5A;" href="javascript:if(confirm('정말 삭제하시겠습니까?')) {location.assign('${path }/admin/noticeDelete?no='+${n.noticeNo });}">삭제</a></td>
	                                    </tr>
                                    </c:forEach>
                                  
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
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


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
                <div class="admin-content_title">EVENT 관리</div>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">EVENT 목록</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">번호</th>
                                       
                                        <th style="width: 3%">제목</th>
                                        <th style="width: 1%;">이벤트시작</th>
                                        <th style="width: 1%;">이벤트종료</th>
                                        <th style="width: 1%;">이벤트상태</th>
                                        <th style="width: 1%;">수정</th>
                                        <th style="width: 1%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="e" varStatus="vs">
                                    <tr>
                                        <td>${e.eventNo }</td>
                                        <td style="text-align: left;"><a href="${path }/event/eventpost.do?no=${e.eventNo}">${e.eventTitle }</a></td>
                                        <td><fmt:formatDate value="${e.eventStart }" pattern="yyyy년MM월dd일"/> </td>
                                        <td><fmt:formatDate value="${e.eventEnd }" pattern="yyyy년MM월dd일"/> </td>
                                        <td>
                                         <c:choose>
                                         	<c:when test="${e.endCheck == 'N'}">
                                         		진행중
                                         	</c:when>
                                         	<c:otherwise>
                                         		종료
                                         	</c:otherwise>
                                         </c:choose>
                                       
                                       <%--  <c:choose>
                                        	<c:when test="${e.endCheck == 'N'}">
                                        		<button class="ch${vs.count }" value="${e.eventNo }">진행중</button>
                                        	</c:when>
                                        	<c:otherwise>
                                        		종료
                                        	</c:otherwise>
                                        </c:choose> --%>
                                       	
                                        </td>
                                        <td><a class="update-btn" href="${path }/admin/eventUpdate?no=${e.eventNo }">수정</a></td>
                                        <td><button onclick="eventDelete(${e.eventNo})"class="update-btn" style="background-color: #FF5A5A;" >삭제</button></td>
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
	<script>
	/* $("td>button").click(e=>{
		if(confirm('종료시키겠습니까?')){
			let no = $(e.target).val();					
			$.get("${path}/admin/eventEnd?no="+no,data=>{
				if(data==1){
					$(e.target).parent().html("종료");
					$(e.target).remove();
				}
			})
		}
	}) */
	
	const eventDelete=(no)=>{
		if(confirm('삭제 하시겠습니까?')){
			location.assign('${path}/admin/eventDelete?no='+no);
			
		}
	}
	</script>
		
</body>
</html>


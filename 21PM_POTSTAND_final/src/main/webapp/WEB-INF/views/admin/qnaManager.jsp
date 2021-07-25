<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
 <div class="admin-content_area">
            <div class="admin-content ">
                <div class="admin-content_title a_bth">QnA 문의
    
                <button class="update-btn" style="background-color:gray"onclick="location.assign('${path}/admin/qnaManagerNo')">미답변</button>
                <button class="update-btn" onclick="location.assign('${path}/admin/qnaManager')">전체</button>
                
                </div>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">QnA 문의 목록</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">번호</th>
                                        <th style="width: 2%;">구분</th>
                                        <th style="width: 20%;">제목</th>
                                        <th style="width: 3%;">작성자</th>
                                        <th style="width: 3%;">등록일자</th>
                                        <th style="width: 2%;">답변여부</th>
                                        <th style="width: 2%;">답변</th>
                                        <th style="width: 2%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="q">
                                    <tr>
                                        <td>${q.qnaNo }</td>
                                        <td>${q.qnaSort }</td>
                                        <td class="overflow" style="text-align: left;">${q.qnaTitle }</td>
                                        <td>
                                        
                                        ${q.memberId }
                                        </td>
                                        <td><fmt:formatDate value="${q.qnaDate }" pattern="yyyy년MM월dd일"/></td>
                                        <td>
                                            <span class="contents-info" oninput="contentsInfo();">							
                                                <!-- 댓글 개수 0보다 클 경우 답변완료 -->
                                                                            
                                                    <span style="color: #3296FF">${q.qnaStatus }</span>
                                                                        
                                            </span>
                                        </td>
                                        <c:choose>
                                        	<c:when test="${q.qnaStatus == 'N' }">
		                                        <td><a class="update-btn" onclick="qnaManager(${q.qnaNo});" href="#">답변</a></td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td><a class="update-btn" style="background-color: blue">완료</a></td>
                                        	</c:otherwise>
                                        </c:choose>
                                        <td><button class="update-btn" onclick="deleteCheck(${q.qnaNo});" style="background-color: #FF5A5A;">삭제</></button></td>
                                    </tr>
                                    </c:forEach>
                                    
                                    
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 페이지 네비게이션 자리 -->
                    <div class="pagination">
                            <a class="on">1</a>
                    </div>
                    <form class="page-form" action="qnaReply.jsp" method="post">
                        <input type="hidden" name="pageNo">
                    </form>
                </div>
            </div>
</section>
	<script>
		function deleteCheck(no){
			alert(no);
			if(confirm('정말 삭제하시겠습니까?')){
				location.assign('${path}/admin/qnaDelete?no='+no);				
			}
		}
	
		function qnaManager(no){
			const status="width=600px,height=400px";
        	const title="duplicateId";
        	const url="${path}/admin/qnaReply?no="+no;
        	open(url,title,status);
		}
	
		
	
</script>

		
</body>
</html>


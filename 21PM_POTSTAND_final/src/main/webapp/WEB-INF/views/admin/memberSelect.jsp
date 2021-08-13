<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
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
	                    <div class="admin-content_title">회원 목록 (총 ${count } 명)
	                   <select id="searchType">
							<option value="id" >아이디</option>
							<option value="name">회원 이름</option>
							<option value="birth">생년 월일</option>
						</select>
					<div id="search-id">
						<form action="${path }/admin/memberSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 아이디를 입력해주세요">
							<input type="hidden" name="searchType" value="member_id">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
			  
					<div id="search-name">
						<form action="${path }/admin/memberSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 회원의 이름을 입력해주세요">
							<input type="hidden" name="searchType" value="member_name">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
					<div id="search-birth">
						<form action="${path }/admin/memberSelect" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="yy/MM/dd로 입력하세요">
							<input type="hidden" name="searchType" value="member_birth">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>    
				
				
                </div>
                    <script>
                    
                    $("#searchType").change(e=>{
                   	 const id=$("#search-id");
                   	 const name=$("#search-name");
                   	 const birth=$("#search-birth");
                   	id.css("display","none");
                   	name.css("display","none");
                   	birth.css("display","none");
                   	
                   	 $("#search-"+$(e.target).val()).css("display","inline-block");
                   	 
                    });
                    $(function(){
                   	 $("#searchType").change();
                    });
                   </script>
                    
                    
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">아이디</th>
                                        <th style="width: 1%;">이름</th>
                                        <th style="width: 1%;">이메일</th>
                                        <th style="width: 3%;">생년월일</th>
                                        <th>주소</th>
                                        <th style="width: 1%;">성별</th>
                                        <th style="width: 1%;">핸드폰 번호</th>
                                        <th style="width: 3%;">가입일</th>
                                        <th style="width: 1%;">삭제</th>
                                        <th style="width: 1%;">회원</th>
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
	                                        <c:forEach var="address" items="${l.addresses }">
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
                                        <td>
                                        <button class="update-btn" style="background-color:gray" onclick="memberSortUpdate(event,'${l.memberId}')">
                                        <c:choose>
                                        	<c:when test="${l.memberSort =='Y'}">
                                        		관리자	
                                        	</c:when>
                                        	<c:otherwise>
                                        		일반회원
                                        	</c:otherwise>
                                        </c:choose>
                                        </button>
                                        </td>
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
				function memberSortUpdate(e,memberId){
					var sort = $(e.target).text();
					if(sort.indexOf('관리자')==-1){
						if(confirm('관리자로 변경하시겠습니까?')){
							$.get("${path}/admin/memberSortUpdate?memberId="+memberId+"&memberSort=Y",data=>{
								if(data){
									alert("관리자 모드로 변경되었습니다.");
									$(e.target).html("관리자");
								}else{
									alert("실패!");
								}
							})
						}
					}else{
						if(confirm('일반회원으로 변경하시겠습니까?')){
							$.get("${path}/admin/memberSortUpdate?memberId="+memberId+"&memberSort=N",data=>{
								if(data){
									alert("일반회원 모드로 변경되었습니다.");
									$(e.target).html("일반회원");
								}else{
									alert("실패!");
								}
							})
						}
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


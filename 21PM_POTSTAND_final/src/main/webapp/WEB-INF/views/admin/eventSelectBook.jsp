<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
 <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>     
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<section>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/adminStyle.css"/>
                        <div class="admin-content_area">
                      			  <button id="parentSubmit" class="submit-btn" style="background: grey">보내기</button>
						</div>
                        
	                    <div class="admin-content_title">상품 목록 (총 ${count } 권)
		                   <select id="searchType">
								<option value="no" >상품번호</option>
								<option value="name">제목</option>
								<option value="writer">저자</option>
								<option value="price">가격</option>
							</select>
					
					<div id="search-no">
						<form action="${path }/admin/eventSelectBook" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 책의 번호를 입력해주세요">
							<input type="hidden" name="searchType" value="book_code">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
			  
					<div id="search-name">
						<form action="${path }/admin/eventSelectBook" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 책의 제목을 입력해주세요">
							<input type="hidden" name="searchType" value="book_title">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
					
						<div id="search-writer">
						<form action="${path }/admin/eventSelectBook" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 책의 저자를 입력해주세요">
							<input type="hidden" name="searchType" value="book_writer">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>
					<div id="search-price">
						<form action="${path }/admin/eventSelectBook" method="post">
							<input type="text" name="searchKeyword" size="40" placeholder="검색할 가격을 입력해주세요">
							<input type="hidden" name="searchType" value="book_cost">
							<button class="update-btn" type="submit">조회</button>
						</form>
					</div>    
				 <script>
                    
                    $("#searchType").change(e=>{
                   	 const no=$("#search-no");
                   	 const name=$("#search-name");
                   	 const writer=$("#search-writer");
                   	 const price=$("#search-price");
                   	no.css("display","none");
                   	name.css("display","none");
                   	writer.css("display","none");
                   	price.css("display","none");
                   	
                   	 $("#search-"+$(e.target).val()).css("display","inline-block");
                   	 
                    });
                    $(function(){
                   	 $("#searchType").change();
                    });
                   </script>
				
                </div>
                    <c:if test="${list.size() >= 1}">
          			
	                    <table >
							<thead>
								<tr  style="border: 3px solic black">
									<th style="width: 5%">전체 체크<input class="checkAll" type="checkbox"></th>
									<th style="width: 5%;">번호</th>
									<th style="width: 10%;">제목</th>
									<th style="width: 10%;">카테고리</th>
									<th style="width: 5%;">저자</th>
									<th style="width: 7%;">출판사</th>
									<th style="width: 5%;">정가</th>
									<th style="width: 5%;">출판일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="l">
								<tr>
									<td style="text-align: center;"><input class="check-item" type="checkbox" value="${l.bookCode }"></td>
									<td style="	text-align: center;"><fmt:formatNumber value="${l.bookCode }" ></fmt:formatNumber></td>
									<td>${l.bookTitle }</td>
									<td>
											${l.sort.lv1 }
										<c:if test="${l.sort.lv2 != null}">
											>${l.sort.lv2 }
										</c:if>
										<c:if test="${l.sort.lv3 != null}">
												>${l.sort.lv3 }
										</c:if>
										<c:if test="${l.sort.lv4 != null}">
											>${l.sort.lv4 }
										</c:if>
									</td>
									<td>${l.bookWriter }</td>
									<td>${l.bookPub }</td>
									<td style="	text-align: center;">${l.bookCost }</td>
									<td style="	text-align: center;"><fmt:formatDate value="${l.bookDate }" pattern="yyyy년MM월dd일"/></td>
									
									
								</tr>
							</c:forEach>
							</tbody>
						</table>
                    </c:if>
                    <c:if test="${list.size() == 0}">
	                    <span class="no_Data">데이터가 없습니다</span>
                    </c:if>
                     <div class="pageBar flex my-5">${pageBar}</div>
                    
</section>
		<script>
		$(".checkAll").click(function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		})
		
		$("#parentSubmit").click(function(){
			if($('input[class=check-item]').is(":checked")==false){
				alert("한개라도 입력하시든가");
				return false;
			}
			let B=[];
			for(var i=0; i<$('input[class=check-item]').length; i++){
			    			//console.log(i);
			    			if($('input[class=check-item]').eq(i).is(":checked")==true){
			    				B.push($('input[class=check-item]').eq(i).val());
			    			}   			
			    		}
			$("#parentEleId", parent.opener.document).text(B);
			$("#parentValue", parent.opener.document).val(B);
			window.close();
		});			
		</script>
</body>
</html>


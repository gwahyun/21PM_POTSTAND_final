<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
 <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>     
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<section>
                        상품목록
                        <br>
                        <button id="parentSubmit" class="update-btn" style="background: blue">보내기</button>
                    <c:if test="${list.size() >= 1}">
          			
	                    <table >
							<thead>
								<tr  style="border: 3px solic black">
									<th style="width: 5%">전체 체크<input class="checkAll" type="checkbox"></th>
									<th style="width: 5%;">번호</th>
									<th style="width: 10%;">제목</th>
									<th style="width: 5%;">카테고리</th>
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
									<td>카테고리 넣을것</td>
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


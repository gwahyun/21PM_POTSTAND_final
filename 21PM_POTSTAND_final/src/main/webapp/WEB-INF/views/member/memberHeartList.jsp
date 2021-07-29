<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	<section class="body-font">
    	<div class="container mx-auto flex justify-start">
        	<div class="w-1/4 h-full py-8">
	            <h3 class="text-4xl font-extrabold">마이페이지</h3>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>개인</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/notice/noticeSelectList.do">고객센터</a></li>
			                <li class="py-2"><a href="${path}/member/memberCheckPwd.do">정보변경</a></li>
			                <li class="py-2"><a href="#">장바구니</a></li>
			                <li class="py-2"><a href="${path}/member/memberHeartList.do?memberId=${loginMember.memberId}">찜 목록</a></li>
			                <li class="py-2"><a href="#">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>구매/혜택</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="#">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="#">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do?memberId=${loginMember.memberId}">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">찜 목록</h3>
        		</div>
        		<div class="flex w-full flex-col justify-center mt-5 border" >
        			<div class="flex">
        				<div class="w-3/12 h-11 pl-3 p-2 bg-red-100 flex">
        					<label class="text-lg"><input type="checkbox" class="w-10" id="selectAll"/>전체 선택</label>
	        			</div>
	        			<div class="w-5/12 h-11 p-2 bg-red-100 flex justify-center">
	        			</div>
	        			<div class="w-4/12 h-11 p-2 bg-red-100 flex justify-end">
	        				<div class="pr-2">
		        				<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
		        				focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
		        				transition ease-in duration-300 w-48 h-full" type="button"
		        				onclick="fn_heartList_choiceCartInsert();">
		        					선택 장바구니에 담기
		        				</button>
	        				</div>
	        				<div>
		        				<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
			        			focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
			        			transition ease-in duration-300 w-24 h-full" type="button"
			        			onclick="fn_heartList_choiceHeartDelete();">
			        				선택 삭제
			        			</button>
		        			</div>
	        			</div>
        			</div>
        			<form action="" method="post">
        			<c:forEach var="h" items="${list }">
	        			<div class="flex">
	        				<div class="w-3/12 border-t-2 h-52 p-2 flex">
	        					<div class="p-1 flex flex-col justify-center">
	        						<input type="hidden" value="${loginMember.memberId }"/>
        							<input type="checkbox" class="w-10" name="bookCode" value="${h.book.bookCode}"/>
	        					</div>
	        					<div class="w-full flex flex-col justify-center">
	        						<c:if test="${h.book.bookCover == null}">
	        							<img src="${path}/resources/img/noImg.jpg" alt="" class="w-40 h-48">
	        						</c:if>
	        						<c:if test="${h.book.bookCover != null}">
	        							<img src="${h.book.bookCover }" alt="" class="w-40 h-48">
	        						</c:if>
	        					</div>      					
		        			</div>
		        			<div class="w-5/12 border-t-2 h-52 p-2 flex-col content-between">
		        				<div class="h-1/3">
		        					<h3 class="text-2xl font-bold pb-4 pt-4">${h.book.bookTitle }</h3>
		        					<h4 class="text-xl font-semibold">${h.book.bookWriter }</h4>
		        				</div>
		        				<div class="h-2/3 flex items-end pb-8">
		        					<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
				        			focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
				        			transition ease-in duration-300 w-36 h-8" type="button"
				        			onclick="fn_heartList_cartInsert(event);">
				        				장바구니에 담기
				        			</button>
				        			<button class="border bg-red-500 text-gray-100 rounded-full tracking-wide font-semibold 
				        			focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
				        			transition ease-in duration-300 w-20 h-8" type="button"
				        			onclick="fn_heartList_cartDelete(event);">삭제</button>
		        				</div>		
		        			</div>
		        			<div class="w-4/12 border-t-2 h-52 p-2 flex flex-col justify-center text-right pr-8">
		        				<h3 class="text-2xl"><fmt:formatNumber value="${h.book.bookCost }" type="currency"/></h3>
		        			</div>
	        			</div>
        			</c:forEach>  
        			</form>
        		</div>
        		<div class="pageBar flex my-5">${pageBar}</div>
			</div>
		</div>
    </section>
    <script>
    	//전체 선택/해제
    	$("#selectAll").click(e=>{
    		if($(e.target).is(":checked")==true){
    			$("input:checkbox").prop("checked", true);
    		}else{
    			$("input:checkbox").prop("checked", false);
    		}
    	});
    	
    	  	
    	//선택 장바구니에 담기
    	function fn_heartList_choiceCartInsert(){
    		//체크박스가 하나라도 체크되어있는지 확인
    		checkList=document.getElementsByName("bookCode");
    		flag=false;
    		for(var i=0; i<checkList.length; i++){
    			if(checkList[i].checked){
    				flag=true;
    			}
    		} 
    		if(!flag){ //이동할 책이 없는 경우
    			alert('이동할 책을 선택하세요.');
    		}else{
    			//선택 찜 담을 배열
            	let bookCodeArray=[];
        		
        		for(var i=0; i<$('input[name=bookCode]').length; i++){
        			if($('input[name=bookCode]').eq(i).is(":checked")==true){
        				bookCodeArray.push($('input[name=bookCode]').eq(i).val());
        			}    			
        		}
        		
        		var objParams = {
        				"memberId" : '${loginMember.memberId}', //회원 아이디
        				"bookCodeList" : bookCodeArray //체크된 북코드
        		};
        		
        		$.ajax({
        			type:"post",
    				url:"${path}/member/memberChoiceCartInsert.do",
    				dataType:"json",
    				data:objParams,
    				success:data=>{
    					if(data==1){
    						alert('장바구니로 이동하였습니다.');
    						location.reload();
    					}else{
    						alert('장바구니로 이동하지 못했습니다. 관리자에게 문의하세요.');
    					}
    				}
    			}); 
    		}		
    	}
    	
    	//선택 장바구니에서 삭제
    	function fn_heartList_choiceHeartDelete(){
    		//체크박스가 하나라도 체크되어있는지 확인
    		checkList=document.getElementsByName("bookCode");
    		checkCount=0;
    		flag=false;
    		for(var i=0; i<checkList.length; i++){
    			if(checkList[i].checked){
    				flag=true;
    				checkCount+=1;
    			}
    		} 
    			
    		if(!flag){ //삭제할 책이 없는 경우
    			alert('삭제할 책을 선택하세요.');
    		}else{
    			//선택 찜 담을 배열
    			if(confirm('선택한 책 '+checkCount+'권을 삭제하시겠습니까?')){
    				let bookCodeArray=[];
            		
    				for(var i=0; i<$('input[name=bookCode]').length; i++){
            			if($('input[name=bookCode]').eq(i).is(":checked")==true){
            				bookCodeArray.push($('input[name=bookCode]').eq(i).val());
            			}    			
            		}
            		
            		var objParams = {
            				"memberId" : '${loginMember.memberId}', //회원 아이디
            				"bookCodeList" : bookCodeArray //체크된 북코드
            		};
            		
            		$.ajax({
            			type:"post",
        				url:"${path}/member/memberChoiceHeartDelete.do",
        				dataType:"json",
        				data:objParams,
        				success:data=>{
        					if(data==1){
        						alert('찜목록에서 삭제되었습니다.');
        						location.reload();
        					}else{
        						alert('찜목록에서 삭제하지 못했습니다. 관리자에게 문의하세요.');
        					}
        				}
        			}); 
        		}
    		}		
    	}
    	
    	//장바구니에 담기
    	function fn_heartList_cartInsert(e){
    		$.ajax({
    			type:"post",
				url:"${path}/member/memberCartInsert.do",
				dataType:"json",
				data:{
					"memberId":'${loginMember.memberId}',
					"bookCode":$(e.target).parent().parent().prev().children().children().eq(1).val()
				},
				success:data=>{
					if(data==1){
						alert('장바구니로 이동하였습니다.');
						location.reload();
					}else{
						alert('장바구니로 이동하지 못했습니다. 관리자에게 문의하세요.');
					}
				}
			});
    	}
    	
    	//찜목록 삭제
    	function fn_heartList_cartDelete(e){
    		if(confirm('선택한 책을 삭제하시겠습니까?')){
    			$.ajax({
        			type:"post",
    				url:"${path}/member/memberHeartDelete.do",
    				dataType:"json",
    				data:{
    					"memberId":'${loginMember.memberId}',
    					"bookCode":$(e.target).parent().parent().prev().children().children().eq(1).val()
    				},
    				success:data=>{
    					if(data==1){
    						alert('찜목록에서 삭제되었습니다.');
    						location.reload();
    					}else{
    						alert('찜목록에서 삭제하지 못했습니다. 관리자에게 문의하세요.');
    					}
    				}
    			});
    		}
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
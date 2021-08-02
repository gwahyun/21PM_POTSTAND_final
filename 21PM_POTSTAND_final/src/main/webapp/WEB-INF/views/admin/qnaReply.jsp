<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>
<%-- <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/> --%>
</head>
<body>
	<section class="mx-80">
	<div class="myqna-container">
	            <div class="myqna-title flex mt-10 pb-2 border-solid border-b border-gray-300 items-baseline">
	               <h1 class="text-2xl w-6/12 ">제목 : 아 처리훼댈뤠궤~~~~~~50</h1>
	               <h3 class="text-base w-2/12 ">분류 : ${q.qnaSort }</h3>
	               <h3 class="text-base w-2/12 ">작성자 : ${q.memberId }</h3>
	               <h3 class="text-base w-2/12 ">등록날짜 : <fmt:formatDate value="${q.qnaDate }" pattern="yyyy년MM월dd일"/></h3>
	            </div>
	            <div class="myqna-content border-solid border-b  border-gray-300 my-5 h-2/5">
	                <div id="viewer" ></div>
	            </div>
	        </div>
	        
	        </section>
	<%-- <table>
		<tr>
			<td>제목</td>
			<td>${q.qnaTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${q.memberId }</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><fmt:formatDate value="${q.qnaDate }" pattern="yyyy년MM월dd일"/></td>
		</tr>
	</table> --%>
	
	 <!-- onsubmit="fn_btn();" -->
		<input type="hidden" name="qnaNo" value="${q.qnaNo }">
		<textarea style="margin-top : 30px;" rows="10" cols="40" name="answerContent" required=""></textarea>
		<!-- <input type="text" name="answerContent" placeholder="답변하기" width="400px" required> -->
		<input type="button" value="답변" onclick="fn_reply();">
	<button onclick="fn_btn();">종료</button>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		function fn_reply(){
			const qnaNo = $("input[type=hidden]").val();
			const answerContent = $("textarea").val();
		    if(answerContent.trim().length==0){
		    	alert("내용을 입력해 주세요");
		    	return false;
		    }else{
		    	$.get("${path}/admin/qnaAnswer?answerContent="+answerContent+"&qnaNo=${q.qnaNo}",data=>{
		    	/* 	if(data=='true'){
		    			alert("성공");
		    			opener.location.assign("${path}/admin/qnaManager");
		    			window.close();
		    		}else{
		    			alert("실패");
		    			opener.location.assign("${path}/admin/qnaManager");
		    			window.close();
		    		} */
		    	})
		    	alert("답변이 완료 되었습니다!");
		    	opener.location.assign("${path}/admin/qnaManager");
    			window.close();
		    }
		}
	
		function fn_btn(){
			opener.location.assign("${path}/admin/qnaManager");
			window.close();
		}
	      const viewer = toastui.Editor.factory({
	        el: document.querySelector("#viewer"),
	        viewer: true,
	        height: "500px",
	      });
	        viewer.setMarkdown('${q.qnaContent }');

	</script>
</body>
</html>
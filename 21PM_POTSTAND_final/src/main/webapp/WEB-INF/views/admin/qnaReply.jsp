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
</head>
<body>
	<table>
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
	</table>
	<div id="viewer"></div>
	 <!-- onsubmit="fn_btn();" -->
		<input type="hidden" name="qnaNo" value="${q.qnaNo }">
		<textarea rows="10" cols="40" name="answerContent" required=""></textarea>
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
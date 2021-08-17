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
 <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>

</head>
<body>
	<section style="margin-left: 12rem;
    margin-right: 12rem;">
	<div class="myqna-container">
	            <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
	               <h3 class="text-gray-900 text-3xl title-font font-medium mb-1 ">제목 : ${q.qnaTitle }</h3>
	               <h3 class="text-sm title-font text-gray-500 tracking-widest ">분류 : ${q.qnaSort }</h3>
	               <h3 class="text-sm title-font text-gray-500 tracking-widest">작성자 : ${q.memberId }</h3>
	               <h3 class="text-sm title-font text-gray-500 tracking-widest ">등록날짜 : <fmt:formatDate value="${q.qnaDate }" pattern="yyyy년MM월dd일"/></h3>
	            </div>
	            <div class="myqna-content border-solid border-b  border-gray-300 my-5 h-2/5" style="display: flex;
    justify-content: center;">
	                <div id="viewer" ></div>
	            </div>
	        </div>
	        
	        </section>
	 <!-- onsubmit="fn_btn();" -->
		<input type="hidden" name="answerNo" value="${a.answerNo }">
		<div style="display:  grid;
    justify-content: center;" >
		관리자 : <input type="text" value="${a.adminId }"readonly="readonly"><br>
		<textarea class="border-4 rounded-lg focus:outline-none" rows="10" cols="100%" name="answerContent" required="">${a.answerContent }</textarea>
		<br>
		<input class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
                    tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
                    cursor-pointer transition ease-in duration-300" type="button" value="수정" onclick="fn_reply();">
                    <br>
		<button class="w-full flex justify-center bg-red-500 text-gray-100 p-4 rounded-full 
                    tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
                    cursor-pointer transition ease-in duration-300" onclick="fn_btn();">종료</button>
	</div>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		function fn_reply(){
			const answerNo = $("input[type=hidden]").val();
			const answerContent = $("textarea").val();
		    if(answerContent.trim().length==0){
		    	alert("내용을 입력해 주세요");
		    	return false;
		    }else{
		    	if('${a.adminId}'!='${loginMember.memberId}'){
		    		alert("수정 관리자가 아닙니다");
		    		return false;
		    	}else{
			    	$.get("${path}/admin/qnaReplyUpdateEnd?answerContent="+answerContent+"&answerNo=${a.answerNo}",data=>{
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
			    	alert("답변이 수정 되었습니다!");
			    	opener.location.assign("${path}/admin/qnaManager");
	    			window.close();
		    		
		    	}
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
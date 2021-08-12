<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
/* 노말라이징 */
body, ul, li {
    margin:0;
    padding:0;
    list-style:none;
}

/* 라이브러리 */
.con {
    max-width:1000px;
    margin:0 auto;
}

/* 커스텀 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

body {
    font-family: 'Noto Sans KR', sans-serif;
    overflow-y:hidden;
}

body, html {
    height:100%;
}

#chat-room {
    height:100%;
    background-color:#6884b3;
    /* 임시 */
    outline:2px solid black;
    position:relative;
}

#chat-room .message-box {
    overflow-y:scroll;
    height:calc(100% - 4.4rem);
}

#chat-room .message-group::before {
    content:attr(data-date-str);
    display:block;
    background-color:rgba(0,0,0,0.15);
    border-radius:1rem;
    text-align:center;
    padding:0.3rem 0;
    color:white;
    font-size:1.6rem;
}

#chat-room .chat-message {
    margin-left:3rem;
    position:relative;
    padding-bottom: 15px;
}

#chat-room .chat-message > section {
    position:absolute;
    top:0;
    left:-3rem;
}

#chat-room .chat-message > span {
    display:block;
}

#chat-room .chat-message > section {
    font-size:3rem;
}

#chat-room .chat-message::after {
    content:"";
    display:block;
    clear:both;
}

#chat-room .chat-message > div {
    background-color:white;
    float:left;
    padding:0.8rem;
    border-radius:1rem;
    clear:both;
    font-weight:bold;
    font-size:1.46rem;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > div {
    background-color:#FDF01B;
    float:right;
    box-shadow: -1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > span {
    display:none;
}

#chat-room .chat-message.mine > section {
    display:none;
}

#chat-room .input-box {
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
}

#chat-room .input-box #text-input {
    width:100%;
    display:block;
    border:0;
    outline:none;
    padding-right:8.5rem;
    padding-left:4.8rem;
    padding-top:0.1rem;
    font-size:1.4rem;
    line-height:4rem;
    font-weight:bold;
    box-sizing:border-box;
}

#chat-room .input-box .btn-plus {
    position:absolute;
    top:0;
    left:0;
    width:4rem;
    height:100%;
    background-color:#D1D1D1;
}

#chat-room .input-box .btn-plus > i {
    position:absolute;
    top:50%;
    left:50%;
    transform:translateX(-50%) translateY(-45%);
    color:white;
    font-size:3rem;
}

#chat-room .input-box .btn-submit {
    position:absolute;
    right:1rem;
    top:50%;
    transform:translateY(-50%);
    padding:10px;
    background-color:#fdf01b;
    padding:10px;
    color:#bfb73d;
    border-radius:3px;
    font-size:1.3rem;
    box-shadow:0 1px 10px rgba(0,0,0,0.2);
    user-select:none;
}

#chat-room .input-box .btn-emo {
    position:absolute;
    right:6rem;
    top:50%;
    transform:translateY(-50%);
    font-size:2rem;
    color:#CBCBCB;
    user-select:none;
}
.listFeq {
	width: 100%;
    color: black;
	background-color:rgba(0, 0, 0, 0.2);
    justify-content: center;
    text-align:center;
    align-content:center;
    position: absolute;
    bottom: 67px;
     overflow-y:scroll;
    height:200px;
	
}
.listFeq ul li{
	padding-top:10px;
	padding-bottom:10px;
}
.listFeq ul li:hover{
	background-color:white;
	transition:2s;
}
</style>
		<section>
<!-- 모바일에서 디바이스의 해상도가 아닌 디바이스의 실제 크기를 기준으로 너비/높이를 잡는다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<h1 style="display:none;">완료 요구사항 : 메세지 박스의 스크롤바는 입력박스 바로 위까지만 위치해야 합니다.</h1>
<h1 style="display:none;">다음 요구사항 : 스크롤바를 디자인 해주세요.</h1>
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<c:set var="now" value="<%=new java.util.Date()%>" />
<div id="chat-room">
    <div class="message-box">
        <div class="message-group" data-date-str="2021년 08월 11일 수요일">
            <div class="chat-message other">
                <section><i class="fa fa-user"></i></section>
                <span>관리자</span>
                <div>반갑습니다 FAQ 공간입니다</div>
            </div>
             <div class="chat-message mine">
                <section><i class="fa fa-user"></i></section>
                <div>네 하이</div>
            </div>
            
        </div>
        
        <div class="message-group" data-date-str='<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일 E요일"  />'>
        	<div id="secondMessage" class="allMessage">
	            <div class="chat-message other">
	                <section><i class="fa fa-user"></i></section>
	                <span>관리자</span>
	                <div>질문하세요</div>
	            </div>
	            
	            <div class="chat-message mine">
	                <section><i class="fa fa-user"></i></section>
	                <div>ㅎㅇ</div>
	            </div>
            </div>
        </div>
        
        
        <div id ="open" class="listFeq">
        <button onclick="closeORopen();">최소화</button>
        	<ul>
        		<c:forEach items="${list }" var="v">
        		<li style="cursor:pointer;"  onclick="inputReply('${v.faqContent }','${v.faqTitle }')">${v.faqTitle }</li>
        		</c:forEach>
        	</ul>
        </div>
        <div id="close" class="listFeq" style="display: none">
        	<ul>
        		<li><button onclick="closeORopen();">더보기</button></li>
        	</ul>
        
        </div>
    </div>
    <div class="input-box">
        <input type="text" id="text-input">
        <div class="btn-plus">
            <i class="fa fa-plus" aria-hidden="true"></i>
        </div>
        <div class="btn-emo">
            <i class="fa fa-smile-o" aria-hidden="true"></i>
        </div>
        <div class="btn-submit">
            <span style="cursor:pointer; " onclick="memberReplyInput();">
            	전송
            </span>
        </div>
    </div>
</div>
		</section>
		<script>
			var flag = new Boolean(true);
			const closeORopen=()=>{
				if(flag){
					$("#open").attr("style","display:none");
					$("#close").attr("style","display:block; height:35px");
					flag = false;
				}else{
					$("#open").attr("style","display:block");
					$("#close").attr("style","display:none");
					flag = true;
				}
			}
			
			function inputReply(content,title){
						var div = $("#secondMessage").clone(false);		
						var manager = div.children("div:first");
						var member = div.children("div:first+div");
						manager.find("div").html(content);
						member.find("div").html(title);
						$("#secondMessage").append(member).append(manager);
						
			}
			function memberReplyInput(){
				var val = $("input").val();
				var div = $("#secondMessage").clone(false);
				var manager = div.children("div:first");
				var member = div.children("div:first+div");
				manager.find("div").html("네 알겠습니다");
				member.find("div").html(val);
				$("#secondMessage").append(member).append(manager);
				$("input").val("");
			}
			   $("input").on("keyup",function(key){
			        if(key.keyCode==13) {
			        	var val = $("input").val();
						var div = $("#secondMessage").clone(false);
						var manager = div.children("div:first");
						var member = div.children("div:first+div");
						manager.find("div").html("네 알겠습니다");
						member.find("div").html(val);
						$("#secondMessage").append(member).append(manager);
						$("input").val("");
			        }
			    });


		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

		
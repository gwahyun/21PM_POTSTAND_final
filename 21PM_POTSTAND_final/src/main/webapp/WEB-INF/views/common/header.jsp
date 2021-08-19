<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PotStand</title>
    <link rel="shortcut icon" href="${path}/resources/img/favicon-32x32.png" type="image/x-icon">
	<link rel="icon" href="${path}/resources/img/favicon-32x32.png" type="image/x-icon">
    <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body class="max-w-full min-h-full">
    <header class="text-gray-600 body-font flex justify-center ">
		<div class="container w-full flex flex-wrap justify-between  p-5 flex-col md:flex-row items-center bg-white fixed z-10 top-4 rounded-full">
			<div class="flex">
          		<a href="${path}" class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
	           	<img src="${pageContext.request.contextPath}/resources/img/potstand_logo.svg" alt="" class="fill-current 
	           	text-red-500 w-12"/>
				<span class="ml-3 text-xl">POTSTAND</span>
          		</a>
          		<!-- 헤더 검색기능 -->
	          	<form action="${path}/search/bookinfo.do">
					<div class="flex justify-center mt-2 mr-4 ml-4">
	              		<div class="relative flex w-full flex-wrap items-stretch mb-3">
                			<input type="text" name="search" placeholder="제목, 저자, 출판사 검색" class=" form-input px-3 py-2 
                			placeholder-gray-400 text-gray-700 relative bg-white rounded-lg text-sm shadow outline-none
                			focus:outline-none focus:shadow-outline w-full pr-10"/>
                			<input type="hidden" name="all" value="all"/>
                			<span class="z-10 h-full leading-snug font-normal text-center text-gray-400 absolute 
                			bg-transparent rounded text-base items-center justify-center w-8 right-0 pr-3 py-3">
	                  			<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 -mt-1" fill="none" viewBox="0 0 24 24" 
	                  			stroke="currentColor">
		                    		<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 
		                    		7 0 11-14 0 7 7 0 0114 0z"/>
	                    		</svg>
                			</span>
              			</div>
            		</div>
          		</form>
        	</div>
			<div>
		<!-- 비회원 접속 -->
				<c:if test="${loginMember==null}">
	          		<button class=" inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${path}/member/memberLogin.do');">
	            		로그인
	            		<svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
	            		class="w-4 h-4 ml-1" viewBox="0 0 24 24">
	              			<path d="M5 12h14M12 5l7 7-7 7"></path>
	            		</svg>
	          		</button>
	          		<button class=" inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${path}/member/memberEnroll.do');">
	            		회원가입
	            		<svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
	            		class="w-4 h-4 ml-1" viewBox="0 0 24 24">
	              			<path d="M5 12h14M12 5l7 7-7 7"></path>
	            		</svg>
	          		</button>
          		</c:if>
          		<!-- 회원 로그인 -->
      <c:if test="${loginMember!=null&&loginMember.memberSort.equals('N')}">
         <div class="flex content-center">
         <!-- 알림 -->
         <c:if test="${messageCount!=0}">
          	<div class="inline relative mr-6 w-6 h-6 text-center">
          		<span class="animate-bounce absolute h-4 w-4 rounded text-xs font-bold text-white bg-red-700 opacity-70 -top-2 -right-2 z-10"><c:out value="${messageCount}"/></span>
          		<svg class="modal-open inline-flex relative w-7 h-7 animate-bounce cursor-pointer text-red-400" viewBox="-21 0 512 512" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
	          		<path d="m448 232.148438c-11.777344 0-21.332031-9.554688-21.332031-21.332032 0-59.839844-23.296875-116.074218-65.601563-158.402344-8.339844-8.339843-8.339844-21.820312 0-30.164062 8.339844-8.339844 21.824219-8.339844 30.164063 0 50.371093 50.367188 78.101562 117.335938 78.101562 188.566406 0 11.777344-9.554687 21.332032-21.332031 21.332032zm0 0"/>
	          		<path d="m21.332031 232.148438c-11.773437 0-21.332031-9.554688-21.332031-21.332032 0-71.230468 27.734375-138.199218 78.101562-188.566406 8.339844-8.339844 21.824219-8.339844 30.164063 0 8.34375 8.34375 8.34375 21.824219 0 30.164062-42.304687 42.304688-65.597656 98.5625-65.597656 158.402344 0 11.777344-9.558594 21.332032-21.335938 21.332032zm0 0"/>
	          		<path d="m434.753906 360.8125c-32.257812-27.265625-50.753906-67.117188-50.753906-109.335938v-59.476562c0-75.070312-55.765625-137.214844-128-147.625v-23.042969c0-11.796875-9.558594-21.332031-21.332031-21.332031-11.777344 0-21.335938 9.535156-21.335938 21.332031v23.042969c-72.253906 10.410156-128 72.554688-128 147.625v59.476562c0 42.21875-18.496093 82.070313-50.941406 109.503907-8.300781 7.105469-13.058594 17.429687-13.058594 28.351562 0 20.589844 16.746094 37.335938 37.335938 37.335938h352c20.585937 0 37.332031-16.746094 37.332031-37.335938 0-10.921875-4.757812-21.246093-13.246094-28.519531zm0 0"/>
	          		<path d="m234.667969 512c38.632812 0 70.953125-27.542969 78.378906-64h-156.757813c7.421876 36.457031 39.742188 64 78.378907 64zm0 0"/>
          		</svg>
          	</div>
          </c:if>
          	
          <div>
            <span class="text-red-500 font-bold"><c:out value="${loginMember.memberName}"></c:out></span> 회원님 어서오세요
          </div>
          <div class="relative">
            <!-- Dropdown toggle button -->
            <button
              id="member-menu"
              class="
                relative
                z-10
                block
                p-2
                bg-white
                rounded-md
                dark:bg-gray-800
                focus:outline-none
              "
            >
              <svg
                class="w-5 h-5 text-gray-800 dark:text-white"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>

            <!-- Dropdown menu -->
            <div
              id="member-menu-content"
              class="
                absolute
                right-0
                z-20
                w-48
                py-2
                mt-2
                bg-white
                rounded-md
                shadow-xl
                dark:bg-gray-800
                hidden
              "
            >
              <a
                href="${path }/member/memberMypage.do"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                마이페이지
              </a>
              <a
                href="${path}/member/cartList.do"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                장바구니
              </a>
              <a
                href="${path}/member/memberHeartList.do"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                찜목록
              </a>
              <a
                href="${path}/member/memberLogout.do"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                로그아웃
              </a>
            </div>
          </div>
        </div>
      </div>
     </c:if>
     <!-- 관리자 로그인 -->
     <c:if test="${loginMember!=null&&loginMember.memberSort.equals('Y')}">
         <div class="flex content-center">
          <div>
            <span class="text-red-500 font-bold"><c:out value="${loginMember.memberName}"></c:out></span> 회원님 어서오세요
          </div>
          <div class="relative">
            <!-- Dropdown toggle button -->
            <button
              id="member-menu"
              class="
                relative
                z-10
                block
                p-2
                bg-white
                rounded-md
                dark:bg-gray-800
                focus:outline-none
              "
            >
              <svg
                class="w-5 h-5 text-gray-800 dark:text-white"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>

            <!-- Dropdown menu -->
            <div
              id="member-menu-content"
              class="
                absolute
                right-0
                z-20
                w-48
                py-2
                mt-2
                bg-white
                rounded-md
                shadow-xl
                dark:bg-gray-800
                hidden
              "
            >
              <a
                href="${path}/admin/adminMain"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                관리자 페이지
              </a>
              <a
                href="${path}/dbpage"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                Temp) DB Setting
              </a>
              <a
                href="${path}/member/memberLogout.do"
                class="
                  block
                  px-4
                  py-2
                  text-sm text-gray-700
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  dark:text-gray-300
                  hover:bg-red-500
                  hover:text-white
                  dark:hover:text-white
                "
              >
                로그아웃
              </a>
            </div>
          </div>
        </div>
      </div>
    </c:if>
    </div>
   </div>
		<div class="container flex flex-start p-5 mx-auto mt-20">
	        <nav class="md:mr-auto flex w-full items-center text-base mt-5 pl-3">
	          <a href="${path}" class="mr-5 hover:text-gray-900">HOME</a>
	          <a href="${path}/book/booklist.do" class="mr-5 hover:text-gray-900">BOOK</a>
	          <a href="${path }/event/eventlist.do" class="mr-5 hover:text-gray-900">EVENT</a>
	        </nav>
      	</div>
      	
   <!-- Message 모달 -->
  <div class="modal opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-30">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-0"></div>
    
    <div class="modal-container absolute -right-5 top-16 md:w-3/12 mx-10 rounded shadow-xl z-50 overflow-y-auto">
     

      <!-- Add margin if you want to see some of the overlay behind the modal-->
      <div class="modal-content py-3 text-left px-3">
        <!--Title-->
        <div class="flex justify-between items-center px-3 pb-3 bg-red-400 text-white">
          <p class="text-2xl font-bold">Message</p>
          <div class="modal-close cursor-pointer z-50">
            <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
              <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
            </svg>
          </div>
        </div>

        <!--Body-->
        <table class="w-full border border-solid border-gray-400 bg-red-200 text-red-900">
        	<tr class="w-full border border-solid border-gray-400">
        		<th class="w-1/12 m-1 text-sm text-center border border-solid border-gray-400">NO</th>
        		<th class="w-9/12 m-1 text-sm text-center border border-solid border-gray-400">내용</th>
        	</tr>
        	<c:if test="${!empty messageList}">
	        	<!-- 반복문으로 메세지List 조회 -->
	        	<c:forEach var="a" items="${messageList}" varStatus="i">
	        		<c:if test="${i.count<=10}">
			        	<tr class="border border-solid border-gray-400">
			        		<td class="text-xs m-1 border border-solid border-gray-400 bg-white p-1">
			        			<input type="text" class="w-full focus:outline-none text-center" name="messageNo" value="${i.count}" readonly/>
			        		</td>
			        		<td class="text-xs m-1 border border-solid border-gray-400 bg-white p-1">
			        			<c:choose>
				        			<c:when test="${a.TABLE_NAME eq 'QNA'}">
				        				<input type="text" class="focus:outline-none w-full text-center" name="message" value="1:1 문의 답변이 완료되었습니다."/>
				        			</c:when>
				        			<c:otherwise>
				        				<input type="text" class="focus:outline-none w-full text-center" name="message" value="입고요청하신 상품의 입고 처리가 완료되었습니다."/>
				        			</c:otherwise>
			        			</c:choose>
			        		</td>
			        		<td class="text-xs m-1 border border-solid border-gray-400 bg-white p-1">
			        			<input type="hidden" name="messageNo" value="${a.MESSAGE_NO}">
			        			<input type="hidden" name="tableNo" value="${a.TABLE_NO}">
			        			<input type="hidden" name="tableName" value="${a.TABLE_NAME}">
			        			<button class="inline-block w-full text-xs bg-red-500 text-gray-100 rounded tracking-wide font-semibold border-solid hover:bg-red-400" onclick="message_go(event);">확인하기</button>
			        		</td>
			        	</tr>
		        	</c:if>
	        	</c:forEach>
        	</c:if>
        </table>
        
        <!--Footer-->
        <div class="flex justify-end pt-2 h-7">
          <button class="inline-block w-2/12 text-xs bg-red-500 text-gray-100 rounded tracking-wide font-semibold border-solid hover:bg-red-400" onclick="all_check();">전체 삭제</button>
        </div>
        
      </div>
    </div>
  </div>  	
	</header>
	<script>
      document.querySelector("#member-menu").addEventListener("click", (e) => {
        document.querySelector("#member-menu-content").classList.toggle("hidden");
      });
      
  	var openmodal = document.querySelectorAll('.modal-open')
    for (var i = 0; i < openmodal.length; i++) {
      openmodal[i].addEventListener('click', function(event){
    	event.preventDefault()
    	toggleModal()
      })
    }
    
    const overlay = document.querySelector('.modal-overlay')
    overlay.addEventListener('click', toggleModal)
    
    var closemodal = document.querySelectorAll('.modal-close')
    for (var i = 0; i < closemodal.length; i++) {
      closemodal[i].addEventListener('click', toggleModal)
    }
    
    document.onkeydown = function(evt) {
      evt = evt || window.event
      var isEscape = false
      if ("key" in evt) {
    	isEscape = (evt.key === "Escape" || evt.key === "Esc")
      } else {
    	isEscape = (evt.keyCode === 27)
      }
      if (isEscape && document.body.classList.contains('modal-active')) {
    	toggleModal()
      }
    };
    
    
    function toggleModal () {
      const body = document.querySelector('body')
      const modal = document.querySelector('.modal')
      modal.classList.toggle('opacity-0')
      modal.classList.toggle('pointer-events-none')
      body.classList.toggle('modal-active')
    }
     
    
    const message_go=(e)=>{
    	const messageNo = $(e.target).siblings("input[name='messageNo']").val();
    	const tableName = $(e.target).siblings("input[name='tableName']").val();
    	const tableNo = $(e.target).siblings("input[name='tableNo']").val();
    	let bookCode = 0;    	
   		$.ajax({
   			url:"${path}/ajax/updateMessage.do?messageNo="+messageNo+"&tableName="+tableName+"&tableNo="+tableNo,
   			success:function(data){
   				bookCode=data;
   	    		var newForm = $('<form></form>'); 
   	    		//set attribute (form) 
   	    		newForm.attr("name","newForm"); 
   	    		newForm.attr("method","post"); 
   	    		if(tableName=='REQUEST'){
   	    			newForm.attr("action","${path}/book/bookinfo.do?no="+bookCode);
   	    		}else{
   	    			newForm.attr("action","${path}/qna/qnaContent.do?qnaNo="+tableNo); 
   	    		}
   	    		// append form (to body) 
   	    		newForm.appendTo('body'); // submit form 
   	    		newForm.submit();
   			}
   		});
    }
    </script>
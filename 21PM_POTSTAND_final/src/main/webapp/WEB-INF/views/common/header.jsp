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
    <link href="${path}/resources/static/tailwind.css" type="text/css" rel="stylesheet"/>
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body class="max-w-full">
    <header class="text-gray-600 body-font">
		<div class="container mx-auto flex flex-wrap justify-between  p-5 flex-col md:flex-row items-center">
			<div class="flex">
          		<a href="${path}" class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
	           	<img src="${pageContext.request.contextPath}/resources/img/potstand_logo.svg" alt="" class="fill-current 
	           	text-red-500 w-12"/>
				<span class="ml-3 text-xl">POTSTAND</span>
          		</a>
	          	<form>
					<div class="flex justify-center mt-2 mr-4 ml-4">
	              		<div class="relative flex w-full flex-wrap items-stretch mb-3">
                			<input type="text" placeholder="제목, 저자, 출판사 검색" class=" form-input px-3 py-2 
                			placeholder-gray-400 text-gray-700 relative bg-white rounded-lg text-sm shadow outline-none
                			focus:outline-none focus:shadow-outline w-full pr-10"/>
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
                href="#"
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
		<div class="container flex flex-start p-5 mx-auto">
	        <nav class="md:mr-auto flex flex-wrap items-center text-base">
	          <a href="${path}" class="mr-5 hover:text-gray-900">HOME</a>
	          <a href="#" class="mr-5 hover:text-gray-900">BOOK</a>
	          <a href="${path }/event/eventlist.do" class="mr-5 hover:text-gray-900">EVENT</a>
	        </nav>
      	</div>
	</header>
	    <script>
      document.querySelector("#member-menu").addEventListener("click", () => {
        document
          .querySelector("#member-menu-content")
          .classList.toggle("hidden");
      });
    </script>
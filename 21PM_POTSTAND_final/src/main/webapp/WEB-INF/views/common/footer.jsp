<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>            
    <c:set var="path" value="${pageContext.request.contextPath }"/>
    <footer class="text-gray-600 body-font">
		<div class=" container px-5 py-5 mx-auto flex md:items-center lg:items-start md:flex-row md:flex-nowrap 
		flex-wrap flex-col justify-between">
	        <div class="w-64 flex-shrink-0 md:mx-0 mx-auto text-center md:text-left">
	           <button class=" inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${pageContext.request.contextPath}/notice/noticeSelectList.do');">
	            		고객센터
	            		<svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
	            		class="w-4 h-4 ml-1" viewBox="0 0 24 24">
	              			<path d="M5 12h14M12 5l7 7-7 7"></path>
	            		</svg>
          		</button>
          	</div>
	        <div class="md:pl-20 -mb-10 md:mt-0 mt-10 md:text-left flex justify-between">
	          	<div class="lg:w-1/4 md:w-1/2 w-full px-4 mr-10">
	            	<h2 class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3">CATEGORIES</h2>
	            </div>
	            	<nav class="list-none mb-10 flex">
		              	<li>
		                	<a href="${path}" class="text-gray-600 hover:text-gray-800 mr-5">HOME</a>
		              	</li>
		              	<li>
		                	<a href="${path}/book/booklist.do"  class="text-gray-600 hover:text-gray-800 mr-5">BOOK</a>
		              	</li>
		              	<li>
		                	<a href="${path}/event/eventlist.do" class="text-gray-600 hover:text-gray-800 mr-5">EVENT</a>
		              	</li>
		              	<li>
		                	<a href="${path}/member/memberLogin.do" class="text-gray-600 hover:text-gray-800 mr-5">SIGN IN</a>
		              	</li>
	            	</nav>
	          	</div>
			</div>
		</div>
	</div>
      	<div class="bg-gray-100 block">
        	<div class=" container w-full py-4 px-5 flex flex-wrap flex-col sm:flex-row">
          		<p class="text-gray-500 text-sm text-center sm:text-left">
            		© 2021 getJob()—
            		<a href="https://twitter.com/knyttneve" rel="noopener noreferrer" class="text-gray-600 ml-1" 
            		target="_blank">@김가현 장우영 정우석 유동현</a>
          		</p>
          		<span class=" inline-flex sm:ml-auto sm:mt-0 mt-2 justify-center sm:justify-start">
            		<a class="text-gray-500">
              			<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
              			class="w-5 h-5" viewBox="0 0 24 24">
                			<path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
              			</svg>
           			</a>
            		<a class="ml-3 text-gray-500">
              			<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
              			class="w-5 h-5" viewBox="0 0 24 24">
                			<path d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 
                			13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"></path>
              			</svg>
            		</a>
            		<a class="ml-3 text-gray-500">
              			<svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
              			class="w-5 h-5" viewBox="0 0 24 24">
                			<rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
			                <path d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"></path>
              			</svg>
            		</a>
            		<a class="ml-3 text-gray-500">
              			<svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" 
              			stroke-width="0" class="w-5 h-5" viewBox="0 0 24 24">
			                <path stroke="none" d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 
			                016-6zM2 9h4v12H2z"></path>
                			<circle cx="4" cy="4" r="2" stroke="none"></circle>
              			</svg>
            		</a>
          		</span>
        	</div>
	</footer>
</body>
</html>
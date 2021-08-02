<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
	 <section class="text-gray-600 body-font">
      <div class="container px-5 pb-24 mx-auto">
        <div class="container px-5 pb-24 mx-auto">
        <h1
        class="
          sm:text-3xl
          text-2xl
          font-medium
          title-font
          mb-2
          text-gray-900
        "
      >도서보기</h1>
       <!-- 카테고리 분류 -->
       <div class="flex">
<label class="level-1 block flex justify-center items-center">
  <span class="text-gray-700">대분류</span>
  <select id="level-1" class="form-select block mt-1 px-2 py-2">
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
</label>
<label class="level-2 block flex justify-center items-center">
  <span class="text-gray-700">대분류</span>
  <select id="level-2 "class="form-select block mt-1">
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
</label>
<label class="level-3 block flex justify-center items-center">
  <span class="text-gray-700">대분류</span>
  <select id="level-3" class="form-select block mt-1">
    <option>Option 1</option>
    <option>Option 2</option>
  </select>
</label>
</div>
        <div class="flex flex-wrap -m-4  content-center">
        <!-- 카드 시작 -->
        <c:if test="${bookList!=null}">
        	<c:forEach var="l" items="${bookList}">
          <div class="xl:1/5 md:w-1/5 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-45 rounded w-full object-contain object-center mb-6"
                src=<c:out value="${l.getBookCover()}"/>
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-sm
                  font-medium
                  title-font
                "
              >
                <c:out value="${l.getBookPub()}"/>
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font">
                <c:out value="${l.getBookTitle()}"/>
              </h2>
              <h3
                class="
                  tracking-widest
                  text-red-500 text-sm
                  font-medium
                  title-font
                  mb-4
                  truncate
                "
              >
           		<c:out value="${l.getBookWriter()}"/>
              </h3>
              <p class="leading-relaxed text-base"><c:out value="${l.getBookCost()}"/></p>
            </div>
          </div>
       	</c:forEach>
        </c:if>
       </div>
       <div class="pageBar flex my-5">${pageBar}</div>
      </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
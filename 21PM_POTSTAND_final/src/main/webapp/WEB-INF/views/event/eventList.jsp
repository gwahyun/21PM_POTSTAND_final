<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
	<section class="text-grey-600 body-font">
		<div class="container px-5 py-12 mx-auto">
			<div class="flex flex-wrap w-full mb-20">
          		<div class="lg:w-1/2 w-full mb-6 lg:mb-0">
           			 <h1
			              class="
			                sm:text-3xl
			                text-2xl
			                font-medium
			                title-font
			                mb-2
			                text-gray-900
			              "
			            >
              			진행중인 이벤트
           			 </h1>
           			<div class="h-1 w-20 bg-red-500 rounded"></div>
          		</div>
			</div>
			 <div class="flex flex-wrap -m-4">
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://www.changbi.com/wp-content/uploads/2015/07/20150724_083711.gif"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                새학기 할인!
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font">
                여름 맞이 북캉스전
              </h2>
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                  mb-4
                "
              >
                2021-07-05~2021-09-14
              </h3>
              <p class="leading-relaxed text-base">
                비룡소, 문학동네, 창비, 황금가지가 함꼐하는 여름 맞이 북캉스전
                오픈! <br />썸머북파우치도 놓치지 마세요
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/721x401"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                Colosseum Roma
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/722x402"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                Great Pyramid of Giza
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
          <div class="xl:w-1/4 md:w-1/2 p-4">
            <div class="bg-gray-100 p-6 rounded-lg">
              <img
                class="h-40 rounded w-full object-cover object-center mb-6"
                src="https://dummyimage.com/723x403"
                alt="content"
              />
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                "
              >
                SUBTITLE
              </h3>
              <h2 class="text-lg text-gray-900 font-medium title-font mb-4">
                San Francisco
              </h2>
              <p class="leading-relaxed text-base">
                Fingerstache flexitarian street art 8-bit waistcoat. Distillery
                hexagon disrupt edison bulbche.
              </p>
            </div>
          </div>
        </div>	
	</section>

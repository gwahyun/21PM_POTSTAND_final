<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path }/resources/js/naveridlogin_js_sdk_2.0.2.js"></script>
<script type="text/javascript" src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
</body>

	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
	  		{
	  			clientId: "gD_WXrEoxr1dx3pASdB4",
	  			callbackUrl: "http://localhost:8090/potstand/member/naverLoginCallback.do",
	  			isPopup: true, /* 팝업을 통한 연동처리 여부, true 면 팝업 */
	  			loginButton: {color: "green", type: 3, height: 47} /* 로그인 버튼의 타입을 지정 */
	  		}		
	  	);
	
	  	//naverLogin.init();
	  	
	  	window.addEventListener('load', function () {
	  		naverLogin.getLoginStatus(function (status) {
	  			if (status) {
	  				var name = naverLogin.user.getName();
	  				var gender = naverLogin.user.getGender();
	  				var birthday = naverLogin.user.getBirthday();
	  				var email = naverLogin.user.getEmail();
	  				var birthyear = naverLogin.user.getBirthyear();
	  				var phone = naverLogin.user.getMobile();
	  				
	  				
	  				var isRequire = true;
	  				if(name == 'undefined' || name == null || name == '') {
	  					alert('이름은 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				} else if(gender == 'undefined' || gender == null || gender == '') {
	  					alert('성별은 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				} else if(birthday == 'undefined' || birthday == null || birthday == '') {
	  					alert('생일은 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				} else if(email == 'undefined' || email == null || email == '') {
	  					alert('이메일은 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				} else if(birthyear == 'undefined' || birthyear == null || birthyear == '') {
	  					alert('생년은 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				} else if(phone == 'undefined' || phone == null || phone == '') {
	  					alert('번호는 필수 정보입니다. 정보제공을 동의해주세요.');
	  					isRequire = false;
	  				}
	  				
	  				
	  				if(isRequire == false) {
	  					naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
	  					return;	
	  				}
	  				
	  				$('#email',opener.document).val(email);
	  				$('#name',opener.document).val(name);
	  				$('#gender',opener.document).val(gender);
	  				$('#phone',opener.document).val(phone.replace(/-/g,''));
	  				$('#birthday',opener.document).val(birthyear+'-'+birthday);
	  				$('#loginForm',opener.document).submit();
	  				window.close();
	  			} else {
	  				alert('로그인 에러 : 네이버아이디를 로그아웃 후 다시 시도해주세요.');
	  				window.close();
	  			}
	  		});
	  	});
	</script>
	
</html>
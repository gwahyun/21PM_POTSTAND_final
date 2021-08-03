package com.kh.potstand.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.potstand.member.model.vo.Member;

public class MemberCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member m=(Member)request.getSession().getAttribute("loginMember");
		if(m==null) {
			request.setAttribute("msg", "로그인 후 이용가능한 서비스입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}else {
			return true;
		}
	}
}

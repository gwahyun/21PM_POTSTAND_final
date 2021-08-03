package com.kh.potstand.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.potstand.member.model.vo.Member;


public class AdminCheckLoginInterceptor extends HandlerInterceptorAdapter{@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member m = (Member)request.getSession().getAttribute("loginMember");
		if(m==null) {
			request.setAttribute("msg", "로그인 후 이용해 주세요.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}else if(!m.getMemberSort().equals("Y")){
			request.setAttribute("msg", "관리자만 접근이 가능합니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}else {
			return true;
		}
	}{
	}
}


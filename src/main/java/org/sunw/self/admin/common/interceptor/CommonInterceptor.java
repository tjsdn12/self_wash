package org.sunw.self.admin.common.interceptor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter{

	protected Log log = LogFactory.getLog(CommonInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//session객체를 가져옴
		HttpSession session =request.getSession();
		
		String requestUrl = request.getRequestURL().toString();
		//하단의 Url체크를 통해 예외처리 무한 리디렉션
		if(requestUrl.contains("/common/login/login")) {
			return true;
		}

		   //login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
	     Object obj = session.getAttribute("loginInfo");
	     if ( obj == null ){    	 
	         //로그인이 안되어 있는 경우 로그인 페이지로 돌려 보낸다
	         response.sendRedirect("/common/login/login");
	         return false;
	     }
	
	     return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(log.isInfoEnabled()) {
			//후처리기에서 컨트롤러가 끝남을 알리는 로그 출
			log.info("==============   END   ===============\n");
		}
		super.postHandle(request, response, handler, modelAndView);
	}

	
	

}

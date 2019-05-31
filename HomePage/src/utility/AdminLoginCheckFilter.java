package utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public class AdminLoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		
		if(session != null) {
			if(session.getAttribute("id")!=null && session.getAttribute("grade").equals("A")) {
				login = true;
			}
		}
		if(login) {
			chain.doFilter(request, response);
		}else {
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("/member/loginForm.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}

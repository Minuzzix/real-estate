package com.hostmdy.estate.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hostmdy.estate.model.User;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenticationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String mode = req.getParameter("mode"); 

        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        User user = loggedIn ? (User) session.getAttribute("user") : null;
        boolean isAgent = user != null && "agent".equals(user.getRole());
        boolean isPropertyPage = requestURI.equals(contextPath + "/property");
        boolean isLoginPage = requestURI.equals(contextPath + "/login") && "LOGIN".equals(mode);
        boolean isUserPage = requestURI.equals(contextPath + "/user") /*&& "VIEW_PROFILE".equals(mode) || "LISTAGENT".equals(mode) || "SIGNUP_FORM".equals(mode)*/;
        boolean isAgentPage = requestURI.equals(contextPath + "/agent") && "LIST".equals(mode);
        boolean isLogout = requestURI.equals(contextPath + "/login")  && "LOGOUT".equals(mode);
        boolean isAddFavoriteRequest = requestURI.equals(contextPath + "/favorite");
        boolean isAddBuyRequest = requestURI.equals(contextPath + "/buy");
       

//        System.out.println("Request URI: " + requestURI);
//        System.out.println();
//        System.out.println("User Role: " + (user != null ? user.getRole() : "none"));
//        System.out.println("Logged In: " + loggedIn);
//        System.out.println("Is Agent Page: " + isAgentPage);
//        System.out.println("is Log out : " + isLogout);
//        System.out.println();

        if (isLoginPage || isUserPage || isLogout  || isAddFavoriteRequest || isAddBuyRequest ) {
            // If directly requesting login or user page with the correct mode parameter, continue
            chain.doFilter(request, response);
        } else if (isPropertyPage || (loggedIn && isAgent )) {
            // Allow access to the property page
            chain.doFilter(request, response);
        } else if (loggedIn  && isUserPage && isAgent && isAgentPage) {
            // Redirect to the property page if trying to access the agent page directly
            resp.sendRedirect(contextPath + "/property");	
        }
        else {
            // Redirect to the property page if not logged in and trying to access restricted pages
            resp.sendRedirect(contextPath + "/property");
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

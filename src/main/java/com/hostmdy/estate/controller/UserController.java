package com.hostmdy.estate.controller;

import java.io.IOException;
import java.util.List;
import javax.sql.DataSource;
import com.hostmdy.estate.model.Mode;
import com.hostmdy.estate.model.User;
import com.hostmdy.estate.model.UserDAO;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user")
public class UserController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/estate_app")
	private DataSource dataSource;
	
	private UserDAO userDAO;

	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO(dataSource);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String param = req.getParameter("mode");
		System.out.println("Param in User Controller is " + param);
		Mode mode = null;

		if (param == null) {
			mode = Mode.SIGNUP_FORM;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case SIGNUP_FORM:
			showSignUpForm(req, resp);
			break;
		case SIGNUP:
			System.out.println("Calling signUp method");
			signUp(req, resp);
			break;
		case LISTAGENT:
			showAgentList(req, resp);
			break;
		case VIEW_PROFILE:
			showAllProfile(req, resp);
			break;
		case LOAD_PROFILE:
			loadProfile(req, resp);
			break;
		case EDIT_PROFILE:
			editProfile(req, resp);
			break;
		
		default:
			signUp(req, resp);
			break;
		}
		
		
	}
	

	
	private void showAllProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> profile = userDAO.getAllProfile(); 
		req.setAttribute("profile", profile);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/view-profile.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	private void loadProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
		Long userId = Long.parseLong(req.getParameter("userId"));
		User user = userDAO.getProfileById(userId);
		if (currentUser != null && user.getId().equals(currentUser.getId())) {
			req.setAttribute("user", user);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/view-profile.jsp");
			dispatcher.forward(req, resp);
		} 
		
	}
	
	private void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("mobile");

        User user = new User(currentUser.getId(), firstname, lastname, username, email, phone);
        boolean editOk = userDAO.updateUser(user);
       // System.out.println("updating");

        if (editOk) {
            resp.sendRedirect("user?mode=VIEW_PROFILE");
          //  System.out.println("update success");
        } else {
            req.setAttribute("editOk", false);
            req.setAttribute("user", user);
            RequestDispatcher dispatcher = req.getRequestDispatcher("user?mode=EDIT_PROFILE");
            dispatcher.forward(req, resp);
        }
    }

	private void showSignUpForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/common/nav.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String username = req.getParameter("username1");
		String email = req.getParameter("email1");
		String phone = req.getParameter("mobile");
		String password = req.getParameter("password1");
//		String confirmPassword = req.getParameter("confirmPassword");
//	    
//	    if (password == null || !password.equals(confirmPassword)) {
//	        req.setAttribute("signUpOk", false);
//	        req.setAttribute("errorMessage", "Passwords do not match.");
//	        System.out.println("passwords do not match");
//	        RequestDispatcher dispatcher = req.getRequestDispatcher("property");
//	        dispatcher.forward(req, resp);
//	        return;
//	    }
		
//		System.out.println("email is "+email);
//		System.out.println("firstname is "+firstname);
//		System.out.println("lastname is "+lastname);
//		System.out.println("phone is "+phone);
//		System.out.println("password is "+password);
		
		boolean signUpOk = userDAO.createUser(new User(firstname, lastname, username, email, password, phone, "user"));
		
		req.setAttribute("signUpOk", signUpOk);
		RequestDispatcher dispatcher = req.getRequestDispatcher("property");
        dispatcher.forward(req, resp);
		
		//showSignUpForm(req, resp);
		
	}
	
	private void showAgentList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> agentList = userDAO.getAllAgents();
		req.setAttribute("agentList", agentList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-list.jsp");
		dispatcher.forward(req, resp);
	}
	


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
} 
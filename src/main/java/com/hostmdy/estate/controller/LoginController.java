package com.hostmdy.estate.controller;

import java.io.IOException;
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

@WebServlet("/login")
public class LoginController extends HttpServlet{

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

        String param = req.getParameter("mode");
        Mode mode = null;

        if (param == null) {
            mode = Mode.LOGIN;
        } else {
            mode = Mode.valueOf(param);
        }

        switch (mode) {
        case LOGIN_FORM:
            showLoginForm(req, resp);
            break;
        case LOGIN:
            login(req, resp);
            break;
        case LOGOUT:
        	logout(req, resp);
        	break;

        default:
            showLoginForm(req, resp);
            break;
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
    	HttpSession session = req.getSession();
    	session.removeAttribute("user");
		resp.sendRedirect("property");
		
		
	}

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        boolean loginOk = userDAO.authenticate(username, password);
        boolean isUserBanned = userDAO.authenticate(username,password);
        if (loginOk) {
            User user = userDAO.getUserByUsernameorEmail(username).get();
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("property?mode=LIST");
            System.out.println("login success");
        } else if (isUserBanned) {
            req.setAttribute("loginError", "Your account is temporarily banned.");
           RequestDispatcher dispatcher=  req.getRequestDispatcher("property?mode=LIST");
            dispatcher.forward(req, resp);
            return;
        }
        else {
            req.setAttribute("loginOk", loginOk);
            RequestDispatcher dispatcher = req.getRequestDispatcher("property?mode=LIST");
            dispatcher.forward(req, resp);
            System.out.println("login fail");
        }
        
       

        
    }

    private void showLoginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/sign-in.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    
    }
}

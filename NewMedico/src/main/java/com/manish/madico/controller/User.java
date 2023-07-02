package com.manish.madico.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.manish.madico.dao.ServiceMedico;
import com.manish.madico.entity.UserEntity;

@WebServlet(urlPatterns = "/User", initParams = {
		@WebInitParam(name = "dbUrl", value = "jdbc:mysql://localhost:3306/audi"),
		@WebInitParam(name = "dbUser", value = "root"), @WebInitParam(name = "dbPassword", value = "MANISH80") })
public class User extends HttpServlet {
	private static Connection connection;
	static public UserEntity bean;

	@Override
	@SuppressWarnings("unused")
	public void init(ServletConfig config) {
		ServletContext context = config.getServletContext();
		/* System.out.println(context); */
		try {
			Class<?> forName = Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/audi", "root", "MANISH80");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		/*
		 * System.out.println(forName);
		 * System.out.println(context.getInitParameter("dbUrl"));
		 * System.out.println(context.getInitParameter("dbUser"));
		 * System.out.println(context.getInitParameter("dbPassword"));
		 * context.getInitParameter("dbUrl"), context.getInitParameter("dbUser"),
		 * context.getInitParameter("dbPassword")
		 */

	}

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserEntity bean = new UserEntity();
		String action = req.getParameter("typeofuseraction");

		if (action.equals("Login")) {

			bean.setUsername(req.getParameter("username"));
			bean.setPassword(req.getParameter("password"));
			try {
				req.setAttribute("username", req.getParameter("username"));
				boolean login = ServiceMedico.login(bean, User.connection, req);
				if (login == true) {

					req.setAttribute("userdata", ServiceMedico.getdata());
					req.getRequestDispatcher("Dashbord.jsp").forward(req, resp);

				} else {
					req.getRequestDispatcher("Login.jsp").forward(req, resp);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("register")) {
			try {
				bean.setProfiletype(req.getParameter("type"));
				bean.setPassword(req.getParameter("password"));
				bean.setEmail(req.getParameter("email"));
				bean.setPhone(req.getParameter("phone"));
				bean.setName(req.getParameter("name"));
				boolean register = ServiceMedico.register(bean, User.connection);

				HttpSession session = req.getSession();
				session.setAttribute("uname", req.getParameter("name"));

				if (register == true) {
					req.getRequestDispatcher("/CreateProfile.jsp").forward(req, resp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}

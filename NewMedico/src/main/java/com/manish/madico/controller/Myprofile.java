package com.manish.madico.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manish.madico.dao.ServiceMedico;
import com.manish.madico.entity.UserEntity;

@WebServlet("/myprofile")
public class Myprofile extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getParameter("edit").equals("edit")) {
			UserEntity show = new UserEntity();
			show.setUsername(req.getParameter("username"));
			show.setName(req.getParameter("firstname"));
			show.setEmail(req.getParameter("email"));
			show.setPhone(req.getParameter("mobile"));
			show.setId(Integer.parseInt(req.getParameter("id")));
			try {
				ServiceMedico.Update(show);
				List<UserEntity> getdata = ServiceMedico.getdata();
				for (Iterator iterator = getdata.iterator(); iterator.hasNext();) {
					UserEntity userEntity = (UserEntity) iterator.next();
					if (userEntity.getUsername().equals(req.getParameter("username"))) {
						req.setAttribute("userdetails", userEntity);
					}

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("/Profile.jsp").forward(req, resp);
		} else if (req.getParameter("edit").equals("show")) {
			String name = req.getParameter("uname");
			try {
				List<UserEntity> getdata = ServiceMedico.getdata();
				for (Iterator iterator = getdata.iterator(); iterator.hasNext();) {
					UserEntity userEntity = (UserEntity) iterator.next();
					if (userEntity.getUsername().equals(name)) {
						req.setAttribute("userdetails", userEntity);
					}

				}

				req.getRequestDispatcher("/Profile.jsp").forward(req, resp);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}

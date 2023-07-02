package com.manish.madico.controller.chatwithother;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manish.madico.dao.ServiceMedico;
import com.manish.madico.entity.UserEntity;

@WebServlet("/chatwithother")
public class Chatwithother extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ArrayList<UserEntity> attribute1;

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext context = getServletContext();
		attribute1 = (ArrayList<UserEntity>) context.getAttribute("image123");

		if (req.getParameter("chatype").equals("message") && !context.getAttribute("image123").equals(null)) {

			attribute1 = (ArrayList<UserEntity>) context.getAttribute("image123");
			context.setAttribute("users", attribute1);
			ServiceMedico.setArr(attribute1);
			req.getRequestDispatcher("UserCommunication.jsp").forward(req, resp);

		} else if (req.getParameter("chatype").equals("chat") && !context.getAttribute("chat1").equals(null)) {
			HashMap<Integer, UserEntity> attribute = (HashMap<Integer, UserEntity>) context.getAttribute("chat1");

			context.setAttribute("users", ServiceMedico.getArr());
			for (Map.Entry l : attribute.entrySet()) {

				int key = (Integer) l.getKey();
				UserEntity value = (UserEntity) l.getValue();
				int id = value.getId();
				if (key == id) {
					req.setAttribute("userchat", value);

				}

			}
			req.getRequestDispatcher("UserCommunication.jsp").forward(req, resp);

		}
	}

}

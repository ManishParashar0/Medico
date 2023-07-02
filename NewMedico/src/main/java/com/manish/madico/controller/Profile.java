package com.manish.madico.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.manish.madico.dao.ServiceMedico;
import com.manish.madico.entity.UserEntity;

@WebServlet("/profile")
@MultipartConfig
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("profile");
		String name = req.getParameter("userid");
		boolean pr = false;
		Part part = req.getPart("image");
		String fileName = part.getSubmittedFileName();
		System.out.println(fileName);
		String path = ("D:\\sts\\NewMedico\\src\\main\\webapp\\src\\images\\" + fileName);
		InputStream inStream = part.getInputStream();

		try {
			pr = ServiceMedico.profile(fileName, req, name);
			byte[] byt = new byte[inStream.available()];
			inStream.read(byt);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(byt);
			fos.close();
			if (pr == true) {
				try {
					List<UserEntity> getdata = ServiceMedico.getdata();
					System.out.println(getdata);
					req.setAttribute("userdata", getdata);
					req.setAttribute("profilename", fileName);
					req.setAttribute("username", name);
					String attribute = (String) req.getAttribute("profilename");
					req.getRequestDispatcher("Dashbord.jsp").forward(req, resp);

				} catch (Exception e) {
					System.out.println(e);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

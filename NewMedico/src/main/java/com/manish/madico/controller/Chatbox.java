package com.manish.madico.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/chat")
public class Chatbox extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] history = null;
		String parameter = req.getParameter("message");
		System.out.println(parameter);
		String[] problam = { "Sardi-Jukham (Common cold)", "Sardi-Jukham", "(Common cold)" };
		String[] chat = { "HII", "HELLO", "HELP", "HOW ARE YOU", "HEY", "HOW ARE YOU" };
		String[] beh = { "Whatisyourname", "Howareyou", "Whereareyoufrom", "Whatdoyoudoforaliving", "Howoldareyou",
				"Whatisyourfavoritehobby", "Whatareyourinterests", };
		HttpSession session = req.getSession();
		session.setAttribute("history", history);

		if (parameter != null) {
			String message = parameter.toUpperCase();
			for (int i = 0; i < chat.length; i++) {

				if (message.toUpperCase().equals(chat[i].toUpperCase())) {
					String res = "Hello! how can i help you ,ask me question only medical/hospital releted question Bukhar (Fever)\r\n"
							+ "Sardi-Jukham (Common cold)\r\n" + "Malaria\r\n" + "Typhoid (Typhoid fever)\r\n"
							+ "Pait ki bimariya (Stomach ailments)\r\n" + "Skin infections (Twacha ke sankraman)\r\n"
							+ "Khansi (Cough)\r\n" + "Pet ki khrabi (Indigestion)\r\n" + "Dast (Diarrhea)\r\n"
							+ "Headache (Sar dard)";
					req.setAttribute("responce", res);
					req.setAttribute("usermassage", parameter);
				}
			}
			for (int d = 0; d < problam.length; d++) {
				if (message.toUpperCase().equals(problam[d].toUpperCase())) {
					String res = "Here are some common medications that are often used to treat common illnesses like fever, cold, malaria, typhoid, stomach ailments, skin infections, cough, indigestion, diarrhea, and headache:\r\n"
							+ "\r\n"
							+ "Paracetamol - It is used to treat common ailments such as fever, headache, and cold.\r\n"
							+ "\r\n" + "Cetirizine - It is used to treat cold and flu symptoms.\r\n" + "\r\n"
							+ "Chloroquine - It is used to treat malaria.\r\n" + "\r\n"
							+ "Azithromycin - It is used to treat typhoid fever, cough, and skin infections.\r\n"
							+ "\r\n" + "Antacids - They are used to treat indigestion and diarrhea.\r\n" + "\r\n"
							+ "These medications are provided as general information only, and it is essential to consult a doctor or pharmacist before taking any medication.";
					req.setAttribute("responce", res);
					req.setAttribute("usermassage", parameter);
				}

			}
			for (int k = 0; k < beh.length; k++) {
				if (message.toUpperCase().replace(" ", "").equals(beh[k].toUpperCase())) {
					String res = "\r\n"
							+ "As an AI language model, I don't have personal experiences or emotions, so I don't have a personal perspective or feelings to share. However, I can provide information, answer questions, and engage in conversations on a wide range of topics. How can I assist you further?";
					req.setAttribute("responce", res);
					req.setAttribute("usermassage", parameter);
				}
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher("NewFile.jsp");
			dispatcher.forward(req, resp);

		}
	}
}

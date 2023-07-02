package com.manish.madico.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.manish.madico.connection.ConnectionProvider;
import com.manish.madico.entity.UserEntity;

public class ServiceMedico {
	private static Connection con;
	private static ArrayList<UserEntity> arr;

	public static boolean login(UserEntity bean, Connection connection, HttpServletRequest req) throws SQLException {
		if (con == null) {
			con = ConnectionProvider.ConnectionProvider();
		}
		Statement statement = connection.createStatement();
		ResultSet rs1 = statement.executeQuery("select * from NEWMEDICO where username='" + bean.getUsername() + "'");
		while (rs1.next()) {
			String Username1 = rs1.getString(2);
			String image = rs1.getString(8);
			if (Username1.equals(bean.getUsername())) {
				req.setAttribute("profilename", image);
			}
		}

		boolean returntype = false;
		ResultSet rs = statement.executeQuery("select * from NEWMEDICO");
		while (rs.next()) {
			String Username = rs.getString(2);
			String password = rs.getString(6);
			if (Username.equals(bean.getUsername()) && password.equals(bean.getPassword())) {
				returntype = true;
			}
			con = connection;
		}
		return returntype;

	}

	public static boolean register(UserEntity bean, Connection connection) throws SQLException {
		System.out.println("hello register");
		if (con == null) {
			con = ConnectionProvider.ConnectionProvider();
		}
		PreparedStatement statement = connection.prepareStatement(
				"insert into newmedico(username,name,phone,email,password,profiletype,imagename) values(?,?,?,?,?,?,?)");

		boolean retuntype = false;
		statement.setString(1, bean.getUsername());
		statement.setString(2, bean.getName());
		statement.setString(3, bean.getPhone());
		statement.setString(4, bean.getEmail());
		statement.setString(5, bean.getPassword());
		statement.setString(6, bean.getProfiletype());
		statement.setString(7, bean.getImage_name());
		int executeQuery = statement.executeUpdate();
		if (executeQuery <= 1) {
			retuntype = true;
		}
		con = connection;
		return retuntype;

	}

	static public boolean profile(String imagename, HttpServletRequest req, String name) throws SQLException {
		if (con == null) {
			con = ConnectionProvider.ConnectionProvider();
		}
		String value = null;
		HttpSession session = req.getSession(false);
		value = (String) session.getAttribute("uname");

		Boolean type = false;
		PreparedStatement statement = con.prepareStatement("UPDATE newmedico SET username=?, imagename=? WHERE name=?");

		statement.setString(1, name);
		statement.setString(2, imagename);
		statement.setString(3, value);
		int i = statement.executeUpdate();
		if (i <= 1) {
			type = true;
		}
		return type;

	}

	static public List<UserEntity> getdata() throws SQLException {
		if (con == null) {
			con = ConnectionProvider.ConnectionProvider();
		}
		List<UserEntity> list = new ArrayList<>();
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select * from NEWMEDICO");
		while (rs.next()) {
			UserEntity entity = new UserEntity();
			entity.setId(rs.getInt(1));
			entity.setUsername(rs.getString(2));
			entity.setName(rs.getString(3));
			entity.setPhone(rs.getString(4));
			entity.setEmail(rs.getString(5));
			entity.setProfiletype(rs.getString(7));
			entity.setImage_name(rs.getString(8));
			list.add(entity);
		}
		return list;

	}

	static public void Update(UserEntity show) throws SQLException {
		if (con == null) {
			con = ConnectionProvider.ConnectionProvider();
		}
		// Assuming you have established a valid Connection object named "con"

		String query = "UPDATE newmedico SET username = ?, name = ?, phone = ?, email = ? WHERE idNewmedico = ?";
		PreparedStatement statement = con.prepareStatement(query);

		// Set the parameter values
		statement.setString(1, show.getUsername());
		statement.setString(2, show.getName());
		statement.setString(3, show.getPhone());
		statement.setString(4, show.getEmail());
		statement.setInt(5, show.getId());

		int rowsAffected = statement.executeUpdate();
	}

	public static ArrayList<UserEntity> getArr() {
		return arr;
	}

	public static void setArr(ArrayList<UserEntity> attribute1) {
		arr = attribute1;
	}

}

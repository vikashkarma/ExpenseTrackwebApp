package edu.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.util.DBUtil;

public class LoginDao {

	public static boolean validate(String name, String pass) {
		boolean status = false;
		try {
			Connection con = DBUtil.connect();
			PreparedStatement ps = con.prepareStatement("select * from Expense where name=? and pass=?");
			ps.setString(1, name);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			status = rs.next();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}

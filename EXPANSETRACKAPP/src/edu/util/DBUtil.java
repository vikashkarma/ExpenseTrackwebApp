package edu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * @author vikash karma
 *
 */
public class DBUtil {
	static Properties p;
	static String url = null;
	static {
		try {
			p = new Properties();
			p.load(DBUtil.class.getClassLoader().getResourceAsStream("dbinfo.properties"));
			String driver = p.getProperty("driver");
			System.out.println(driver);
			url = p.getProperty("url");
			System.out.println(url);
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println("DBUtil static-block : " + e);
		}
	}

	public static Connection connect() {
		try {
			Connection con = DriverManager.getConnection(url, p);
			System.out.println(con);
			return con;
		} catch (SQLException e) {
			System.out.println("DBUtil > connect : " + e);
		}
		return null;
	}

	public static void close(Connection con, Statement st, ResultSet rs) {
		try {
			if (con != null) {
				con.close();
			}
			if (st != null) {
				st.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			System.out.println("DBUtil > close : " + e);
		}
	}

}

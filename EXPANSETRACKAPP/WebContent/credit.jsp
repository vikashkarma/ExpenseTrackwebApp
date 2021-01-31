<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.util.*" %>
<%
	String amount = request.getParameter("amnt");
int iamount = Integer.parseInt(amount);

String uname = request.getParameter("ac");

String type = "Credit";
try {

	Connection con = DBUtil.connect();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from Expense where Uname=" + uname);
	int totbal = 0;
	while (rs.next()) {
		int s1 = rs.getInt(3);

		totbal = s1 - iamount;
		if (totbal <= 0) {
	out.println("Your amount is credited you have to pay Rs" + totbal);
		} else {
	out.println("Your amount is credited Your balance is" + totbal);
		}
	}

	PreparedStatement pstmt = con.prepareStatement("update Expense set balance=? where uname=" + uname);
	pstmt.setInt(3, totbal);
	int i = pstmt.executeUpdate();
}

catch (Exception e) {

}
%>
</html>
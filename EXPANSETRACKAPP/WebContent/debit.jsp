<html>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="edu.util.*" %>>
	<%
		String amount = request.getParameter("amnt");
	int iamount = Integer.parseInt(amount);

	String uname = request.getParameter("ac");

	String type = "Debit";
	
	try {
		Connection con = DBUtil.connect();

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Expense where Uname=" +uname);
		int totbal = 0;
		while (rs.next()) {
			int s1 = rs.getInt(4);
			if (s1 >= 500) {
		totbal = s1 - iamount;
		out.println("Amount is Debited successfully");
		out.println("Your balance is" + totbal);
			} else {
		out.println("Your balance is less than 500,You can't debit the amount");
		totbal = s1;
			}
		}
		PreparedStatement pstmt = con.prepareStatement("update Expense set balance=? where Uname=" + uname);
		pstmt.setInt(1, totbal);
		int i = pstmt.executeUpdate();

	
	} catch (Exception e) {

	}
	%>

</html>
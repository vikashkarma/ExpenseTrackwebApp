<html>

<body bgcolor="#ccccdd">
<%
String acno=(String)session.getAttribute("sess");
                                    System.out.println(acno);
                                    %>
<center>
		<h1>Welcome To Expense Track Web App</h1><br>
		<h3>IF YOU WANT TO CREDIT AMOUNT</h3><a href="credit.html">Click Here </a>
		<br>
		<h3>IF YOU WANT TO DEBIT AMOUNT</h3><a href="debit.html">Click Here </a>
		<br>
		<h3>IF YOU WANT TO CHECK AMOUNT</h3><a href="check.html">Click Here </a>
		<br>
		<h3>IF YOU WANT TO CHECK TRANSECTION HISTRY</h3><a href="credit.html">Click Here </a>
	</center>
</body>
</html>
Credit Design Page
//credit.html
<html>
<Head> <center>Welcome to the credit page</center></head>
<form action="credit.jsp">
<body bgcolor="#ccccdd"><center><table>
<tr><td>Enter the Username</td><td><input type="text" name="ac"></td></tr>
<tr><td>Enter the Amount</td><td><input type="text" name="amnt"></td></tr>
<tr><td><input type="submit" value="credit"></tr></td></table></center>
</body>
</form>
</html>
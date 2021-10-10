<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
		<meta charset="utf-8">
			<title></title>
			<link rel="stylesheet" href="style.css">
				<style media="screen">
				table{
					border-collapse: collapse;
					padding: 3px;
					margin: 0;
					align-items: center;
				}
				th, td {
					padding: 15px;
				}
				.btn {
					background: #53B8BB;
					background-image: -webkit-linear-gradient(top, #53B8BB, #3093d1);
					background-image: -moz-linear-gradient(top, #53B8BB, #3093d1);
					background-image: -ms-linear-gradient(top, #53B8BB, #3093d1);
					background-image: -o-linear-gradient(top, #53B8BB, #3093d1);
					background-image: linear-gradient(to bottom, #53B8BB, #3093d1);
					-webkit-border-radius: 20;
					-moz-border-radius: 20;
					border-radius: 20px;
					text-shadow: 0px 1px 0px #949294;
					-webkit-box-shadow: 4px 4px 3px #666666;
					-moz-box-shadow: 4px 4px 3px #666666;
					box-shadow: 4px 4px 3px #666666;
					font-family: Georgia;
					color: #000000;
					font-size: 26px;
					padding: 10px 20px 10px 20px;
					border: solid #2e89c2 0px;
					text-decoration: none;
					width: 150px;
				}

				.btn:hover {
					background: #44abeb;
					background-image: -webkit-linear-gradient(top, #44abeb, #3498db);
					background-image: -moz-linear-gradient(top, #44abeb, #3498db);
					background-image: -ms-linear-gradient(top, #44abeb, #3498db);
					background-image: -o-linear-gradient(top, #44abeb, #3498db);
					background-image: linear-gradient(to bottom, #44abeb, #3498db);
					text-decoration: none;
				}

				</style>
		</head>
		<body>
<center>


			<%@ page import="java.io.*" %>
				<%@ page import="java.sql.*" %>
					<%
		String id=request.getParameter("username");
		String p=request.getParameter("password");
		String pos=request.getParameter("pos");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
		Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
		Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
			Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
				Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from login where username='"+id+"' and password='"+p+"'");
		  String log=" ";
			String hos=" ";
			if(rs.next())
			{ log=rs.getString("loginid");
				if(pos.equals("host"))
		          {
								Statement stt=con1.createStatement();
				 ResultSet rss=stt.executeQuery("select * from host where loginid='"+log+"'");
				 if(rss.next())
				 {
					  hos=rss.getString("hid");
				 %>
				 <form action="event.html">
	 	 		<button  class="btn" type="submit" name="submit">Confirm</button>
	 	 		</form>
	 			<br><br><br>
						<table border="1">
							<tr>
								<th>Id</th>
								<th>firstname</th>
								<th>lastname</th>
								<th>cno</th>
								<th>email</th>

							</tr>

							<tr>
								<td><%=rss.getString("hid") %>
								</td>
								<td><%=rss.getString("firstname") %>
								</td>
								<td><%=rss.getString("lastname") %>
								</td>
								<td><%=rss.getString("cno") %>
								</td>
								<td><%=rss.getString("email") %>
								</td>
							</tr>
						</table>
						<%
				 }

				 Statement stt1=con2.createStatement();
				  %><br><br><br>
				 <table border="1">
				  <tr>
				 	 <th>Event id</th>
				 	 <th>Event name</th>
				 	 <th>Event venue</th>
				 	 <th>Event time</th>
				 	 <th>Event date</th>
				 	 <th>Logistic</th>
				 	 <th>Total cost</th>
				  </tr>
						<%
	 ResultSet rss1=stt1.executeQuery("select * from event where hid='"+hos+"'");
	 while(rss1.next())
	 {
	 %>

	 <tr>
	 <td><%=rss.getString("evid") %> </td>
	 <td><%=rss.getString("ename") %> </td>
	 <td><%=rss.getString("evenue") %> </td>
	 <td><%=rss.getString("etime") %> </td>
	 <td><%=rss.getString("edate") %> </td>
	 <td><%=rss.getString("logisticid") %> </td>
	 <td><%=rss.getString("ecost") %> </td>
	 </tr>
	 <%
	 }
	 %>
</table>
 <%

							}
		           else if(pos.equals("organizer"))
		           {
								 Statement stt1=con3.createStatement();
 				 ResultSet rss1=stt1.executeQuery("select * from organizer where loginid='"+log+"'");
 				 if(rss1.next())
				 {
					 %>
							<table border="1">
								<tr>
									<th>Id</th>
									<th>firstname</th>
									<th>lastname</th>
									<th>cno</th>
									<th>email</th>
              	<th>salary</th>
								</tr>

								<tr>
									<td><%=rss1.getString("oid") %>
									</td>
									<td><%=rss1.getString("firstname") %>
									</td>
									<td><%=rss1.getString("lastname") %>
									</td>
									<td><%=rss1.getString("cno") %>
									</td>
									<td><%=rss1.getString("email") %>
									</td>
									<td><%=rss1.getString("salary") %></td>
								</tr>
							</table>
							<br><br><br>
							<form action="employeeview.jsp">
					 		<button  class="btn" type="submit" name="submit">View</button>
					 		</form>
							<br><br><br>
								<form action="addorganizer.html">
						 		<button  class="btn" type="submit" name="submit">Add</button>
						 		</form>
							<%
				 }
				 else
				 {
					 out.println("wrong");
				 }
							 }
		           else
		           {
								 Statement stt2=con4.createStatement();
 				ResultSet rss2=stt2.executeQuery("select * from employee where loginid='"+log+"'");
 				if(rss2.next())
				{
					%>
						 <table border="1">
							 <tr>
								 <th>Id</th>
								 <th>firstname</th>
								 <th>lastname</th>
								 <th>cno</th>
								 <th>email</th>
							 <th>salary</th>
							 <th>position</th>
							 <th>team id</th>
							 </tr>

							 <tr>
								 <td><%=rss2.getString("eid") %>
								 </td>
								 <td><%=rss2.getString("firstname") %>
								 </td>
								 <td><%=rss2.getString("lastname") %>
								 </td>
								 <td><%=rss2.getString("cno") %>
								 </td>
								 <td><%=rss2.getString("email") %>
								 </td>
								 <td><%=rss2.getString("salary") %></td>
								 <td><%=rss2.getString("position") %></td>
								 <td><%=rss2.getString("tid") %></td>

							 </tr>
						 </table>
						 	<%
				}

							 }
		       }
		        else
		        {
		        out.println("login failure");
		        }
		con.close();
		con1.close();
		con2.close();
		con3.close();
			con4.close();
		%>
</center>
							</body>
						</html>

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
      }
      th, td {
        padding: 15px;
      }
      .topnav {
        overflow: hidden;
        background-color: #333;
      }

      .topnav a {
        float: left;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
      }

      .topnav a:hover {
        background-color: #ddd;
        color: black;
      }

      .topnav a.active {
        background-color: #055052;
        color: white;
      }
      </style>
  </head>
  <body>
    <div class="topnav">
    <a href="employeeview.jsp">View Employee List</a>
    <a href="organizerview.jsp">View Organizer List</a>
      <a href="teamsview.jsp">View Teams list </a>
      <a  class="active" href="eventview.jsp">View Events List</a>
      <a href="logistic.jsp">view logistic List</a>
      <a href="hostview.jsp">View Host list </a>
      <a href="setteams.html">Set </a>
      <a href="login.html">Logout</a>
  </div>
  <br><br>
      <center>
    <table border="1">
      <tr>
        <th>Id</th>
        <th>Event name</th>
        <th>Venue</th>
        <th>Time</th>
        <th>Date</th>
      <th>Host id</th>
      <th>Organizer id</th>
      <th>Logistic id</th>
      <th>Total cost</th>
      <th>Balance</th>
      </tr>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
      Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
     String t=" ";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT * FROM event");
    while(rs.next())
    { t=rs.getString("evid");
      %> <tr>
             <td><%=rs.getString("evid") %>
             </td>
             <td><%=rs.getString("ename") %>
             </td>
             <td><%=rs.getString("evenue") %>
             </td>
             <td><%=rs.getString("etime") %>
             </td>
             <td><%=rs.getString("edate") %>
             </td>
             <td><%=rs.getString("hid") %></td>
             <td><%=rs.getString("oid") %></td>
             <td><%=rs.getString("logisticid") %></td>
              <td><%=rs.getString("ecost") %></td>
              <%Statement st2=con2.createStatement();
              ResultSet rs2=st2.executeQuery("SELECT balance FROM payments where evid='"+t+"'");
              while(rs2.next())
              {  %><td><%=rs2.getString("balance") %></td>  <%}  %>

            </tr>
          <%
    }

    con.close();
    con1.close();
    con2.close();
    %>
    </table>


    </center>
  </body>
</html>

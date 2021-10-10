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
      <a href="eventview.jsp">View Events List</a>
      <a href="logistic.jsp">view logistic List</a>
      <a  class="active" href="hostview.jsp">View Host list </a>
      <a href="login.html">Logout</a>
  </div>
  <br><br>
    <center>


    <table border="1">
      <tr>
        <th>Id</th>
        <th>firstname</th>
        <th>lastname</th>
        <th>cno</th>
        <th>email</th>


      </tr>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT * FROM host");
    while(rs.next())
    {
      %> <tr>
             <td><%=rs.getString("hid") %>
             </td>
             <td><%=rs.getString("firstname") %>
             </td>
             <td><%=rs.getString("lastname") %>
             </td>
             <td><%=rs.getString("cno") %>
             </td>
             <td><%=rs.getString("email") %>
             </td>


           </tr>
          <%
    }
    con.close();
    %>
    </table>
    </center>
  </body>
</html>

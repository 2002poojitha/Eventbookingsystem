<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <title></title>
      <link rel="stylesheet" href="style.css">
        <style media="screen">
          table {
            border-collapse: collapse;
            padding: 3px;
            margin: 30px;
          }
          td,
          th {
            padding: 15px;
          }
          .topnav {
            overflow: hidden;
            background-color: #333;
            margin-left: 140px;
            margin-right: 140px;
            margin-top: 10px;
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
          <a href="teamsview.jsp">View Teams list
          </a>
          <a href="eventview.jsp">View Events List</a>
          <a class="active" href="logistic.jsp">view logistic List</a>
          <a href="hostview.jsp">View Host list
          </a>
          <a href="addlogistic.html">Add
          </a>
          <a href="login.html">Logout</a>
        </div>
        <br>
          <br>
            <center>

              <%@ page import="java.io.*" %>
                <%@ page import="java.sql.*" %>
                  <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    String log=" ";
    Statement st1=con1.createStatement();
    ResultSet rs1=st1.executeQuery("SELECT * FROM logistic");
    while(rs1.next())
    { log=rs1.getString("logisticid");
      %>


                <strong>   Logistic id:</strong><%=rs1.getString("logisticid") %>
                    <br>
                  <strong>   Logistic name:</strong><%=rs1.getString("logname") %>
                      <br>
                    <strong>   Logistic description:</strong><%=rs1.getString("logdescription") %>
                        <br>
                    <strong>  Logistic cost:</strong><%=rs1.getString("logcost") %>
                          <br>

                            <table border="1">
                              <tr>
                                <th>material id</th>
                                <th>material name</th>
                                <th>material price</th>
                                <th>description</th>
                              </tr>
                              <%
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT * FROM material where logisticid='"+log+"'");

    while(rs.next())
    { %>
                                <tr>
                                  <td><%=rs.getString("matid") %>
                                  </td>
                                  <td><%=rs.getString("matname") %>
                                  </td>
                                  <td><%=rs.getString("matprice") %>
                                  </td>
                                  <td><%=rs.getString("matdesc") %>
                                  </td>
                                </tr>
                                <%}
       %>  </table> <%}


    con.close();

    con1.close();
    %>

                                </center>
                              </body>
                            </html>

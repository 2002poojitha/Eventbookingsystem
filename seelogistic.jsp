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
            margin:50px;
          }
          td,
          th {
            padding: 15px;
          }
          .topnav {
            overflow: hidden;
            background-color: #333;
            margin-left: 250px;
            margin-right: 250px;
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
        <a href="event.html">Book an Event</a>
        <a href="payments1.html">Make payments</a>
        <a class="active" href="seelogistic.jsp">See logistic</a>
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
                    Logistic id:<%=rs1.getString("logisticid") %>
                    <br>
                      Logistic name:<%=rs1.getString("logname") %>
                      <br>
                        Logistic description:<%=rs1.getString("logdescription") %>
                        <br>
                          Logistic cost:<%=rs1.getString("logcost") %>
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

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
      <link rel="stylesheet" href="style.css">
        <style media="screen">
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
        button {
          border: 0px;
          background: transparent;
          font-size: 20px;

        }
        table{
          border-collapse: collapse;
          padding: 3px;
          margin: 0;
        }
        th, td {
          padding: 15px;
        }


      </style>
  </head>
  <body>
    <%-- <div class="topnav">
      <a class="active" href="">Your Profile</a>
    <a href="event.html">Book an Event</a>
    <a href="payments.html">Make payments</a>
    <a href="logistic.jsp">See logistic</a>
  </div> --%>
  <form action="event.html">
  <button  class="btn" type="submit" name="submit">Confirm</button>
  </form>  <h1 style="text-align:center;">Your Details</h1>
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
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String cno=request.getParameter("cno");
    String email=request.getParameter("email");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String cpassword=request.getParameter("confirmpassword");
    if(cpassword.equals(password))
    {
    String login=" ";
    String loginseq=" ";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT loginidseq.NEXTVAL FROM DUAL");
    if(rs.next()){
     login=rs.getString(1);
     loginseq="LI"+login;
    }
    else{
    out.println("wrong");
    }
    PreparedStatement pst1=con1.prepareStatement("insert into login values(?,?,?)");
    pst1.setString(1,loginseq);
    pst1.setString(2,username);
    pst1.setString(3,password);
    int r1=pst1.executeUpdate();
    String host=" ";
    String hostseq=" ";
    Statement st1=con2.createStatement();
    ResultSet rs1=st1.executeQuery("SELECT loginidseq.NEXTVAL FROM DUAL");
    if(rs1.next()){
     host=rs1.getString(1);
     hostseq="HI"+host;
    }
    else{
    out.println("wrong");
    }
    PreparedStatement pst=con3.prepareStatement("insert into host values(?,?,?,?,?,?)");
    pst.setString(1,hostseq);
    pst.setString(2,fname);
    pst.setString(3,lname);
    pst.setString(4,cno);
    pst.setString(5,email);
    pst.setString(6,loginseq);
    int r=pst.executeUpdate();
    if(r==0 && r1==0)
    out.println("insertion failure");
    else
    {
       Statement stt=con3.createStatement();

ResultSet rss=stt.executeQuery("select * from host where hid='"+hostseq+"'");
if(rss.next())
{
%>
<tr>
<td><%=rss.getString("hid") %> </td>
<td><%=rss.getString("firstname") %> </td>
<td><%=rss.getString("lastname") %> </td>
<td><%=rss.getString("cno") %> </td>
<td><%=rss.getString("email") %> </td>
</tr>

<%
}
}
    }
    else
    {%>
    <jsp:forward page="signup.html"></jsp:forward>
    <%}
    con.close();
    con1.close();
    con2.close();
    con3.close();
    %>
</table>
  </body>
</html>

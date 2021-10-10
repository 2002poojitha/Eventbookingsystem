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
    <form action="payments1.html">
    <button  class="btn" type="submit" name="submit">Confirm</button>
    </form>
    <h1> Details</h1>
    <center>


    <table border="1">
      <tr>
        <th>Payment id</th>
        <th>Event id</th>
        <th>Event name</th>
        <th>Event venue</th>
        <th>Event time</th>
        <th>Event date</th>
        <th>Event attendees</th>
        <th>Logistic</th>
        <th>Logistic cost</th>
        <th>Total cost</th>
      </tr>
</center>

    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con5=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    String hid=request.getParameter("hid");
    String ename=request.getParameter("ename");
    String venue=request.getParameter("venue");
    String time=request.getParameter("time");
    String date=request.getParameter("date");
    int attend = Integer.parseInt(request.getParameter("eventat"));
    String logname=request.getParameter("logid");
    String count=request.getParameter("count");
    String pla=request.getParameter("platemeal");
    String ev=" ";
    String evseq=" ";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT evidseq.NEXTVAL FROM DUAL");
    if(rs.next()){
     ev=rs.getString(1);
     evseq="EV"+ev;
    }
    else{
    out.println("wrong");
    }

      String b1=" ";
      int b2=0;
      Statement st2=con4.createStatement();
      ResultSet rs2=st2.executeQuery("SELECT logisticid,logcost FROM logistic where logname='"+logname+"'");
      if(rs2.next()){
       b1=rs2.getString("logisticid");
       b2=rs2.getInt("logcost");
      }

      int pri=0;
      String ps=" ";
      ps="platemeal";
      Statement st3=con5.createStatement();
      ResultSet rs3=st3.executeQuery("SELECT matprice FROM material where logisticid='"+b1+"' and matname='"+ps+"'");
      if(rs3.next()){
       pri=rs3.getInt("matprice");
      }
    int bal1=0;
     bal1=pri*attend;
    int bal2=0;
    bal2=bal1+b2;
      String bal = String.valueOf(bal2);
      PreparedStatement pst1=con1.prepareStatement("insert into event(evid,ename,evenue,etime,edate,hid,logisticid,ecost) values(?,?,?,?,?,?,?,?)");
      pst1.setString(1,evseq);
      pst1.setString(2,ename);
      pst1.setString(3,venue);
      pst1.setString(4,time);
      pst1.setString(5,date);
      pst1.setString(6,hid);
      pst1.setString(7,b1);
      pst1.setString(8,bal);
      int r1=pst1.executeUpdate();
      String pay=" ";
      String payseq=" ";
      Statement st1=con2.createStatement();
      ResultSet rs1=st1.executeQuery("SELECT payidseq.NEXTVAL FROM DUAL");
      if(rs1.next()){
       pay=rs1.getString(1);
       payseq="PI"+pay;
      }
      else{
      out.println("wrong");
      }

      PreparedStatement pst=con3.prepareStatement("insert into payments values(?,?,?,?)");
      pst.setString(1,payseq);
      pst.setString(2,"0");
      pst.setString(3,bal);
      pst.setString(4,evseq);

      int r=pst.executeUpdate();
      if(r==0 && r1==0)
      out.println("insertion failure");
      else
      {
        Statement stt=con3.createStatement();

  ResultSet rss=stt.executeQuery("select payid from payments where evid='"+evseq+"'");
  if(rss.next())
  {
  %>
  <tr>
  <td><%=rss.getString("payid") %> </td>
  <td><%=evseq %> </td>
  <td><%=ename %> </td>
  <td><%=venue %> </td>
  <td><%=time %> </td>
  <td><%=date %> </td>
  <td><%=attend %> </td>
  <td><%=logname %> </td>
  <td><%=b2 %> </td>
  <td><%=bal %> </td>
  </tr>

  <%
  }
}
    con.close();
    con1.close();
    con2.close();
    con3.close();
    con4.close();
    con5.close();
    %>
  </body>
</html>

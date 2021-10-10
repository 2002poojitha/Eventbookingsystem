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
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
    <%

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
      Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
      Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
    String evid=request.getParameter("evid");
    int amount = Integer.parseInt(request.getParameter("amount"));

    int amo=0;
    int paid=0;
    int bal=0;
    String pi=" ";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT amountpaid,balance,payid FROM payments where evid='"+evid+"'");
    if(rs.next()){
     paid=rs.getInt("amountpaid");
     bal=rs.getInt("balance");
     pi=rs.getString("payid");
    }
    else{
    out.println("wrong");
    }
    paid=paid+amount;
    bal=bal-amount;
    String amou = String.valueOf(amount);
    String paid1 = String.valueOf(paid);
    String bal1 = String.valueOf(bal);
    String bill=" ";
    String billseq=" ";
    Statement st1=con2.createStatement();
    ResultSet rs1=st1.executeQuery("SELECT billnoseq.NEXTVAL FROM DUAL");
    if(rs1.next()){
     bill=rs1.getString(1);
     billseq="BN"+bill;
    }
    else{
    out.println("wrong");
    }
    PreparedStatement pst=con.prepareStatement("update payments set amountpaid='"+paid1+"', balance='"+bal1+"' where evid='"+evid+"'");
    int r=pst.executeUpdate();
    PreparedStatement pst1=con1.prepareStatement("insert into bill values(?,?,?)");
    pst1.setString(1,billseq);
    pst1.setString(2,amou);
    pst1.setString(3,pi);
    int r1=pst1.executeUpdate();
    if(r==0 && r1==0)
    out.println("insertion failure");
    else
    {%>
    <table>
      <tr>
        <td><h1>Payment successful</h1><br>
         Bill no:<%=billseq %><br>
         Paymant id:<%=pi%><br>
         Event id:<%=evid%><br>
         Amount paid:<%=amount%><br>
         Balance:<%=bal1%><br>

         </td>
      </tr>
    </table>
    <form action="payments1.html">
    <button  class="btn" type="submit" name="submit">Thank you</button>
    </form>

  <%}
    con.close();
    con1.close();
    con2.close();
    %>
  </body>
</html>

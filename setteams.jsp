<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");

String evid=request.getParameter("evid");
String t1=request.getParameter("t1");
String t2=request.getParameter("t2");
String t3=request.getParameter("t3");
String org=request.getParameter("org");
PreparedStatement pst=con.prepareStatement("insert into tab values(?,?)");
pst.setString(1,evid);
pst.setString(2,t1);
PreparedStatement pst1=con.prepareStatement("insert into tab values(?,?)");
pst1.setString(1,evid);
pst1.setString(2,t2);
PreparedStatement pst2=con.prepareStatement("insert into tab values(?,?)");
pst2.setString(1,evid);
pst2.setString(2,t3);
int r1=pst.executeUpdate();
int r2=pst1.executeUpdate();
int r3=pst2.executeUpdate();
PreparedStatement pst4=con1.prepareStatement("update event set oid='"+org+"' where evid='"+evid+"'");
int r4=pst4.executeUpdate();
if(r3==0 && r1==0 && r2==0 && r4==0)
out.println("insertion failure");
else
{%>
<jsp:forward page="setteams.html"></jsp:forward>
<%

}
con.close();
con1.close();

%>

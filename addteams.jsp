<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");

String name=request.getParameter("tname");
String cno=request.getParameter("cno");
String email=request.getParameter("email");
String ogid=request.getParameter("ogid");
Statement st1=con2.createStatement();
ResultSet rs1=st1.executeQuery("SELECT * FROM organizer where oid='"+ogid+"'");
if(rs1.next())
{
String tid=" ";
String tidseq=" ";
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("SELECT tidseq.NEXTVAL FROM DUAL");
if(rs.next()){
 tid=rs.getString(1);
 tidseq="TI"+tid;
}
else{
out.println("wrong");
}
PreparedStatement pst=con.prepareStatement("insert into teams values(?,?,?,?,?)");
pst.setString(1,tidseq);
pst.setString(2,name);
pst.setString(3,cno);
pst.setString(4,email);
pst.setString(5,ogid);
int r=pst.executeUpdate();
if(r==0)
out.println("insertion failure");
else
{%>
<jsp:forward page="addteams.html"></jsp:forward>
<%}

}
else
{
  out.println("please enter correct organizer id");
}
con.close();
con1.close();
con2.close();
%>

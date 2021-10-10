<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String cno=request.getParameter("cno");
String email=request.getParameter("email");
String sal=request.getParameter("salary");
String username=request.getParameter("username");
String password=request.getParameter("password");
String oid=" ";
String oidseq=" ";
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("SELECT oidseq.NEXTVAL FROM DUAL");
if(rs.next()){
 oid=rs.getString(1);
 oidseq="OI"+oid;
}
else{
out.println("wrong");
}
String lid=" ";
String lidseq=" ";
Statement st2=con3.createStatement();
ResultSet rs2=st2.executeQuery("SELECT loginidseq.NEXTVAL FROM DUAL");
if(rs2.next()){
  lid=rs.getString(1);
  lidseq="LI"+lid;
}
else{
out.println("wrong");
}
PreparedStatement pst1=con4.prepareStatement("insert into login values(?,?,?)");
pst1.setString(1,lidseq);
pst1.setString(2,username);
pst1.setString(3,password);
int r1=pst1.executeUpdate();
PreparedStatement pst=con.prepareStatement("insert into organizer values(?,?,?,?,?,?,?)");
pst.setString(1,oidseq);
pst.setString(2,fname);
pst.setString(3,lname);
pst.setString(4,cno);
pst.setString(5,email);
pst.setString(6,sal);
pst.setString(7,lidseq);
int r=pst.executeUpdate();

if(r==0 && r1==0)
out.println("insertion failure");
else
{%>
<jsp:forward page="addorganizer.html"></jsp:forward>
<%}
con.close();
con1.close();
con3.close();
con4.close();
%>

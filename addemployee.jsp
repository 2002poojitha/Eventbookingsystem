<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con3=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con4=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String cno=request.getParameter("cno");
String email=request.getParameter("email");
String sal=request.getParameter("salary");
String pos=request.getParameter("pos");
String tname=request.getParameter("team");
String username=request.getParameter("username");
String password=request.getParameter("password");
String eid=" ";
String eidseq=" ";
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("SELECT eidseq.NEXTVAL FROM DUAL");
if(rs.next()){
 eid=rs.getString(1);
 eidseq="EI"+eid;
}
else{
out.println("wrong");
}
String t=" ";
Statement st1=con2.createStatement();
ResultSet rs1=st1.executeQuery("SELECT tid FROM teams where teamname='"+tname+"'");
if(rs1.next()){
 t=rs1.getString("tid");
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
PreparedStatement pst=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,eidseq);
pst.setString(2,fname);
pst.setString(3,lname);
pst.setString(4,cno);
pst.setString(5,email);
pst.setString(6,sal);
pst.setString(7,pos);
pst.setString(8,lidseq);
pst.setString(9,t);
int r=pst.executeUpdate();
if(r==0 && r1==0)
out.println("insertion failure");
else
{%>
<jsp:forward page="addemployee.html"></jsp:forward>
<%}
con.close();
con1.close();
con2.close();
con3.close();
con4.close();
%>

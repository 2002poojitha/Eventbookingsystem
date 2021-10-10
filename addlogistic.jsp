<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
String lname=request.getParameter("lname");
String des=request.getParameter("des");
String lid=" ";
String lidseq=" ";
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("SELECT logisticseq.NEXTVAL FROM DUAL");
if(rs.next()){
 lid=rs.getString(1);
 lidseq="LGI"+lid;
}
else{
out.println("wrong");
}
PreparedStatement pst1=con.prepareStatement("insert into logistic(logisticid,logname,logdescription,logcost) values(?,?,?,?)");
pst1.setString(1,lidseq);
pst1.setString(2,lname);
pst1.setString(3,des);
pst1.setString(4,"0");
int r1=pst1.executeUpdate();
if(r1==0)
out.println("insertion failure");
else
{%>
<jsp:forward page="addlogistic.html"></jsp:forward>
<%}
con.close();
con1.close();
%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","poojitha","poojitha");
String name=request.getParameter("mname");
String des=request.getParameter("des");
String cos=request.getParameter("cost");
String lname=request.getParameter("lname");
String mid=" ";
String midseq=" ";
String lid=" ";
int cost=0;
int pla=0;
int total=0;
Statement st2=con2.createStatement();
ResultSet rs2=st2.executeQuery("SELECT logisticid FROM logistic where logname='"+lname+"'");
if(rs2.next())
{
  lid=rs2.getString("logisticid");
  Statement st=con1.createStatement();
  ResultSet rs=st.executeQuery("SELECT midseq.NEXTVAL FROM DUAL");
  if(rs.next()){
   mid=rs.getString(1);
   midseq="MI"+mid;
  }
  else{
  out.println("wrong");
  }
  PreparedStatement pst=con.prepareStatement("insert into material values(?,?,?,?,?)");
  pst.setString(1,midseq);
  pst.setString(2,name);
  pst.setString(3,cos);
  pst.setString(4,lid);
  pst.setString(5,des);
  int r=pst.executeUpdate();
  Statement st1=con.createStatement();
  ResultSet rs1=st1.executeQuery("SELECT matprice FROM material where logisticid='"+lid+"'");
  while(rs1.next())
  {
    cost=cost+=rs1.getInt("matprice");
  }
  String pl="platemeal";
  Statement st3=con.createStatement();
  ResultSet rs3=st3.executeQuery("SELECT matprice FROM material where logisticid='"+lid+"' and matname='"+pl+"'");
  if(rs3.next())
  {
    pla=rs3.getInt("matprice");
  }
  total=cost-pla;
  String t = String.valueOf(total);
  PreparedStatement pst1=con2.prepareStatement("update logistic set logcost='"+t+"' where logisticid='"+lid+"'");
  int r1=pst1.executeUpdate();
  if(r==0 && r1==0)
  out.println("insertion failure");
  else
  {%>
  <jsp:forward page="addmaterial.html"></jsp:forward>
  <%}

}
else
{
  out.println("please enter valid logistic name");
}
con.close();
con1.close();
con2.close();
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@include file="setting.jsp"%>
<html><head>
<title>ORACLE</title>
</head>
<body>
<%


   String msgdb = "" ;
   Connection conndb = null;


%>

<br>
<CENTER>
<table width="720"  style="border: 1 solid #000000">

 <tr height=50 > 
   <td>

   <table width="100%" border=0>
     <tr><td width="200"><a href=oracle.jsp><img border="0" src="pic/oracle.gif"></A></td>
       <td width="300"></td>
       <td width="300"><a href=oracle.jsp><img border="0" src="pic/oracletab.gif"></A></td>
     </tr>
   </table>

   </td>
  </tr>

  <tr>
   <td>
   <br>
   <br>

   <CENTER><font color="#008000" size="4">ORACLE SERVERS STATUS</font></CENTER>
   <br><BR>
   <table width="100%"  cellspacing="0" cellpadding="0" border=0>
     









 <%
long c1,c2,c3;
int connected;


   for (int counter = 0; counter < instances.length; counter++) {
	  c1=System.currentTimeMillis();      
 
 try {
     Class.forName("oracle.jdbc.driver.OracleDriver");

     conndb = DriverManager.getConnection("jdbc:oracle:thin:@"+instances[counter][3]+":1521:"+instances[counter][4],instances[counter][1],instances[counter][2]);
	connected=1;
	} 

	  
  catch(Exception e)
	{ msgdb=e.getMessage(); 
	connected=0;
	}

     finally
        {
		      c2=System.currentTimeMillis();
			  c3=c2-c1;			
		//Clean up resources, close the connection.
		if(conndb != null) { 
		
		try { conndb.close();  
		
		} catch (Exception ignored) {}
		  }
		
		}   

	    out.print("<tr ><td><font size=7> "+(counter+1)+"</font><font size=4> Server: "+instances[counter][3]+" - Database: "+instances[counter][4]+"</tr><tr><td><font size=4>  "+instances[counter][0]+"</font></td></tr>");	
if (connected == 1) { out.print("<tr height=80 ><td td valign=top>Statuse <a href=details-db.jsp?db="+counter+"><font size=4 color=green>open - click here for detail  </font></a></td><td valign=top>"+c3+" MS");	}
else {	out.print("<tr height=80><td valign=top>Statuse  <font size=4 color=red>Unable To Connect   "+msgdb+" </font><br>"); }



	
	}


%>
     </tr>
   </table>
   
        </tr>
   </table>

</body></html>



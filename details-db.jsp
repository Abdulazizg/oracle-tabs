<%@ page contentType="text/html; charset=windows-1256" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@include file="setting.jsp"%>

<%

   String emsg2 = "" ;
   Connection conn2 = null;

   
Statement stmt1 = null;
Statement stmt2 = null;
Statement stmt3 = null;

ResultSet instance = null;
ResultSet datafile = null;
ResultSet ses = null;
ResultSet userses = null;

int dbid = Integer.parseInt(request.getParameter("db"));
String connection=instances[dbid][0];
String user=instances[dbid][1];
String password=instances[dbid][2];
String theinstance=instances[dbid][3];
String theserver=instances[dbid][4];
String thedoc=instances[dbid][5];





     Class.forName("oracle.jdbc.driver.OracleDriver");

 


  conn2 = DriverManager.getConnection("jdbc:oracle:thin:@"+instances[dbid][3]+":1521:"+instances[dbid][4],instances[dbid][1],instances[dbid][2]);

 

  stmt1 = conn2.createStatement();
  instance = stmt1.executeQuery("SELECT version,archiver FROM V$INSTANCE");
  stmt2 = conn2.createStatement();
  datafile = stmt2.executeQuery("select round(sum(bytes)/1000000,0) thesize from v$datafile");
  stmt3 = conn2.createStatement();
  userses = stmt3.executeQuery("select USERNAME,OSUSER,MACHINE,STATUS,floor(last_call_et / 60) \"Minutes\"  from v$session where  username is not null order by 5,4");


userses.next();  
instance.next();
datafile.next();

String thefile=instances[dbid][5];



%>

<html>
  <head>
	<title>database details</title>

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.js"></script>
	<script>
	$(document).ready(function() {
		$('.nav-tabs > li > a').click(function(event){
		event.preventDefault();//stop browser to take action for clicked anchor

		//get displaying tab content jQuery selector
		var active_tab_selector = $('.nav-tabs > li.active > a').attr('href');

		//find actived navigation and remove 'active' css
		var actived_nav = $('.nav-tabs > li.active');
		actived_nav.removeClass('active');

		//add 'active' css into clicked navigation
		$(this).parents('li').addClass('active');

		//hide displaying tab content
		$(active_tab_selector).removeClass('active');
		$(active_tab_selector).addClass('hide');

		//show target tab content
		var target_tab_selector = $(this).attr('href');
		$(target_tab_selector).removeClass('hide');
		$(target_tab_selector).addClass('active');
	     });
	  });
	</script>
		<style>
			/** Start: to style navigation tab **/
			.nav {
			  margin-bottom: 18px;
			  margin-left: 0;
			  list-style: none;
			}

			.nav > li > a {
			  display: block;
			}

			.nav-tabs{
			  *zoom: 1;
			}

			.nav-tabs:before,
			.nav-tabs:after {
			  display: table;
			  content: "";
			}

			.nav-tabs:after {
			  clear: both;
			}

			.nav-tabs > li {
			  float: left;
			}

			.nav-tabs > li > a {
			  padding-right: 12px;
			  padding-left: 12px;
			  margin-right: 2px;
			  line-height: 14px;
			}

			.nav-tabs {
			  border-bottom: 1px solid #ddd;
			}

			.nav-tabs > li {
			  margin-bottom: -1px;
			}

			.nav-tabs > li > a {
			  padding-top: 8px;
			  padding-bottom: 8px;
			  line-height: 18px;
			  border: 1px solid transparent;
			  -webkit-border-radius: 4px 4px 0 0;
				 -moz-border-radius: 4px 4px 0 0;
					  border-radius: 4px 4px 0 0;
			}

			.nav-tabs > li > a:hover {
			  border-color: #eeeeee #eeeeee #dddddd;
			}

			.nav-tabs > .active > a,
			.nav-tabs > .active > a:hover {
			  color: #555555;
			  cursor: default;
			  background-color: #ffffff;
			  border: 1px solid #ddd;
			  border-bottom-color: transparent;
			}

			li {
			  line-height: 18px;
			}

			.tab-content.active{
				display: block;
			}

			.tab-content.hide{
				display: none;
			}


			/** End: to style navigation tab **/
		</style>
	</head>
	<body>
<center>
	<table width="980"  style="border: 1 solid #000000">

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

   
	
		<div>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#tab1">General information</a>
				</li>
				<li>
					<a href="#tab2">Sessions</a>
				</li>
				<li>
					<a href="#tab3">Document</a>
				</li>
			</ul>
		</div>
		<section id="tab1" class="tab-content active">
			<div>
				<%@ include file="info.jsp"%>
			</div>
		</section>
		<section id="tab2" class="tab-content hide">
			<div>
			
				<%@ include file="sessions.jsp"%>

				
			</div>
		</section>
		<section id="tab3" class="tab-content hide">

				

<p>
<%=instances[dbid][6]%>
<%="<br />"%>
<jsp:include  page="<%=instances[dbid][5]%>" />

</p>









			
				
				
			</div>
		</section>
		
</td></tr></table>		
	</body>
</html>
<%

userses.close();
instance.close();
datafile.close();
stmt1.close();
stmt2.close();
stmt3.close();
conn2.close();

%>

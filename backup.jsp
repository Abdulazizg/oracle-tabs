<% 
int bk=0; 
  if (instances[dbid][7]=="Y") {
%>
<center> 
      <TABLE style="border-collapse: collapse" bordercolor=#A0A0A0 cellSpacing=0 cellPadding=0 width="100%" BORDER=1 >
        <TR><td colspan="6" bgcolor=#D7EAFF>Last backups</td></tr>
        <TR bgcolor="#D7EAFF"><td>#</td><td>INPUT_TYPE</td><td>Status</td><td>START_TIME</td><td>END_TIME</td><td>Min</td></tr>

<% 
while(thebackups.next()) { 
bk = bk +1;
%>
        <TR>
<td><%=bk%></td>
<td><%=thebackups.getString("INPUT_TYPE")%></td>
<td><%=thebackups.getString("STATUS")%></td>
<td><%=thebackups.getString("START_TIME")%></td>
<td><%=thebackups.getString("END_TIME")%></td>
<td><%=thebackups.getString("hrs")%></td>
</tr>
<% } %> 

      </table>	
</center>
<% } %>
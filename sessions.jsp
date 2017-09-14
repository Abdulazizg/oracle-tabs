<% 
int z=0;
%>
<center> 
      <TABLE style="border-collapse: collapse" bordercolor=#A0A0A0 cellSpacing=0 cellPadding=0 width="100%" BORDER=1 >
        <TR><td colspan="6" bgcolor=#D7EAFF>Current connections to these users</td></tr>
        <TR bgcolor="#D7EAFF"><td>#</td><td>DB user</td><td>OS user</td><td>Machine</td><td>Status</td><td>Minutes</td></tr>

<% 
while(userses.next()) { 
z = z +1;
%>
        <TR>
<td><%=z%></td>
<td><%=userses.getString("USERNAME")%></td>
<td><%=  userses.getString("OSUSER") != null ? userses.getString("OSUSER") : " - " %></td>
<td><%=userses.getString("MACHINE")%></td>
<td><%=userses.getString("STATUS")%></td>
<td><%=userses.getString("Minutes")%></td>
</tr>
<% } %> 

      </table>	
</center>

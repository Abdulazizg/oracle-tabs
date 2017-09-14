      <TABLE border=1 bordercolor=#A0A0A0 style="border-collapse: collapse" cellSpacing=0 cellPadding=0 width="40%">
        <TR><td  bgcolor=#A8D3FF colspan="2"><b>
Server : <%=instances[dbid][3]%>
<br>Database : <%=instances[dbid][4]%></b></td></tr>
        <TR><td width=40%>Database Version</td><td><%=instance.getString("version")%></td></tr>
        <TR><td width=40%>Archive Log</td><td><%=instance.getString("archiver")%></td></tr>
        <TR><td width=40%>Database size</td><td><%=datafile.getString("thesize")%> MB</td></tr>

      </table>	

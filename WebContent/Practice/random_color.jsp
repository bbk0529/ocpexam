<%@page import="controller.Read_Problem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    
<%
	Read_Problem rp = new Read_Problem();
	rp.read_file("C:\\1z0-053.txt");
	int no =1;
	//int startnum=1;
	int startnum=(int)((Math.random())*rp.getProblem().size())+1;
	
	
	
	try{
		startnum = Integer.parseInt(request.getParameter("startnum")); 
		
	} catch (Exception e) {}
	
	int endnum=startnum+no-1;
	if (startnum<1) startnum=1;
	if (endnum>rp.getProblem().size()-1) endnum=rp.getProblem().size()-1;
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ORACLE DATABASE 11g - OCP EXAM </title>
<style type="text/css">
	td {
		font-family:d2coding;
		padding:20px;
		margin:50px;
	}
	.style1 {font-size:1.5em;}
	.style2 {font-size:2.5em;color:rgb(240,240,240);height:5%;background-color:rgb(230,230,230);;!background-color:white;text-align:center;}
	.style3 {font-size:0.5em;color:white;height:1%;background-color:grey;!background-color:white;text-align:center;padding:0px;margin:0px;}
	
	a:link {text-decoration: none; color: grey;}
	a:visited {text-decoration: none; color: grey;}
	a:active {text-decoration: none; color: grey;}
	a:hover {text-decoration: none; color: black;}

</style>

</head>
<body>
<table width="100%" align="center" !style="table-layout:fixed">
<tr><td class="style2" colspan="2"></td><td></td></tr>
<tr>
<td align="left">
<%
if (startnum==1) %> <H1>PREVIOUS</H1> <% 
	else {%>
	<a href=order_color.jsp?startnum=<%=startnum-no%>><H1> PREVIOUS</H1></a>
	<%} %> 
</td>
<td align="left">
<%
if (endnum==rp.getProblem().size()) %> NEXT <% 
	else {%>
	<a href=order_color.jsp?startnum=<%=startnum+no%>><H1> NEXT</H1></a> 
	<%} %> 
</td>
</tr>
<tr><td class="style3" colspan="2"></td><td></td></tr>
<%for (int i=startnum;i<=endnum;i++) { %>
<tr>

<td id="problem"	class="style1"  width="100%" >
	<H3>QUESTION NO: <%=i%></H3>
	<%=rp.getProblem().get(i)%>
</td> 
<td class="style2" align="left" width="3%" style="word-break:break-all"> <%=rp.getAnswer().get(i)%>
</td> 
</tr>
<tr><td class="style3" colspan="2"></td><td></td></tr>
<% } %>
<tr>
<td align="left">
<%
if (startnum==1) %> PREVIOUS <% 
	else { %>
	<a href=order_color.jsp?startnum=<%=startnum-no%>><H1> PREVIOUS</H1></a>
	<%} %> 
</td>
<td align="left">
<%
if (endnum==rp.getProblem().size()) %> NEXT <% 
	else {%>
	<a href=order_color.jsp?startnum=<%=startnum+no%>><H1> NEXT</H1></a> 
	<%} %> 
</td>
</tr>
</table>
	
</body>
</html>
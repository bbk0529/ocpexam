<%@page import="controller.Read_Problem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    
<%
	Read_Problem rp = new Read_Problem();
	
	int no=25;
	int startnum=101;
	
	rp.read_file("C:\\1z0-053.txt");
	//int pick = (int) (Math.random() * rp.getList().size());
	int pick = (int)(Math.random()*no)+startnum;
	String problem = rp.getProblem().get(pick);

	String answer= rp.getAnswer().get(pick).replace("<br/>", " "); 
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ORACLE DATABASE 11g - OCP EXAM_RANDOM </title>
<style type="text/css">
	div {
		width:85%;
		font-family:d2coding;
		padding:10px;
		margin:50px;
		cursor:Pointer;
	}
	.style1 {font-size:1.5em;!position:absolute;top:5%;color:rgb(240,240,240);height:40%;background-color:rgba(0,220,0,0.1);}
	.style2 {font-size:2.5em;!position:absolute;bottom:5%;color:rgb(0,51,0);height:5%;background-color:rgb(0,51,0); !margin:40px;text-align:right;}
	.style3 {font-size:2.5em;position:absolute;bottom:0px;right:0px;display:none}
	

</style>
<script type="text/javascript">
	var answer_toggle=false; // 문제부분이 화면이 보이는지 여부
	function answer() {
				if (answer_toggle==true) { 
					document.getElementById("answer").style.color="rgb(0,51,0)";
				} else 	{ 
					document.getElementById("answer").style.color="white";
				} 
				answer_toggle=!answer_toggle;
	}  
</script>
</head>
<body bgcolor="BLACK">
	<div id="problem"	class="style1"  onClick="window.location.reload()"><H3>QUESTION NO: <%=pick%></H3> <%=problem%> <br/></div>
	<div id="answer"	class="style2"  onclick="answer()">	 <%=answer%>	</div>
	<div id="input" class = "style3"> <input type="text"  size="1" onkeydown="window.location.reload()" autofocus  style="background-color:BLACK;border: 0px BLACK;"/></div>
</body>
</html>
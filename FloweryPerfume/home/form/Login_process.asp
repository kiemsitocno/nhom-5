<!DOCTYPE HTML>

<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="cnn.asp" -->

<%
	var sesUser="";
	aName=Request("txtName");
	aPass=Request("txtPass");
	sesUser += aName
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT adName, adPass FROM Admin WHERE adName='" + aName + "' AND adPass='" + aPass + "'";
	rs.Open(sSQL,cnn);
	
	
%>
<body>
<%
	if (rs.EOF) {
		%>
		<h1>Bạn đã nhập sai username hoặc password</h1>
		<a href="/floweryperfume/index.asp">BACK</a>
		<%
	}else{
		Session("sUser") = sesUser;
		Response.Redirect("/floweryperfume/admin/index.asp");
	}
	
	rs.Close();
	cnn.Close();
	rs=null;
	cnn=null;
%>
</body>
<!DOCTYPE HTML>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../cnn.asp" -->
<% 
  if(Session("sUser")==null){
    Response.Redirect("/floweryperfume/home/form/Loginadmin.asp");
  }
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/font-awesome.css">
  <link rel="stylesheet" href="/FloweryPerfume/admin/style/style.css">
  <script src="http://localhost/FloweryPerfume/admin/style/jquery.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/bootstrap.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/w3.js"></script>
</head>

<body>
	
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- MENU -->

	<div w3-include-html="form/nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- DONG SAN PHAM-->
	<div w3-include-html="page/admininfo.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    
    
</body>
</html>
<script>
    function backdamin() {
      alert("SAU KHI NHẤN LOGOUT, BẠN CẦN THOÁT TRÌNH DUYỆT HOÀN TOÀN ĐỂ LOGOUT HOÀN TOÀN!!");
      window.location.assign("../index.asp")
    };
  </script>

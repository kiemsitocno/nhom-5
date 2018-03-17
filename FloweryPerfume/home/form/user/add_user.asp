<!DOCTYPE HTML>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../cnn.asp" -->

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

<%
	
	var sCName = Request("CN");
	var sCUsername = Request("CU");
	var sCPassword = Request("CPw");
	var sCPhone = Request("CP");
	var sCAddress = Request("CA");
	var sCSex = Request("CS");
	var sCEmail = Request("CE");
	
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	
	sSQL = "INSERT INTO Customer VALUES ('" + sCName + "','" + sCUsername + "','" + sCPassword + "','" + sCPhone + "','" + sCAddress + "','" + sCSex + "','" + sCEmail + "')";
									
	cnn.Execute(sSQL);
%>
<body>
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">BẠN ĐÃ ĐĂNG KÝ THÀNH CÔNG, MỜI ĐĂNG NHẬP LẠI</h4>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="backdamin()">OKE</button>
				</div>
			</div>
		</div>
	</div>
	<!-- phụ lục: script hiện popup -->
	<script>
		$(document).ready(function(){
			$("#mydelProduct").modal("show");
		});
		function backdamin() {
			window.location.assign("../../../index.asp")
		}
	</script>
</body>
</html>
<%
	cnn.Close();
	cnn=null;
%>

	

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

<!-- FILE THỰC HIỆN XÓA SẢN PHẨM -->
<!-- A. Nhận giá trị mã sản phẩm cần xóa từ form xóa trang showdelete.asp -->
<%
	var sCCode = Request("sCCodesu");
 	var sCName = Request("sCNamesu");
 	var sCUsername = Request("sCUsernamesu");
 	var sCPassword = Request("sCPasswordsu");
 	var sCPhone = Request("sCPhonesu");
 	var sCAddress = Request("sCAddresssu");
 	var sCSex = Request("sCSexsu");
 	var sCEmail = Request("sCEmailsu");
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	
	sSQL = "UPDATE Customer SET CName='" + sCName + "',CUsername='" + sCUsername + "',CPassword='" + sCPassword + "',CPhone='" + sCPhone + "',CAddress='" + sCAddress + "',CSex ='" + sCSex + "',CEmail ='" + sCEmail + "' WHERE CCode='" + sCCode + "'";
									
	cnn.Execute(sSQL);
%>
<!-- B. Popup thông báo nếu sản phẩm được thêm thành công -->
<body>
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">BẠN ĐÃ SỬA THÔNG TIN TÀI KHOẢN THÀNH CÔNG</h4>
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
			window.location.assign("../Loginuser.asp")
		}
	</script>
</body>
</html>
<%
	cnn.Close();
	cnn=null;
%>

	

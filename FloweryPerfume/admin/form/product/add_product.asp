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

<!-- FILE THỰC HIỆN THÊM SẢN PHẨM -->
<!-- A. Nhận giá trị từ form sản phẩm trang productshow.asp -->
<%
	var sProductName = Request("productName");
	var sManuCode = Request("MC");
	var sProductImage = Request("PI");
	var sPrice = Request("P");
	var sVolumetric = Request("ST");
	var sSex = Request("S");
	var sContent = Request("C");
	var sDateInput = Request("DI");
	
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	
	sSQL = "INSERT INTO Products VALUES ('" + sProductName + "','" + sManuCode + "','" + sProductImage + "','" + sPrice + "','" + sVolumetric + "','" + sSex + "','" + sContent + "',GETDATE())";
									
	cnn.Execute(sSQL);
%>
<!-- B. Popup thông báo nếu sản phẩm được thêm thành công -->
<body>
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">BẠN ĐÃ THÊM SẢN PHẨM THÀNH CÔNG</h4>
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
			window.location.assign("productshow.asp")
		}
	</script>
</body>
</html>
<%
	cnn.Close();
	cnn=null;
%>

	

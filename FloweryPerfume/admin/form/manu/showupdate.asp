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
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/style.css">
  <script src="http://localhost/FloweryPerfume/admin/style/jquery.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/bootstrap.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/w3.js"></script>
  <style>
  	.canhbao {
			color: red !important;
		}
  </style>
</head>



<body>
	<!-- FORM SỬA SẢN PHẨM -->
	<!-- A. Popup hiện thông tin sản phẩm cần sửa -->
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Bảng sửa hãng</h4>
				</div>
				<div class="modal-body">
					<h4 class="">Không được bỏ trống bất kỳ ô nào</h4>
					<form role="form" action="edit_product.asp" onsubmit="return validateForm()" method="post">
						<!-- A.I Thông tin sản phẩm được xuất ra từ SQL, dựa vào mã sản phẩm được truyền từ mục productshow.asp(mục B.III.1.) -->
						<!-- Phần này thực hiên 2 công việc: 1 là lấy mã sản phẩm từ mục productshow.asp(mục B.III.1) -->
						<!-- 								 2 là truyền dữ liệu từ trang này qua file edit_product.asp -->
						<%
							var sMCode = Request("sManuCode");
							var sMName = "";
							var sMPhone = "";
							var sMAdd = "";
							var sMCoun = "";
							var sMEmail = "";
							var sMWeb = "";
							var sMHead = "";
							if(sMCode !=""){
								cnn=Server.CreateObject("ADODB.Connection");
								cnn.Open(cStr);
								rs=Server.CreateObject("ADODB.Recordset");
								sSQL = "SELECT ManuCode, ManuName, ManuPhone, ManuAddress, ManuCountry, ManuEmail, ManuWebsite, ManuLogo, ManuHead FROM Manufactuter WHERE ManuCode = '" + sMCode + "'";
								rs.Open(sSQL, cnn);
									var sMCode=rs.Fields.Item("ManuCode").Value;
									var sMName=rs.Fields.Item("ManuName").Value; 
									var sMPhone=rs.Fields.Item("ManuPhone").Value; 
									var sMAdd=rs.Fields.Item("ManuAddress").Value;
									var sMCoun=rs.Fields.Item("ManuCountry").Value;
									var sMEmail=rs.Fields.Item("ManuEmail").Value; 
									var sMWeb=rs.Fields.Item("ManuWebsite").Value;
									var sMHead=rs.Fields.Item("ManuHead").Value;		
							}
						%>
						<div class="form-group">
							<label for="">Mã hãng(*):</label>
							<input id="disabledInput" type="text" class="form-control" id="" value="<%=sMCode%>" disabled>
							<input type="hidden"  name="sMCodeu" value="<%=sMCode%>">
						</div>
						<div class="form-group">
							<label for="">Tên hãng(*):</label>
							<input name="sMNameu" type="text" class="form-control" id="name" value="<%=sMName%>">
							<p class="canhbao" id="namet"></p>
						</div>
						<div class="form-group">
							<label for="">Số điện thoại(*):</label>
							<input name="sMPhoneu" type="text" class="form-control" id="phone" value="<%=sMPhone%>">
							<p class="canhbao" id="phonet"></p>
						</div>
						<div class="form-group">
							<label for="">Địa chỉ:</label>
							<input name="sMAddu" type="text" class="form-control" id="add" value="<%=sMAdd%>">
							<p class="canhbao" id="addt"></p>
						</div>
						<div class="form-group">
							<label for="">Quốc gia(*):</label>
							<input name="sMCounu" type="text" class="form-control" id="qg" value="<%=sMCoun%>">
							<p class="canhbao" id="qgt"></p>
						</div>
						<div class="form-group">
							<label for="">Email(*):</label>
							<input name="sMEmailu" type="text" class="form-control" id="email" value="<%=sMEmail%>">
							<p class="canhbao" id="emailt"></p>
						</div>
						<div class="form-group">
							<label for="">Website(*):</label>
							<input name="sMWebu" type="text" class="form-control" id="web" value="<%=sMWeb%>">
							<p class="canhbao" id="webt"></p>
						</div>
						<div class="form-group">
							<label for="">Trụ sở chính(*):</label>
							<input name="sMHeadu" type="text" class="form-control" id="head" value="<%=sMHead%>">
							<p class="canhbao" id="headt"></p>
						</div>
						
						
						<div class="checkbox">
						<label>
							<input class="add-confirm" type="checkbox"> Có đồng ý sửa hãng này không ?
						</label>
						</div>
						<button type="submit" class="btnAdd btn btn-default">Đồng ý</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="backdamin()">Hủy</button>
				</div>
			</div>
		</div>
	</div>
	<!-- phụ lục: script hiện popup -->
	
</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
<script>
	<!-- phụ lục: script hiện popup -->
	$(document).ready(function(){
		$("#mydelProduct").modal("show");
		$('.btnAdd').prop('disabled', true);

		$(".add-confirm").change(function() {
		    if(this.checked) {
		        $('.btnAdd').prop('disabled', false);
		    }else{
		    	$('.btnAdd').prop('disabled', true);
		    }
		});
	});
	function backdamin() {
		window.location.assign("manushow.asp")
	}
	function validateForm()
			{
			    // Bước 1: Lấy giá trị của username và password
			    var name = document.getElementById('name').value;
				    var a = name.indexOf(" ");
			 	var phone = document.getElementById('phone').value;
    				var b = /^0[0-9-+]+$/;
    			var qg = document.getElementById('qg').value;
    				var c = qg.indexOf(" ");
    			var email = document.getElementById('email').value;
    				var d = email.indexOf(" ");
    				var da = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    			var add = document.getElementById('add').value;
    				var e = add.indexOf(" ");
    			var head = document.getElementById('head').value;
    				var f = head.indexOf(" ");
    			var web = document.getElementById('web').value;
    				var g = web.indexOf(" ");
    				var ga = /^([\w-\.]+)((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    if (a == 0 || name.length<1) {
			        document.getElementById("namet").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
			        document.getElementById("name").focus();
			        return false;
			    }else if (!b.test(phone) || phone.length<10 || phone.length>11) {
			        document.getElementById("phonet").innerHTML = "Số điện thoại phải bắt đầu bằng số 0 và phải đủ 10 hoặc 11 số";
			        document.getElementById("phone").focus();
			        return false;
			    }else if (c == 0 || qg.length<1) {
			        document.getElementById("qgt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
			        document.getElementById("qg").focus();
			        return false;
			    }else if (d == 0 || email.length<1 || !da.test(email)) {
			        document.getElementById("emailt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống, phải có ký tự @ và dấu chấm";
			        document.getElementById("email").focus();
			        return false;
			    }else if (e == 0 || add.length<1) {
			        document.getElementById("addt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
			        document.getElementById("add").focus();
			        return false;
			    }else if (f == 0 || head.length<1) {
			        document.getElementById("headt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
			        document.getElementById("head").focus();
			        return false;
			    }else if (g == 0 || web.length<1 || !ga.test(web)) {
			        document.getElementById("webt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống, website phải có dấu chấm!";
			        document.getElementById("web").focus();
			        return false;
			    }else{
			        alert('Dữ liệu hợp lệ');
			        return true;
			    }
			};
</script>

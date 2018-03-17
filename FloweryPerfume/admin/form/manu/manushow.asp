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
		.cot {
			height: 60px !important;
		}
		.cot2 {
			height: 100px !important;
		}
		.canhbao {
			color: red !important;
		}
	</style>
</head>

<%
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT * FROM Manufactuter";
	rs.Open(sSQL, cnn);
%>

<body>
	<!-- FILE NÀY LÀ FILE CHÍNH -->
	<!-- A. Header và menu-->
	<div w3-include-html="../nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
	<!-- B. Phần thân-->
	<div class="container"> 
		<div class="jumbotron">
			<button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#myaddManu">Thêm Hãng</button>
			<div id="myaddManu" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h4 class="modal-title">Bảng Thêm Hãng Sản Xuất</h4>
						</div>
						<div class="modal-body">
							<h4 class="">Không được bỏ trống bất kỳ ô nào</h4>
							<form role="form" action="add_manu.asp" onsubmit="return validateForm()" method="post">
							<div class="form-group">
								<label for="">Tên hãng(*):</label>
								<input type="text" name="TH" class="form-control" id="name" placeholder="">
								<p class="canhbao" id="namet"></p>
							</div>
							<div class="form-group">
								<label for="">Số điện thoại(*):</label>
								<input type="text" name="SDT" class="form-control" id="phone" placeholder="">
								<p class="canhbao" id="phonet"></p>
							</div>
							<div class="form-group">
								<label for="">Quốc gia(*):</label>
								<input type="text" name="QG" class="form-control" id="qg" placeholder="">
								<p class="canhbao" id="qgt"></p>
							</div>
							<div class="form-group">
								<label for="">Email(*):</label>
								<input type="text" name="Email" class="form-control" id="email" placeholder="">
								<p class="canhbao" id="emailt"></p>
							</div>
							<div class="form-group">
								<label for="">Địa chỉ(*):</label>
								<input type="text" name="Add" class="form-control" id="add" placeholder="">
								<p class="canhbao" id="addt"></p>
							</div>
							<div class="form-group">
								<label for="">Trụ sở chính(*):</label>
								<input type="text" name="Head" class="form-control" id="head" placeholder="">
								<p class="canhbao" id="headt"></p>
							</div>
							<div class="form-group">
								<label for="">Website(*):</label>
								<input type="text" name="Web" class="form-control" id="web" placeholder="">
								<p class="canhbao" id="webt"></p>
							</div>
							<div class="checkbox">
								<label>
									<input class="add-confirm" type="checkbox"> Có đồng ý thêm mới hãng này không ?
								</label>
							</div>
							<button type="submit" class="btnAdd btn btn-default">Đồng ý</button>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
						</div>
					</div>
				</div>
			</div>
			<!-- B.II. Phần show hãng -->
			<h2 class="text-center">Thông tin tất cả hãng sản xuất</h2>
			<hr>
			<div class="row">
				<div class="col-md-9">
					<table class="table table-striped table-hover table-bordered">
						<tr>
							<th class="cot2">Mã hãng</th>
							<th class="cot2">Tên hãng</th>
							<th class="cot2">Số điện thoại</th>
							<th class="cot2">Địa chỉ</th>
							<th class="cot2">Quốc gia</th>
							<th class="cot2">Email</th>
						</tr>
						<%
							var  index=0;
							rs.MoveFirst();
							while(!rs.EOF){
							index ++;
								var sManuCode=rs.Fields.Item("ManuCode").Value;
								var sManuName=rs.Fields.Item("ManuName").Value;
								var sManuPhone=rs.Fields.Item("ManuPhone").Value;
								var sManuAddress=rs.Fields.Item("ManuAddress").Value;
								var sManuCountry=rs.Fields.Item("ManuCountry").Value;
								var sManuEmail=rs.Fields.Item("ManuEmail").Value;
						%>
						<tr>
							<td class="cot"> <%=sManuCode%> </td>
							<td class="cot"> <%=sManuName%> </td>
							<td class="cot"> <%=sManuPhone%> </td>
							<td class="cot"> <%=sManuAddress%> </td>
							<td class="cot"> <%=sManuCountry%> </td>
							<td class="cot"> <%=sManuEmail%> </td>
						</tr>
						<%
							rs.MoveNext();
							}
						%>
					</table>
				</div>
				<!-- B.III. Các Chức năng -->
				<div class="col-md-3">
					<table class="table table-striped table-hover table-bordered">
						<tr class="cot2">
							<th class="">Option</th>
						</tr>
						<%
							var  index=0;
							rs.MoveFirst();
							while(!rs.EOF){
								index ++;
								var sManuCode=rs.Fields.Item("ManuCode").Value;
						%>
						<tr>
							<!-- B.III.1 Chức năng Sửa Sản Phẩm -->
							<td class="cot">
								<form action="showupdate.asp">
									<button type="submit" name="sManuCode" class="btn btn-default btn-sm" value="<%=sManuCode%>">Sửa</button>
								</form>
							</td>
							<!-- B.III.2 Chức năng Xóa Sản Phẩm -->
							<td class="cot">
								<form action="showdelete.asp">
									<button type="submit" name="sManuCode" class="btn btn-default btn-sm" value="<%=sManuCode%>">Xóa</button>
								</form>
							</td>
						</tr>
						<%
							rs.MoveNext();
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div w3-include-html="footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
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
			window.location.assign("../../../index.asp")
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

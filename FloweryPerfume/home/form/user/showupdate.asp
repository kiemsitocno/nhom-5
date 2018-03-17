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
   <style>
    .canhbao {
      color: red !important;
    }
  </style>
</head>


<body>
	<div id="mydelProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"></button>
					<h4 class="modal-title">Bảng Sửa Thông Tin Cá Nhân</h4>
				</div>
				<div class="modal-body">
					<h4 class="">Không được bỏ trống bất kỳ ô nào</h4>
					<form role="form" action="edit_product.asp" onsubmit="return validateForm()">
						<%
							var sCCodes = Request("sCCode");
			             	var sCName = "";
			             	var sCUsername = "";
			             	var sCPassword = "";
			             	var sCPhone = "";
			             	var sCAddress = "";
			             	var sCSex = "";
			             	var sCEmail = "";
			             	if(sCCodes !=""){
								cnn=Server.CreateObject("ADODB.Connection");
								cnn.Open(cStr);
								rs=Server.CreateObject("ADODB.Recordset");
								sSQL = "SELECT * FROM Customer WHERE CCode = '" + sCCodes + "'";
								rs.Open(sSQL, cnn);
									var sCCodes=rs.Fields.Item("CCode").Value;
					             	var sCNames=rs.Fields.Item("CName").Value;
					             	var sCUsernames=rs.Fields.Item("CUsername").Value;
					             	var sCPasswords=rs.Fields.Item("CPassword").Value;
					             	var sCPhones=rs.Fields.Item("CPhone").Value;
					             	var sCAddresss=rs.Fields.Item("CAddress").Value;
					             	var sCSexs=rs.Fields.Item("CSex").Value;
					             	var sCEmails=rs.Fields.Item("CEmail").Value;
					             }	
							
						%>
						<div class="form-group">
							<label for="">Mã thành viên:</label>
							<input id="disabledInput" type="text" class="form-control" value="<%=sCCodes%>" disabled>
							<input type="hidden"  name="sCCodesu" value="<%=sCCodes%>">
						</div>
						<div class="form-group">
							<label for="">Họ tên:</label>
							<input name="sCNamesu" type="text" class="form-control" id="name" value="<%=sCNames%>">
							<p class="canhbao" id="namet"></p>
						</div>
						<div class="form-group">
							<label for="">Username:</label>
							<input id="disabledInput" type="text" class="form-control" value="<%=sCUsernames%>" disabled>
							<input type="hidden" name="sCUsernamesu" value="<%=sCUsernames%>">
						</div>
						<div class="form-group">
							<label for="">Password:</label>
							<input name="sCPasswordsu" type="Password" class="form-control" id="pass">
						</div>
						<div class="form-group">
                            <label for="RegPassword">Re Password</label>
                            <input type="password" class="form-control" id="repass" required>
                            <p class="canhbao" id="repasst"></p>
                      </div>
						<div class="form-group">
							<label for="">Số Điện thoại:</label>
							<input name="sCPhonesu" type="text" class="form-control" id="phone" value="<%=sCPhones%>">
							<p class="canhbao" id="phonet"></p>
						</div>
						<div class="form-group">
							<label for="">Địa chỉ:</label>
							<input name="sCAddresssu" type="text" class="form-control" id="add" value="<%=sCAddresss%>">
							<p class="canhbao" id="addt"></p>
						</div>
						<div class="form-group">
							<label for="">Email:</label>
							<input name="sCEmailsu" type="email" class="form-control" id="email" value="<%=sCEmails%>">
							<p class="canhbao" id="emailt"></p>
						</div>
						 <div class="form-group">
							<label for="">Giới tính:</label>
							<label class="radio-inline">
								<input name="sCSexsu" type="radio" value="Nam" checked> Nam
							</label>
							<label class="radio-inline">
								<input name="sCSexsu" type="radio" value="Nu"> Nữ
							</label>
						</div>
						<div class="checkbox">
							<label>
								<input class="add-confirm" type="checkbox"> Có đồng ý sửa thông tin tài khoản này ?
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

</body>
</html>
<%
	rs.Close();
	cnn.Close();
	cnn=null;
%>
<script>
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
    window.location.assign("../../../index.asp");
  }
  function validateForm()
  {
      // Bước 1: Lấy giá trị của username và password
      var name = document.getElementById('name').value;
        var a = name.indexOf(" ");
      var phone = document.getElementById('phone').value;
        var b = /^0[0-9-+]+$/;
      var email = document.getElementById('email').value;
        var d = email.indexOf(" ");
        var da = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      var add = document.getElementById('add').value;
        var e = add.indexOf(" ");
      var pass = document.getElementById('pass').value;
      var repass = document.getElementById('repass').value;
      if (a == 0 || name.length<1) {
          document.getElementById("namet").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
          document.getElementById("name").focus();
          return false;
      }else if (!b.test(phone) || phone.length<10 || phone.length>11) {
          document.getElementById("phonet").innerHTML = "Số điện thoại phải bắt đầu bằng số 0 và phải đủ 10 hoặc 11 số";
          document.getElementById("phone").focus();
          return false;
      }else if (d == 0 || email.length<1 || !da.test(email)) {
          document.getElementById("emailt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống, phải có ký tự @ và dấu chấm";
          document.getElementById("email").focus();
          return false;
      }else if (e == 0 || add.length<1) {
          document.getElementById("addt").innerHTML = "Không được bắt đầu bằng khoảng trắng và không bỏ trống!";
          document.getElementById("add").focus();
          return false;
      }else if (repass != pass || pass.length>10) {
          document.getElementById("repasst").innerHTML = "bạn cần nhập mật khẩu mới được thực hiện chỉnh sửa và nhập lại mật khẩu cho đúng";
          return false;
      }else{
          alert('Dữ liệu hợp lệ');
          return true;
      }
  };
</script>

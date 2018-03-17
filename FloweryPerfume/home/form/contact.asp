<!DOCTYPE HTML>

<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
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
	
   

	<div w3-include-html="nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
	<div class="container"> 
    	<div class="jumbotron">
			
					<div class="panel panel-primary">
						<div class="panel-heading">Thông Tin Liên Hệ</div>
							<div class="panel-body">
								<ul class="list-group">
								  <li class="list-group-item">Tên Chủ Cửa hàng: Công Ty TNHH Cát Trung Vũ</li>
								  <li class="list-group-item">Số điện thoại:(08) 3777999</li>
								  <li class="list-group-item">Email: cattrungvu@gmail.com</li>
								  <li class="list-group-item">Địa chỉ: 9/3 Thảo Điền, Quận 2, Tp. Hồ Chí Minh</li>
								</ul>
							</div>
    				</div>
    	</div>
   	</div>
    <div w3-include-html="footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>

	<script>
      function Redirect() {
         window.location.assign("Loginuser.asp");
      };
       function Redirecta() {
         window.location.assign("Loginadmin.asp");
      };
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
          var username = document.getElementById('username').value;
            var f = username.indexOf(" ");
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
          }else if (f > 1 || username.length<1 || username.length>10) {
              document.getElementById("usernamet").innerHTML = "Không có bất kỳ khoảng trắng nào và không bỏ trống! không được nhiều hơn 10 ký tự";
              document.getElementById("username").focus();
              return false;
          }else if (repass != pass || pass.length<1 || pass.length>10) {
              document.getElementById("repasst").innerHTML = "nhập lại mật khẩu không đúng, hoặc bạn đã nhập mật khẩu lớn hơn 10 và nhỏ hơn 1";
              document.getElementById("pass").focus();
              return false;
          }else{
              alert('Dữ liệu hợp lệ');
              return true;
          }
      };
  	</script>
</body>
</html>






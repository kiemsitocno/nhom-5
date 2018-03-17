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
        	<h2 class="text-center">Giới thiệu</h2>
            <hr>
        	<p>Mùi hương cũng là mùi của kỉ niệm, thế nên dù thời gian có quá đi, con người rồi có thay đổi nhưng khi chợt nhớ về một con người nào đó vốn đã mất dần trong quá khứ, người ta hẳn sẽ nghĩ ngay đến mùi hương đọng lại ở những nơi người đó đi qua. Do đó ngày nay kinh doanh nước hoa đã và đang mang lại nguồn lợi lớn cho nhiều người.
			Cửa hàng nước hoa, mỹ phẩm thường gây khó khăn cho người quản lý vì một số đặc thù sau:</p>
			<ul>
			<li><p>Khó khăn trong việc quản lý nhân viên và tiền bạc. Không kiểm soát được rõ ràng và chi tiết các khoản tiền thu chi cuối ngày.<p></li>
			<li><p>Khó khăn trong việc tìm kiếm hóa đơn của khách hàng khi được yêu cầu.<p></li>
			<li><p>Khó khăn trong việc quản lý hàng hóa. Không kiểm soát được mặt hàng nào bán chạy, mặt hàng nào ế. Do không thể dự đoán chính xác sức tiêu thụ sản phẩm trong các cửa hàng. Cho nên chắc chắn một số loại sản phẩm sẽ bị tồn kho quá lâu, rồi phải bán tháo khiến giảm lợi nhuận. Hoặc một số loại sản phẩm sẽ tiêu thụ nhanh, khiến trong kho hết hàng khi khách yêu cầu đặt mua và cửa hàng không thể kiếm loại hàng kịp thời gây mất uy tín của cửa hàng.<p></li>
			</ul>
			<p>Giá trị của các mặt hàng này thường rất lớn nhưng kích thước lại nhỏ nên rất dễ bị mất mát và gây thiệt hại lớn. Việc sử dụng phần mềm nói chung và phần mềm quản lý cửa hàng nước hoa chuyên biệt sẽ giúp chủ cửa hàng hạn chế được rủi ro đó.</p>
			<p>Vì vậy, chúng em thực hiện đồ án “XÂY DỰNG WEBSITE BÁN NƯỚC HOA QUA MẠNG” cho một cửa hàng bán nước hoa.</p>
			<p>Việc cửa hàng bán hàng thông qua website sẽ mang lại nhiều lợi ích:</p>
			<ul>
			<li><p>Loại bỏ những khó khăn đặc thù đã nêu ở trên.<p></li>
			<li><p>Giảm thiểu chi phí và vốn như mặt bằng, nhân viên.<p></li>
			<li><p>Sự linh hoạt thời gian làm việc cho chủ cửa hàng.<p></li>
			<li><p>Giảm quá trình mua sắm cho khách hàng.<p></li>
			</ul>
			<p>Người chủ cửa hàng đưa các thông tin sản phẩm cần bán lên website của mình và quản lý sản phẩm bằng website đó. Khách hàng có thể đặt mua hàng trên website mà không cần đến cửa hàng. Chủ cửa hàng sẽ gửi sản phẩm cho khách hàng khi nhận được tiền.</p>
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




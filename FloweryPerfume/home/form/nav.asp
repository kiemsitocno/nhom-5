<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="cnn.asp" -->
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
<div class="header">
    	<div class="container">
            <nav class="navbar navbar-default">
                <div class="nav-header">
                    <h1>Flowery Perfume</h1>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li><a class="navbar-brand" href="/floweryperfume/index.asp">Trang Chủ</a></li>
                        <li><a class="navbar-brand" href="/floweryperfume/home/form/about.asp">Giới Thiệu</a></li>
						            <li><a class="navbar-brand" href="/floweryperfume/home/form/product/productshow.asp?search=">Sản Phẩm</a></li>
                        
                        <li><a class="navbar-brand" href="/floweryperfume/home/form/contact.asp">Liên Hệ</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <button type="button" class="btn btn-default btn-md glyphicon glyphicon-user" data-toggle="modal" data-target="#mySignUp"> SignUp</button>
                            <div id="mySignUp" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                          <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"></button>
                                                <h4 class="modal-title">Bảng Đăng Ký</h4>
                                          </div>
                                          <div class="modal-body">
                                          <h4 class="">Không được bỏ trống bất kỳ ô nào</h4>
                                                <form role="form" action="/floweryperfume/home/form/user/add_user.asp" onsubmit="return validateForm()">
                                                      <div class="form-group">
                                                            <label for="RegUserName">User Name</label>
                                                            <input name="CU" type="text" class="form-control" id="username">
                                                            <p class="canhbao" id="usernamet"></p>
                                                      </div>
                                                      <div class="form-group">
                                                            <label for="RegPassword">Password</label>
                                                            <input name="CPw" type="password" class="form-control" id="pass" required>
                                                            <p class="canhbao" id="passt"></p>
                                                      </div>
													                           <div class="form-group">
                                                            <label for="RegPassword">Re Password</label>
                                                            <input type="password" class="form-control" id="repass" required>
                                                            <p class="canhbao" id="repasst"></p>
                                                      </div>
													                           <div class="form-group">
                                                            <label for="RegUserName">Họ Tên</label>
                                                            <input name="CN" type="text" class="form-control" id="name">
                                                            <p class="canhbao" id="namet"></p>
                                                      </div>
                                                       <div class="form-group">
                                                            <label for="RegUserName">Số điện thoại</label>
                                                            <input name="CP" type="text" class="form-control" id="phone">
                                                            <p class="canhbao" id="phonet"></p>
                                                      </div>
                                                      <div class="form-group">
                                                            <label for="RegUserName">Địa chỉ</label>
                                                            <input name="CA" type="text" class="form-control" id="add">
                                                            <p class="canhbao" id="addt"></p>
                                                      </div>
                                                      <div class="form-group">
                                                            <label for="RegUserName">Email</label>
                                                            <input name="CE" type="text" class="form-control" id="email">
                                                            <p class="canhbao" id="emailt"></p>
                                                      </div>
                                                       <div class="form-group">
                                                            <label for="">Giới tính:</label>
                                                            <label class="radio-inline">
                                                              <input name="CS" type="radio" value="Nam" checked> Nam
                                                            </label>
                                                            <label class="radio-inline">
                                                              <input name="CS" type="radio" value="Nu"> Nữ
                                                            </label>
                                                            </div>
                                                      <div class="form-group">
                                                        <label for="">Khách đăng ký tài khoản cần tuân thủ nghiêm ngặt nội quy dưới đây, mọi tài khoản vị phạm sẽ bị xóa tài khoản vĩnh viễn mà không báo trước:</label>
                                                        <ol>
                                                          <li>Tất cả các thành viền đều phải sử dụng đầy đủ, nghiêm túc và chính xác các thông tin cá nhân. Sử dụng thông tin cá nhân không nghiêm túc, giả mạo.. sẽ lập tức bị xóa tài khoản mà không cần báo trước</li>
                                                          <li>Tên thành viên, UserName không mang tính đồi trụy, quảng cáo, không phù hợp với thuần phong mỹ tục, mang tính đả kích đến chính trị, tôn giáo</li>
                                                          <li>1 người chỉ lập 1 tài khoản, nếu bị phát hiện 2 tài khoản cùng 1 người, thì sẽ bị xóa cả 2 tài khoản</li>
                                                        </ol>
                                                      </div>
                        													<div class="checkbox">
                                                    <label>
                                                      <input class="add-confirm" type="checkbox"> Bạn đã đọc kỹ nội quy ở trên chưa ? (Mọi vi phạm sẽ bị xóa tài khoản mà không cần báo trước)
                                                    </label>
                                                  </div>	
                                                      <button type="submit" class="btnAdd btn btn-default">Đăng ký</button>
                                                </form>
                                          </div>
                                          <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy Đăng Ký</button>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                         <li>
                            <button type="button" class="btn btn-default btn-md glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myLogin"> Login</button>
                            <div id="myLogin" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                          <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"></button>
                                                <h4 class="modal-title">Bảng Lựa Chọn Đăng Nhập</h4>
                                          </div>
                                          <div class="modal-body">
                                                <form role="form" action="/floweryperfume/home/form/Loginuser.asp" name="myForm" id="myForm">
                                                      <div class="form-group">
                                                            <button type="button" class="btn btn-default" onclick="Redirecta();">Đăng nhập dưới quyền Admin</button>
                                                      </div>
                                                      <div class="form-group">
                                                            <button type="button" class="btn btn-default" onclick="Redirect();">Đăng nhập dưới quyền Thành viên</button>
                                                      </div>
                                                      

                                                </form>
                                          </div>
                                          <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </li>
    				</ul>
                </div>
            </nav>
    	</div>

    </div>

    </body>
</html>
  

<!DOCTYPE HTML>
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
</head>



<body>
  <!-- FORM SỬA SẢN PHẨM -->
  <!-- A. Popup hiện thông tin sản phẩm cần sửa -->
  <div id="myLogin" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Form Login-->
                                    <div class="modal-content">
                                          <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"></button>
                                                <h4 class="modal-title">Bảng Đăng Nhập</h4>
                                          </div>
                                          <div class="modal-body">
                                                <form role="form" action="Loginuser_process.asp" name="myForm" id="myForm" onsubmit="return validateForm()" method="post">
                                                      <div class="form-group">
                                                            <label for="UserName">User Name</label>
                                                            <input name="txtName" type="text" class="form-control" placeholder="User Name">
                                                      </div>
                                                      <div class="form-group">
                                                            <label for="Password">Password</label>
                                                            <input name="txtPass" type="password" class="form-control" id="Password" placeholder="Password">
                                                      </div>
                                                      <div class="checkbox">
                                                            <label>
                                                              <input class="add-confirm" type="checkbox"> Đồng ý đăng nhập
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

<script>
  <!-- phụ lục: script hiện popup -->
  $(document).ready(function(){
    $("#myLogin").modal("show");
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
    window.location.assign("../../index.asp");
  }
</script>

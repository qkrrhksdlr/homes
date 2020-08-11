
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="admin/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        
        
        
        
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>
        
        
        
        
        
        
        
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">Start Bootstrap</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Settings</a>
                        <a class="dropdown-item" href="#">Activity Log</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>                                       
                                        매매 실거래 가격 추이
                                    </div>
                                    <div class="card-body">
                                    
                           </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        전세 실거래 가격 추이
                                    </div>
                                    <div class="card-body">
                           <canvas id="chart2" width="100%" height="40"></canvas>
                           </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                       
                       <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        Area Chart Example
                                    </div>
                                 <table width="100%" border=1>
                              <tr>
                                 <td id="mchart"></td>
                              </tr>
                              
                           </table>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        Bar Chart Example
                                    </div>
                           <table>
                              <tr>
                                 <td id="zwchart"></td>
                              </tr>
                           </table>
                                </div>
                            </div>
                        </div>
                        


 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                   건물 상세정보
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      
                   
                                            

<script>

/* 매매차트 */
$.ajax({
     url : "/aptmchart.do",
     method : "GET",  
     contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
     data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
     dataType : "json",  
     success : function(jsonObjList){
        var aptConym = [];   
        var aptPrice = []; 
        
        $.map(jsonObjList, function(vv, i){
              aptConym.push(vv.conym);
              aptPrice.push(vv.price);
           })
       
        printMLinearChart(aptConym, aptPrice);
     }
});      

function printMLinearChart(aptConym, aptPrice) {   
   var chart = c3.generate({

      bindto: "#mchart",
       data: {   
          json:{
             x: aptConym,
             매매: aptPrice
          },
         x:'x',
          type : 'line'
          },
       grid: { x: {show: false}, y: { show: true}},
       size: {height: 200, width: 800}
   });

}

/* 전월세 차트 */
$.ajax({
     url : "/aptzwchart.do",
     method : "GET",  
     contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
     data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
     dataType : "json",  
     success : function(jsonObjList){ 
        var aptConym = [];   
        var aptDeposit = []; 
        $.map(jsonObjList, function(vv, i){
              aptConym.push(vv.conym);
              aptDeposit.push(vv.deposit);

           })

        printZWLinearChart(aptConym, aptDeposit);
     }
});      


function printZWLinearChart(aptConym, aptDeposit) {
   var chart = c3.generate({
      bindto: "#zwchart",
       data: {   
          json:{
             x: aptConym,
             전세: aptDeposit
          },
         x:'x',
          type : 'line'
          },
       grid: { x: {show: false}, y: { show: true}},
       size: {height: 200, width: 800}
   });
}

</script>




<script>
$(document).ready(function(){
   //text형태로 보내고 json으로 받는 케이스 -> 가장 일반적
   $("#btn_id_text").click(function(){ 
      $.ajax({
           url : "/aptview.do",
           method : "GET",  //"POST", "GET",  v1.9.0.이전에는 type
           contentType : 'application/x-www-form-urlencoded; charset=UTF-8',   //요청한글처리, 기본은 그냥 String 
           data : "aptStr="+aptStr+"&areaStr="+areaStr,   //k1=v1 & k2=v2
           dataType : "json",          //서버로부터 오는 응답 xml, json, script, html (아무것도 지정하지 않으면 text나 list가 온다)
           success : function(resultObject) {   //화면리로딩없이 결과띄워라 (resultkkk=콜백결과)
              console.log(resultObject);

                var str = "";
                
                $.map(resultObject, function(kkk,i) { 
                    console.log(kkk.apt);
                    str += kkk.apt + "<br>";
                });
                
                
//                $("#resdiv").html(resultObject[0]["pharmName"]);
                $("#resdiv").html(str);

           }
      });
   }); 
   
   
});   
</script>

   <tr>
      <td><b>단지명</td>
      <td><b>전용면적(㎡)</td>
      <td>도로명 주소</td>
      <td>법정동</td>
      <td>계약년월</td>
      <td>계약금액</td>
      <td>준공년도</td>
   </tr>

<!-- MYLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${APTVIEWKKK}" var="voo">
   <tr>
        <td>${voo.apt}</td>
        <td>${voo.area}㎡</td>
      <td>${voo.gu} ${vo.street}</td>
      <td>${voo.dong}</td>
      <td>${voo.conym}</td>
      <td>${voo.price}</td>
      <td>${voo.archyear}</td>
   </tr>   
</c:forEach>

                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                         <!--  </tbody> -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
                
                <!--Start Content-->
      <div id="content" class="col-xs-12 col-sm-10">
         <div class="preloader">
            <img src="img/devoops_getdata.gif" class="devoops-getdata" alt="preloader"/>
         </div>
         <div id="ajax-content"></div>
      </div>
      <!--End Content-->
                
                
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<!--         <script src="admin/dist/assets/demo/chart-area-demo.js"></script>
        <script src="admin/dist/assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        
        
        
        <!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="http://code.jquery.com/jquery.js"></script>-->
<script src="plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<script src="plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
<script src="plugins/tinymce/tinymce.min.js"></script>
<script src="plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- All functions for this theme + document.ready processing -->
<script src="js/devoops.js"></script>


<!-- EDIT : c3 ì¶ ê°  -->
<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>























<br>



    </body>
    
    
    

    
    
    
</html>

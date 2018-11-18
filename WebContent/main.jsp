<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>나랑놀자</title>

    <!-- Bootstrap core CSS1 -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">


  </head>

  <body>

    <jsp:include page="header.jsp"></jsp:include>

    <header>
    
    <!-- 슬라이더 구현된 곳 다른곳은 그냥 두고 background-imgage에 사진을 박고 h3태그에 글 p태그에 글쓰기 -->
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url(imgs/main1.jpg)">
            <div class="carousel-caption d-none d-md-block">
<!--               <h3>First Slide</h3> -->
<!--               <p>This is a description for the first slide.</p> -->
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url(imgs/main2.jpg)">
            <div class="carousel-caption d-none d-md-block">
<!--               <h3>Second Slide</h3> -->
<!--               <p>This is a description for the second slide.</p> -->
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below  -->
          <div class="carousel-item" style="background-image: url(imgs/main3.jpg)">
            <div class="carousel-caption d-none d-md-block">
<!--               <h3>Third Slide</h3> -->
<!--               <p>This is a description for the third slide.</p> -->
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content 페이지 영역  main화면에서 보여줄것 -->
    <div class="container">

<!--       <h1 class="my-4">Welcome to Modern Business</h1> -->

<!--       Marketing Icons Section -->
<!--       <div class="row"> -->
<!--         <div class="col-lg-4 mb-4"> -->
<!--           <div class="card h-100"> -->
<!--             <h4 class="card-header">Card Title</h4> -->
<!--             <div class="card-body"> -->
<!--               <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p> -->
<!--             </div> -->
<!--             <div class="card-footer"> -->
<!--               <a href="#" class="btn btn-primary">Learn More</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-lg-4 mb-4"> -->
<!--           <div class="card h-100"> -->
<!--             <h4 class="card-header">Card Title</h4> -->
<!--             <div class="card-body"> -->
<!--               <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p> -->
<!--             </div> -->
<!--             <div class="card-footer"> -->
<!--               <a href="#" class="btn btn-primary">Learn More</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-lg-4 mb-4"> -->
<!--           <div class="card h-100"> -->
<!--             <h4 class="card-header">Card Title</h4> -->
<!--             <div class="card-body"> -->
<!--               <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p> -->
<!--             </div> -->
<!--             <div class="card-footer"> -->
<!--               <a href="#" class="btn btn-primary">Learn More</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2 style="padding-top: 80px;">지역 및 테마 검색</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/seoul.jpg" alt=""></a>
            <div class="card-body">
              <h3 class="card-title">
                <a href="controller?type=search">서울(SEOUL)</a>
              </h3>
              <p class="card-text">세계의 중심지이자 대한민국의 수도인 역사와 현재가 공존하는 서울! 호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/incheon.jpg" alt=""></a>
            <div class="card-body">
              <h3 class="card-title">
                <a href="controller?type=search">인천(INCHEON)</a>
              </h3>
              <p class="card-text">세계와 연결되는 인천국제공항과 인천신항 및 무한한 관광 자원을 지닌 관광도시 인천! 호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/busan.jpg" alt=""></a>
            <div class="card-body">
              <h3 class="card-title">
                <a href="controller?type=search">부산(BUSAN)</a>
              </h3>
              <p class="card-text">대한민국의 해양수도이자 동남권 관광 중심지인 매력이 넘치는 천혜의 관광지 부산! 호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
 
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/workout.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">#운동</a>
              </h4>
              <p class="card-text">현대인들의 최대 관심사 건강! 나랑놀자가 추천해 드리는 건강 테마에 적한합 곳을 소개해 드립니다 #호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/love.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">#사랑</a>
              </h4>
              <p class="card-text">연인 혹은 가족과 사랑과 행복을 느끼고 싶으세요? 나랑놀자가 추천해 드리는 사랑 테마에 적합한 곳을 소개해 드립니다 #호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-60">
            <a href="controller?type=search"><img class="card-img-top" src="imgs/healing.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">#힐링</a>
              </h4>
              <p class="card-text">하루하루 정신적 스트레스에 지친 분들 여기여기 모여라! 나랑놀자가 추천해 드리는 힐링 테마에 맞는 곳을 소개해 드립니다 #호텔 모텔 검색은 역시 나랑놀자</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
<!--         <div class="col-lg-6"> -->
<!--           <h2>Modern Business Features</h2> -->
<!--           <p>The Modern Business template by Start Bootstrap includes:</p> -->
<!--           <ul> -->
<!--             <li> -->
<!--               <strong>Bootstrap v4</strong> -->
<!--             </li> -->
<!--             <li>jQuery</li> -->
<!--             <li>Font Awesome</li> -->
<!--             <li>Working contact form with validation</li> -->
<!--             <li>Unstyled page elements for easy customization</li> -->
<!--           </ul> -->
<!--           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p> -->
<!--         </div> -->
        <div class="col-lg-18" style="padding-left: 70px; padding-top: 50px; padding-bottom: 100px;">
          <img class="img-fluid rounded" src="imgs/bar.jpg" alt="">
        </div>
      </div>
      <!-- /.row -->


      <!-- Call to Action Section -->
<!--       <div class="row mb-4"> -->
<!--         <div class="col-md-8"> -->
<!--           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p> -->
<!--         </div> -->
<!--         <div class="col-md-4"> -->
<!--           <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a> -->
<!--         </div> -->
<!--       </div> -->

    </div>


    <!-- /.container -->

    <!-- Footer -->
   <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

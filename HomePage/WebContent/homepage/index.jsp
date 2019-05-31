<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="css/style.css" type="text/css">
<title>homepage</title>
<META CHARSET="UTF-8">
<style type="text/css">
.aj {
	background-color:
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	
	<div class="container" style="text-align:center">
	<iframe width="350" height=255"
src="https://www.youtube.com/embed/oJ5L63MkrAY">
    </iframe>	
    
    <iframe width="350" height=255"
src="https://www.youtube.com/embed/MsYA2eBGlZQ">
    </iframe>		
	</div>
	
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="ny.jpg" alt="New York"  width="1200" height="700">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>The atmosphere in New York is lorem ipsum.</p>
				</div>
			</div>

			<div class="item">
				<img src="chicago.jpg" alt="Chicago" width="1200" height="700">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago - A night we won't forget.</p>
				</div>
			</div>

			<div class="item">
				<img src="la.jpg" alt="Los Angeles" width="1200" height="700">
				<div class="carousel-caption">
					<h3>LA</h3>
					<p>Even though the traffic was a mess, we had the best time.</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
<p id="demo">Click the button to get your position.</p>
 
<button onclick="getLocation()">Try It</button>
 
<div id="mapholder"></div>
 
<script src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyDBcVbSQvgwAaaDdYHQHKRWv0j8ozy45lM"></script>
 
<script>
var x = document.getElementById("demo");
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
        
    } else { 
     
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
 
function showPosition(position) {
    lat = position.coords.latitude;
    lon = position.coords.longitude;
    latlon = new google.maps.LatLng(lat, lon)
    mapholder = document.getElementById('mapholder')
    mapholder.style.height = '250px';
    mapholder.style.width = '500px';
    var myOptions = {
    center:latlon,zoom:14,
    mapTypeId:google.maps.MapTypeId.ROADMAP,
    mapTypeControl:false,
    navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
    }
    
    var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
    var marker = new google.maps.Marker({position:latlon,map:map,title:"You are here!"});
}
 
function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
      x.innerHTML="사용자가 지리적 위치에게 허용하지 않았다"
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML="위치 정보를 사용할 수 없습니다."
      break;
    case error.TIMEOUT:
      x.innerHTML="작업 시간이 초과되었습니다 "
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML="An unknown error occurred."
      break;
    
    }
}
</script>

<footer id="page_footer">
	<p>&copy; 2014 JCY_Co.</p>
	<nav>
		<ul>
			<li><a href="">회사 소개</a></li>
			<li><a href="">서비스 항목</a></li>
			<li><a href="">개인정보 보호 정책</a></li>
		</ul>
	</nav>
</footer>

</body>
</html>

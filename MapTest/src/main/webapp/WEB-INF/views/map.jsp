<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
   #main {
      display: flex;
      align-items: flex-start;
   }
   
   #map {
      border: 1px solid #CCC;
      width: 550px;
      height: 400px;
   }
   
   #list {
      width: 200px;
      margin-top: 0;
   }
   
   #list td {
      cursor: pointer;
   }
   
   #add {
   }
</style>
</head>
<body>
   <!-- map.jsp -->
   <h1>Map <small>Place</small></h1>
   
   <div id="main">
      <div id="map">지도</div>
      <table id="list">
         <c:forEach items="${mlist}" var="dto">
         <tr>
            <td style="display: flex; cursor: pointer;" data-lat="${dto.lat}" data-lng="${dto.lng}" data-category="${dto.cseq}" class="item">
               <span class="material-symbols-outlined">${dto.cicon}</span>
               <div style="margin-top: 3px; margin-left:5px;">${dto.name}</div>
            </td>
         </tr>
         </c:forEach>
         <tr>
            <td id="all">모두 보기 <span class="badge">0</span></td>
         </tr>
      </table>
   </div>
   
   <hr>
   
   <form method="POST" action="/map/map.do">
   <table id="add" class="vertical">
      <tr>
         <th>장소명</th>
         <td><input type="text" name="name" id="name" class="long"></td>
      </tr>
      <tr>
         <th>카테고리</th>
         <td>
            <select name="category" id="category">
            <c:forEach items="${clist}" var="cdto">
               <option value="${cdto.seq}">${cdto.name}</option>
            </c:forEach>
            </select>
         </td>
      </tr>
      <tr>
         <th>위치</th>
         <td><div id="position"></div></td>
      </tr>
   </table>
   
   <div>
      <input type="submit" value="등록하기" id="btn">
   </div>
   
   <input type="hidden" name="lat" id="lat">
   <input type="hidden" name="lng" id="lng">
   </form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b34a8317f5befe832f9eefe047ae818"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   
   var options = { //지도를 생성할 때 필요한 기본 옵션
      center: new kakao.maps.LatLng(37.4993, 127.0331), //지도의 중심좌표.
      level: 3 //지도의 레벨(확대, 축소 정도)
   };
   
   var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   
   
   let m = null;
   
   kakao.maps.event.addListener(map, 'click', function(event) {
      
      if (m != null) {
         m.setMap(null);
      }
      
      ms.forEach(item=>{
         item.setMap(null);
      });
      
      $('#position').text(event.latLng);
      $('#lat').val(event.latLng.getLat());
      $('#lng').val(event.latLng.getLng());
      
      
      
      var imageSrc = '/map/marker/' + $('#category').val() + '.png';
       var imageSize = new kakao.maps.Size(50, 50);
       var imageOption = {offset: new kakao.maps.Point(25, 50)};
      
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

      
      m = new kakao.maps.Marker({
         position: event.latLng,
           image: markerImage
      });
      
      m.setMap(map);
      
   });
   
   
   $('#list .item').click(function() {
      
      //alert($(this).data('lat'));
      
      if (m != null) {
         m.setMap(null);
      }
      
      ms.forEach(item=>{
         item.setMap(null);
      });
      
      let p = new kakao.maps.LatLng($(this).data('lat'), $(this).data('lng'));
      
      var imageSrc = '/map/marker/' + $(this).data('category') + '.png';
       var imageSize = new kakao.maps.Size(50, 50);
       var imageOption = {offset: new kakao.maps.Point(25, 50)};
      
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

      
      m = new kakao.maps.Marker({
         position: p,
           image: markerImage
      });
      
      m.setMap(map);
      
      map.panTo(p);
      
      $('#list td').css('background-color', 'transparent');
      $(this).css('background-color', 'gold');
      
   });
   
   
   const ms = [];
   
   $("#all").click(function() {
      
      $('#list td').css('background-color', 'transparent');
      $(this).css('background-color', 'gold');
      
      if (m != null) {
         m.setMap(null);
      }
      
      
      <c:forEach items="${mlist}" var="dto" varStatus="status">
      
      let p${status.count} = new kakao.maps.LatLng(${dto.lat}, ${dto.lng});
      
      var imageSrc = '/map/marker/${dto.cseq}.png';
       var imageSize = new kakao.maps.Size(50, 50);
       var imageOption = {offset: new kakao.maps.Point(25, 50)};
      
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

      
      let m${status.count} = new kakao.maps.Marker({
         position: p${status.count},
           image: markerImage
      });
      
      m${status.count}.setMap(map);
      
      ms.push(m${status.count});
      
      </c:forEach>
      
   });
   
   
   kakao.maps.event.addListener(map, 'bounds_changed', function(event) {
      
      //남서쪽
      const sw = map.getBounds().getSouthWest();
      
      const ne = map.getBounds().getNorthEast();

      
      let count = 0;
      
      $('#list td').css('background-color', 'transparent');
      
      <c:forEach items="${mlist}" var="dto" varStatus="status">
      
         if ((ne.getLat() > ${dto.lat} && sw.getLat() < ${dto.lat})
               && (ne.getLng() > ${dto.lng} && sw.getLng() < ${dto.lng})) {
            count++; 
            
            $('#list td').eq(${status.index}).css('background-color', 'rgba(255, 215, 0, .3)');
         }
      
      </c:forEach>
      
      $('#all .badge').text(count);
      
   });
   
</script>
</body>
</html>










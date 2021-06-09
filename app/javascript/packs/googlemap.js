import { Loader } from "@googlemaps/js-api-loader"
document.addEventListener("turbolinks:load", function(){

  if(document.getElementById('map')){
  var mapid = document.getElementById('map').dataset['mapid']
  const loader = new Loader({
    apiKey: mapid,
    version: "weekly"
  });
  loader.load().then(() => {
      const lag = Number(document.getElementById('map').dataset['maplat'])
      const lon = Number(document.getElementById('map').dataset['maplon'])
      
      let map = new google.maps.Map(document.getElementById('map'), {
        center:  {lat: lag , lng: lon},
        zoom: 15
      });
      var markers = [];
      var marker = new google.maps.Marker({
        position: {lat: lag, lng: lon},
        map: map
      });
      markers.push(marker)
      //////////
      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }
      function setMapOnAll(map){
        for (var i = 0; i< markers.length; i++) {
          markers[i].setMap(map);
        }
      }
      // 不顯示舊座標（但沒有刪除）
      function clearMarkers(){
        setMapOnAll(null);
      }
      //刪除舊座標
      function deleteMarkers() {
        setMapOnAll();
        markers = [];
      }
      /////////
      if(document.querySelector('.googlemap')){
      // 監測輸入地址的欄位
      document.querySelector('.googlemap').addEventListener('blur', (e)=>{
      
      const address_input = document.querySelector('.googlemap').value;
      console.log(address_input)
      marker.addListener('blur', toggleBounce);
      deleteMarkers()
      // 抓取地址改為經緯度
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode( { 'address': address_input }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {

        results[0].geometry.location.lat()
            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            marker = new google.maps.Marker({
              position: {lat: latitude, lng: longitude},
              map: map
            });
            markers.push(marker)
            /////
            map.addListener('idle', function() {
              map.panTo(marker.getPosition());
            });
            map.addListener('mouseover', function() {
              map.panTo(marker.getPosition());
            });
          }
        });
      })
      }
    });
  }
})
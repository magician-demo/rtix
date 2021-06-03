import { Controller } from 'stimulus'

export default class extends Controller {
  connect(){
    var map;
    // console.log(this.element)
    function initMap() {
      // console.log(this);
      map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 23.5948979, lng: 119.8960512},
      zoom: 8
      });
    }
    initMap();


  }


}

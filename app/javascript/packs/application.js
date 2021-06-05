import Rails from '@rails/ujs'
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import google from '@google/maps'



Rails.start()
ActiveStorage.start()


import 'controllers'
import 'channels'
import 'stylesheets'
import 'icon'
import 'datatable'
// import 'components'


document.addEventListener("turbolinks:load",()=>{
  var map;
    function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 23.5948979, lng: 119.8960512},
      zoom: 8
      });
    }
 
  initMap();
  
  })

require("trix")
require("@rails/actiontext")

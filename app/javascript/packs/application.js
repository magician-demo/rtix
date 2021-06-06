import Rails from '@rails/ujs'
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// import google from '@google/maps'
require("trix")
require("@rails/actiontext")



Rails.start()
ActiveStorage.start()
// Turbolinks.start()

import 'controllers'
import 'channels'
import 'stylesheets'
import 'icon'
import 'datatable'
// import 'components'
import { Loader } from "@googlemaps/js-api-loader"
console.log('!!1')

document.addEventListener("DOMContentLoaded",()=>{
  const loader = new Loader({
    apiKey: "AIzaSyBU5QjaFGCG1bAAqy48WAscUP5psZstbFg",
    version: "weekly",
    // ...additionalOptions,
  });
  console.log('!!2')

  loader.load().then(() => {
    console.log('!!3')

      const lag = Number(document.getElementById('map').dataset['maplat'])
      const lon = Number(document.getElementById('map').dataset['maplon'])
      window.google = google;

      let map = new google.maps.Map(document.getElementById('map'), {
        center:  {lat: lag , lng: lon},
        zoom: 15
      });
      var marker = new google.maps.Marker({
        position: {lat: lag, lng: lon},
        map: map
      });

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': '交通大學'}, function(results, status) {
      window.results = results
      if (status == google.maps.GeocoderStatus.OK) {
      results[0].geometry.location.lat()
          var latitude = results[0].geometry.location.lat();
          var longitude = results[0].geometry.location.lng();
          console.log("latitude: ", latitude)
          console.log("longitude: ", longitude)
        }
    });

  });
})



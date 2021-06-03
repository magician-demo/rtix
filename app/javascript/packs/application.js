// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery

import Rails, { $ } from '@rails/ujs'
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
    // console.log(123)
    function initMap() {
      // console.log(123);
      map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 23.5948979, lng: 119.8960512},
      zoom: 8
      });
    }
    // console.log("ho");
  initMap();
  // console.log("haha");
  })

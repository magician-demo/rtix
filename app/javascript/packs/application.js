//= require jquery

import Rails from '@rails/ujs'
import * as ActiveStorage from "@rails/activestorage"
Rails.start()
ActiveStorage.start()

import "controllers"
import "channels"
import "stylesheets" 
import "icon"
import "datatable"


require("trix")
require("@rails/actiontext")

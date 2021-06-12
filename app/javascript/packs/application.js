import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
require('trix')
require('@rails/actiontext')
require('jquery/dist/jquery')
require('packs/autocomplete')
require('packs/googlemap')
require('packs/swiper')

Rails.start()
ActiveStorage.start()
Turbolinks.start()

import 'easy-autocomplete/dist/jquery.easy-autocomplete'
import 'controllers'
import 'channels'
import 'stylesheets'
import 'icon'
import 'datatable'

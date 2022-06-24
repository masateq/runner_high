
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import '@fortawesome/fontawesome-free/js/all'
import "../stylesheets/application"
require('jquery')



Rails.start()
Turbolinks.start()
ActiveStorage.start()

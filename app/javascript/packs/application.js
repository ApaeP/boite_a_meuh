// Rails default setup
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Our setup
require("jquery")

// Our imports

$(document).on('turbolinks:load', function() {

  console.log('coucou du turbolinks')

});



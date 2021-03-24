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
import { playAndStopOnClick } from '../components/sound_players';
import { toggleTheme } from '../components/toggle_theme';



$(document).on('turbolinks:load', function() {

  playAndStopOnClick();
  toggleTheme();

});



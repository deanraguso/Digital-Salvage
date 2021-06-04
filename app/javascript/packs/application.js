// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// For bootstrap
//= require jquery3
//= require popper
//= require bootstrap-sprockets


import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'

// Customer scripts
require("packs/search")


Rails.start()
ActiveStorage.start()

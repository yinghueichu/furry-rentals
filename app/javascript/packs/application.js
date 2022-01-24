// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import 'controllers'

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "stimulus";
import "stimulus-flatpickr"


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  initAutocomplete();
});

// import { Application } from 'stimulus'
// import { definitionsFromContext } from 'stimulus/webpack-helpers'

// const application = Application.start()
// // const context = require.context("./controllers", true, /\.js$/)

// // Import style for flatpickr
// require("flatpickr/dist/flatpickr.css")

// // // Manually register Flatpickr as a stimulus controller
// const Flatpickr = require('flatpickr');
// application.register('flatpickr', Flatpickr)

// flatpickr(".datepicker", {
//   minDate: new Date,
//   altInput: true,
// });

// $('.btn-group a').on('click', function (event) {
//   event.preventDefault();
//   var input = $(this).siblings('.control-group').find('input[type=hidden]');
//   if (input.length > 0) {
//     if (input.val().toString() !== $(this).data('value').toString()) {
//       input.val($(this).data('value')).trigger('change');
//     }
//   }
// });

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

document.addEventListener('DOMContentLoaded', function() {
  console.log("DOMContentLoaded");
  $(function () {
    $('.rating_star').click(function () {
      var star = $(this);
      var rating = $(this).attr('data-stars');
      var form_id = $(this).attr('id');

      for (let i = 1; i <= 5; i++) {
        if (i <= rating) {
          $('#s' + i).removeClass('far fa-star').addClass('fas fa-star');
        } else {
          $('#s' + i).removeClass('fas fa-star').addClass('far fa-star');
        }
      }

      $('#stars').val(rating);
      console.log($('#stars').val());

    });
  });
});

document.addEventListener('turbolinks:load', function () {
  console.log("turbolinks ready!");
  $(function () {
    $('.rating_star').click(function () {
      var star = $(this);
      var rating = $(this).attr('data-stars');
      var form_id = $(this).attr('id');

      for (let i = 1; i <= 5; i++) {
        if (i <= rating) {
          $('#s' + i).removeClass('far fa-star').addClass('fas fa-star');
        } else {
          $('#s' + i).removeClass('fas fa-star').addClass('far fa-star');
        }
      }

      $('#stars').val(rating);
      console.log($('#stars').val());

    });
  });
});


$(document).ready(function () {
  console.log("document ready!");
  $(function () {
    $('.rating_star').click(function () {
      var star = $(this);
      var rating = $(this).attr('data-stars');
      var form_id = $(this).attr('id');

      for (let i = 1; i <= 5; i++) {
        if (i <= rating) {
          $('#s' + i).removeClass('far fa-star').addClass('fas fa-star');
        } else {
          $('#s' + i).removeClass('fas fa-star').addClass('far fa-star');
        }
      }

      $('#stars').val(rating);
      console.log($('#stars').val());

    });
  });
});

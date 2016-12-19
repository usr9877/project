//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks

$(document).ready(function() {
     $('.button-collapse').sideNav({ closeOnClick: true});
     $('.collapsible').collapsible();
     $('.modal').modal({
         }

     );

    $(".alert" ).fadeOut(10000);

    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 2 // Creates a dropdown of 15 years to control year
    });
    $('.fixed-action-btn').show();
     $('select').material_select();
});

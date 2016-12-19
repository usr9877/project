//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks

$(document).ready(function() {
     $('.button-collapse').sideNav({ closeOnClick: true});
     $('.collapsible').collapsible();
     $('.modal-trigger').leanModal({
             dismissible: true, // Modal can be dismissed by clicking outside of the modal
             opacity: .5, // Opacity of modal background
             in_duration: 300, // Transition in duration
             out_duration: 200, // Transition out duration

         }

     );

    $(".alert" ).fadeOut(10000);

    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 2 // Creates a dropdown of 15 years to control year
    });
    $('.fixed-action-btn').openFAB();
    $('.fixed-action-btn').closeFAB();
    $('.fixed-action-btn.toolbar').openToolbar();
    $('.fixed-action-btn.toolbar').closeToolbar();
     $('select').material_select();
});

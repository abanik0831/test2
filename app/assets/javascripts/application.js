
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.button
//= require jquery.ui.datepicker
//= require jquery.ui.slider
//= require jquery.ui.spinner
//= require jquery.ui.tooltip
//= require jquery.ui.effect
//= require jquery_ujs
//= require twitter/bootstrap
//= require flatuipro
//= require turbolinks
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require private_pub
//= require_tree .
//

$(document).ready(function(){

//    var faye = new Faye.Client('http://localhost:9292/faye');
//   // client.setHeader('Access-Control-Allow-Origin', '*');
////    faye.setHeader('Access-Control-Allow-Origin', '*');
////    faye.connect();
////    Faye.Transport.WebSocket.isUsable = function(_,c) { c(false) }
//    faye.subscribe('/profiles/1', function (data) {
//        eval(data);
//    });



    $(".sidebar").on("click", function(){
       $(".notification-center").toggle();
    });

    $(".messageuser").on("click", function(e){
        e.preventDefault();
        var current_user = $('.current_user_email')[0].innerText;
        console.log(current_user);
        var recipients = $("#conversation_recipients").val();
        recipients = current_user;
        window.location.href = "http://localhost:3000/conversations/new";
    });

    var myTour = jTour([
        {
            html: "Welcome to Startup Social"
        },{
            html: "start the Tour with this button",
            element: $('a.button.primary'),
            overlayOpacity:0.9,
            expose: {
                'background-color': '#fff',
                'font-size': 20,
                'color': '#000'
            },
            position: 'sw'
        },{
            html: "Click here to navigate to the Dashboard",
            element: $('.skill_img.design_mobile, .skill_text.design, .designusers'),
            expose: {
                'font-size': 20,
                'color': 'white'
            },
            overlayOpacity:0.9,
            position: 's',
            offset: 165
        },{
            html: "Click here to navigate to the Dashboard",
            element: $('.skill_img.technology, .skill_text.technology, .techusers'),
            expose: {
                'font-size': 20,
                'color': 'white'
            },
            overlayOpacity:0.9,
            position: 's',
            offset: 165
        },{
            html: "Click here to navigate to the Mobile",
            element: $('.businessclick, .skill_text.business, .businessusers'),
            overlayOpacity:0.9,
            expose: {
                'font-size': 20,
                'color': 'white'
            },
            position: 'e',
            offset: 165
        }, {
            html: "Share something startup related ...",
            element: $('#dashboard-post'),
            overlayOpacity:0.9,
            expose: true,
            position: 'e'


        }, {
            html: "View your posts and the users you are following",
            element: $('.container').eq(0),
            overlayOpacity:0.9,
            expose: true,
            position: 'e'


        }, {
            html: "View your posts and the users you are following",
            element: $('header.logged'),
            overlayOpacity:0.5,
            expose: true,
            position: 's'
        }
    ]);

    //the Button
    $(document).on("click", '#starttour', function(){
        myTour.start();
    });



});
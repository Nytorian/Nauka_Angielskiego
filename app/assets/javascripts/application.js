// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function() {

  $(".sentence").hover(function (){
    var flag = $(this).attr('flag');

    var sentence_en =  $("#sentence_en_" + $(this).data('id')).text();
    var sentence_pl =  $("#sentence_pl_" + $(this).data('id')).text();

    $(this).stop().css('opacity', '0').html(function (_, oldText) { // Set the opacity of the div to 0 and then change the html (flip it based on last value)
        $(this).attr('flag', flag == '0' ? '1' : '0');
        return flag == '0' ? sentence_pl : sentence_en
    }).animate({
        opacity: 1 // Animate opacity to 1 with a duration of 2 sec
    }, 600);
});
  // $(".sentence").click(function(){
  //   var audio = new Audio();
  //   audio.src ="http://translate.coogle.com/translate_tts?ie=UTF-&&q=" + text + "&tl=en";
  //   audio.play();
  // });
});
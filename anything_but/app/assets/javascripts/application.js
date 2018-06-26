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
//= require_tree .

//= require bootstrap-sprockets
//= require jquery-ui/autocomplete


$( document ).ready(function() {

  var userLocation=$("#user-location")[0];
  var lat = null;
  var lon = null;
  var mapsBaseUrl= "https://maps.googleapis.com/maps/api/geocode/json?latlng=";
  var googleKey="AIzaSyAhdYCfKZwTBbDA5PxY_bj_bXtEKF2xLAc"
  var userCity=null;
  var userNeighborhood=null;

  function getLocation() {
      $(".spinner").show();
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, noGeolocate);
    } else {
        userLocation.innerHTML = "Geolocation is not supported by this browser.";
    }
  }
  function showPosition(position) {
    lat = position.coords.latitude;
    lon = position.coords.longitude;
    returned_data=null;
    $.ajax({
      url: mapsBaseUrl+lat+","+lon+"&key="+googleKey,
      method: 'GET',
      success: function (locationData, status){
        $(".spinner").hide();
        $("#input-box").show();
        var neighborhood=null;
        var city=null
        for (i = 0; i < locationData.results.length; i++) {
          for (z=0; z < locationData.results[i].types.length; z++){
            if (locationData.results[i].types[z] === "neighborhood"){
              var locationDataResults=locationData.results[i]["formatted_address"];
              userLocation.innerHTML=locationDataResults.split(/,/)[1]+" > "+locationDataResults.split(/,/)[0];
              userCity=locationDataResults.split(/,/)[1];
              userNeighborhood=locationDataResults.split(/,/)[0];
              return;
            }
          }
        };
      }
    })
  }

  function noGeolocate(){
    setTimeout(function(){
      alert("We couldn't find you! Refresh the page and allow location sharing. If that doesn't work check your browser's privacy settings.")
    }, 3000)
  }

  getLocation();
  $("#dnw-button").click(function(){
    $(".spinner").show();
    $("#input-box").hide();
    $.ajax({
      url: "/recommendations",
      method: "POST",
      dataType: "json",
      data: {latitude:lat, longitude:lon, doNotWant:$("#do-not-want").val(), city: userCity, neighborhood: userNeighborhood},
      success: function(apiData, status){
        $(".spinner").hide();
        $("#rec-response-h1")[0].style="display:block;"
        $("#rec-response-h1")[0].innerHTML="<a target='_blank' href='"+apiData.url+"'>"+apiData.name+"</a>";
        $("#dislike-button")[0].style="display:block;";
        $("#new-search-button")[0].style="display:block;";
        $("#welcome-questions")[0].style="display:none;";
      }
    })
  })
  $("#result-wrapA").click(function(){
    $.ajax({
      url: "/new-recommendation",
      method: "GET",
      dataType: "json",
      success: function(newRecommendation, status){
        $("#rec-response-h1")[0].innerHTML="<a target='_blank' href='"+newRecommendation.url+"'>"+newRecommendation.name+"</a>";
        var selector = $("#like_button").find('span');
        if (selector.hasClass('glyphicon-heart'))
          selector.removeClass('glyphicon-heart')
          selector.addClass("glyphicon-heart-empty")
      }
    })
  })
  $("#result-wrapB").click(function(){
    $("#input-box").show();
    $("#welcome-questions")[0].style="display: block;";
    $("#do-not-want")[0].value="";
    $("#dislike-button")[0].style="display:none;";
    $("#new-search-button")[0].style="display:none;";
    $("#rec-response-h1")[0].style="display:none;"
  })
  $("#like_button").click(function(){
    $.ajax({
      url: "/user-liked-recommendation",
      method: "POST",
      dataType: "json",
      data: {like_business_name:$('a').last().html(), like_business_link:$('a').last().attr('href')},
      success: function(returnData, status){
          $("#like_button").find('span').toggleClass('glyphicon-heart-empty glyphicon-heart');
        }
    })
  })

});


  // // hide spinner


  // show spinner on AJAX start
  // $(document).ajaxStart(function(){
  //   $(".spinner").show();
  //   // $("#input-box").hide();
  // });
  //
  // // hide spinner on AJAX stop
  // $(document).ajaxStop(function(){
  //   $(".spinner").hide();
  //   $("#input-box").show();
  // });

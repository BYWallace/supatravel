function buildGMap(mapData){

var mapStyle = [
  {
    "featureType": "landscape",
    "stylers": [
      { "invert_lightness": true },
      { "visibility": "on" },
      { "color": "#e3b180" }
    ]
  },{
    "featureType": "water",
    "stylers": [
      { "weight": 2 },
      { "color": "#7c80ab" }
    ]
  },{
  }
];




  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles:    mapStyle

  }, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(mapData);
    //       THIS IS THE ORIGINAL TEST PIN, centered at GA, DC.
    //   [
    //   {
    //     "lat": 38.904779,
    //     "lng": -77.034210,
    //     "picture": {
    //       "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
    //       "width":  36,
    //       "height": 36
    //     },
    //     "infowindow": "hello!"
    //   }
    // ]
    // recomment this, and comment-out above [ through ]to access @hash data from appropriate controllers
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}




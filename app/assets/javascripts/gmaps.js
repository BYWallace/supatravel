function buildGMap(mapData){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
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

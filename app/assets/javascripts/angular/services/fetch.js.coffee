App.factory 'fetchMapInfo', ['$resource', ($resource) ->
  fetch_photo_with = (x, y, z, theta) ->
    $resource '/maps/fetchPhoto/:x/:y/:z/:theta',
      {x: x, y: y, z: z, theta: theta},
      {'query': { method: 'GET', isArray: false }}

  feel_all_around = (x, y, z) ->
    $resource '/maps/feelAllAround/:x/:y/:z',
      {x: x, y: y, z: z},
      {'query': { method: 'GET', isArray: false}}
  {
    fetch_photo_with: fetch_photo_with,
    feel_all_around: feel_all_around,
  }
]

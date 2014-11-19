App.factory 'fetchPhoto', ['$resource', ($resource) ->
  fetch_photo_with = (x, y, z, theta) ->
    $resource '/maps/fetchPhoto/:x/:y/:z/:theta',
        {x: x, y: y, z: z, theta: theta},
        {'query': { method: 'GET', isArray: false }}
  {fetch_photo_with: fetch_photo_with}
]

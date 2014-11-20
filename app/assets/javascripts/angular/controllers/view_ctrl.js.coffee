App.controller "ViewCtrl", ["$scope", "fetchMapInfo",
($scope, fetchMapInfo) ->
  # パラメータ宣言
  $scope.col = {
    x: 0,
    y: 0,
    z: 0
  }
  $scope.theta = 0

  $scope.flags = {
      forward: true,
      back: false,
      left: false,
      right: false
  }

  $scope.hasPhoto = {
      forward: false,
      back: false,
      left: false,
      right: false
  }
  
  change_col = {
    "forward": -> $scope.col.y += 1,
    "back": -> $scope.col.y += -1,
    "left": -> $scope.col.x += -1,
    "right": -> $scope.col.x += 1
  }

  # 初期画像取得
  $scope.photo = fetchMapInfo.fetch_photo_with($scope.col.x,
                                             $scope.col.y,
                                             $scope.col.z,
                                             $scope.theta).query()
  $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col.x,
                                                 $scope.col.y,
                                                 $scope.col.z).query()

  moveTo = (direction) ->
    switch direction
      when "forward"
        $scope.col.y += 1
        $scope.theta = 0
      when "back"
        $scope.col.y += -1
        $scope.theta = 180
      when "left"
        $scope.col.x += -1
        $scope.theta = 270
      when "right"
        $scope.col.x += 1
        $scope.theta = 90

  turnTo = (direction) ->
    switch direction
      when "left"
        $scope.theta = ($scope.theta + 270) % 360
      when "right"
        $scope.theta = ($scope.theta + 90) % 360
  
  # ボタン処理の部分
  $scope.forward = ->
      moveNextCol("forward")
  $scope.back = ->
      moveNextCol("back")
  $scope.left = ->
      moveNextCol("left")
  $scope.right = ->
      moveNextCol("right")
]

App.controller "ViewCtrl", ["$scope", "fetchMapInfo", "switchArrow",
($scope, fetchMapInfo, switchArrow) ->
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

  moveNextCol = (direction) ->
      switchArrow.switching($scope.flags, direction)
      change_col[direction]()
      $scope.photo = fetchMapInfo.fetch_photo_with($scope.col.x,
                                                 $scope.col.y,
                                                 $scope.col.z,
                                                 $scope.theta).query()
      $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col.x,
                                                     $scope.col.y,
                                                     $scope.col.z).query()

  
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

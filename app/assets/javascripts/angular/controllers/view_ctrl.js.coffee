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

  # 初期画像取得
  $scope.photo = fetchMapInfo.fetch_photo_with($scope.col.x,
                                             $scope.col.y,
                                             $scope.col.z,
                                             $scope.theta).query()
  $scope.hasPhoto = fetchMapInfo.feel_all_around($scope.col.x,
                                                 $scope.col.y,
                                                 $scope.col.z).query()
  
  # ボタン処理の部分
  $scope.forward = ->
      switchArrow.switching($scope.flags, "forward")
  $scope.back = ->
      switchArrow.switching($scope.flags, "back")
  $scope.left = ->
      switchArrow.switching($scope.flags, "left")
  $scope.right = ->
      switchArrow.switching($scope.flags, "right")
]

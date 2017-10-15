(function () {
'use strict';

angular.module('app', [])
.controller('PicLoadController', PicLoadController)
.factory('serviceFactory', serviceFactory )
.directive('data', function(){
  return {
    template: 'data',
    link: function(scope, elem, attr) {

      //console.log(attr)
    /* link function */ },


  }
})
function PicLoadController ($scope,   serviceFactory) {

$scope.current_page = 1;



$scope.nextPage = function(){
  $scope.current_page +=1

    serviceFactory.getRailsData('popular', $scope.current_page ).then(function(r){
     $scope.data = (r.photos);
    })

    serviceFactory.categories('popular', $scope.current_page).then(function(r){
       $scope.categories = (r);
        
      })
  //return $scope.current_page
}

serviceFactory.categories('popular', $scope.current_page).then(function(r){
   $scope.categories = (r);

  })

  serviceFactory.getRailsData('popular', 1 ).then(function(r){
     $scope.data = (r.photos);
     //console.log(r)
    })

    // serviceFactory.categories().then(function(r){
    //    $scope.categories = (r);
    //   //  console.log(typeof $scope.data )
    //   })
    $scope.chooseCat = function(cat){
      var v = cat
        var catalog = swap($scope.categories)
          $scope.category_chosen = cat//(catalog[cat])
          $scope.search = {"category":catalog[cat]}
      }




      function swap(json){
        var ret = {};
        for(var key in json){
          var a=json[key.toString()]
          ret[a] = key;
        }
        return ret;
      }
};

//SERVICE FACTORY

function serviceFactory($q, $http){

 return {

   getRailsData: function(feature, page){

     feature = feature || 'pupolar'
     page = page || 1

     var dataUrl = 'http://localhost:3000/pictures/api/'+"?feature='"+feature + "&current_page="+ page

     var promise = $http.get(dataUrl).then(function (response) {
       return response.data;
     });
     return promise;
    },

   categories: function(feature, page){

     feature = feature || 'pupolar'
     page = page || 1

     var promise = $http.get('http://localhost:3000/pictures/categories'+"?feature='"+feature + "&current_page="+ page).then(function (response) {
       return response.data;
     });
     return promise;
    },

  };


}




        // $scope.filerCat = function(index){
        //   var predicate = Object.keys(catObj).filter(function(key) {return catObj[key] === index})[0];
        //   var newObj = [], key;
        //           for(var i = 1; i < obj.length; i++){
        //             if (obj[i].category == predicate || true){
        //
        //                 newObj.push(obj[i])
        //             }
        //           }
        //             service.pics =  newObj;
        //             console.log(newObj + "NEWOBJ")
        //    }









})();

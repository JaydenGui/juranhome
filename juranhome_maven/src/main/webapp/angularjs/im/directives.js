'use strict';

    // Angular File Upload module does not include this directive
    // Only for example


    /**
    * The ng-thumb directive
    * @author: nerv
    * @version: 0.1.2, 2014-01-09
    */
    app.directive('ngThumb', ['$window', function($window) {
        var helper = {
            support: !!($window.FileReader && $window.CanvasRenderingContext2D),
            isFile: function(item) {
                return angular.isObject(item) && item instanceof $window.File;
            },
            isImage: function(file) {
                var type =  '|' + file.type.slice(file.type.lastIndexOf('/') + 1) + '|';
                return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
            }
        };

        return {
            restrict: 'A',
            template: '<canvas/>',
            link: function(scope, element, attributes) {
                if (!helper.support) return;

                var params = scope.$eval(attributes.ngThumb);

                if (!helper.isFile(params.file)) return;
                if (!helper.isImage(params.file)) return;

                var canvas = element.find('canvas');
                var reader = new FileReader();

                reader.onload = onLoadFile;
                reader.readAsDataURL(params.file);

                function onLoadFile(event) {
                    var img = new Image();
                    img.onload = onLoadImage;
                    img.src = event.target.result;
                }

                function onLoadImage() {
                    var width = params.width || this.width / this.height * params.height;
                    var height = params.height || this.height / this.width * params.width;
                    canvas.attr({ width: width, height: height });
                    canvas[0].getContext('2d').drawImage(this, 0, 0, width, height);
                }
            }
        };
    }]);
    /**
     * a directive for file component
     */
    app.directive('fileModel', ['$parse', function ($parse) {
        return {
            restrict: 'A',
            link: function(scope, element, attrs, ngModel) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;
                angular.element("#"+element[0].id).bind('change', onChange);
                function onChange(event){
                    scope.$apply(function(){
                        modelSetter(scope, (event.srcElement || event.target).files[0]);
                    });
                    //附件预览
                    scope.file = (event.srcElement || event.target).files[0];
                    scope.getFile();
                    angular.element("#"+element[0].id).replaceWith(angular.element("#"+element[0].id).clone(true));
                }
            }
        };
    }]);
    /**
     * bind scroll to top event for element
     */
    app.directive('scrollToTop', function () {
        return {
            scope: {
                scrollToTop: '&',
                hasMore:'=',
                total:'=',
                retCount:'='
            },
            restrict: 'A',
            link: function (scope, element, attrs) {
                element.bind('scroll', function () {
                	if(!scope.hasMore)return;
                    if (element.scrollTop() <= 0) {
                        scope.scrollToTop();
                        scope.$apply();
                    }
                });

                element.on('$destroy', function () {
                    element.unbind('scroll');
                });
                
                scope.$watch('total',function(){
                	element.scrollTop(element[0].scrollHeight*scope.retCount / scope.total);
                });
            }
        };
    });

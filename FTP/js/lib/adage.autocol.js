// Adage AutoCol
// automatically adjust columns to match height & compensates for images loading past doc.ready
// 
//  Target the direct parent of the columns.
//  You can provide a selector for the child columns, but it will default to the * selector
//  Columns must be direct children of the targeted element
//
//  Example
//
//  $('#columnsWrapper').autoCol({column:'.columnClass'})
//      or
//  $('#columnsWrapper').autoCol();
//

(function($){
 
    $.fn.extend({ 

        autoCol: function(options) {
 
            var defaults = {
                columns: '*'
            }
                 
            var options =  $.extend(defaults, options);
 
            return this.each(function() {
                var o = options;
                var target = this;

                var sizingFunction = function () {
                    var columns = $(this).children(o.columns);
                    $(columns).each(function() {
                        $(this).css('height','auto');
                    })

                    var maxHeight = 0;

                    for(var i = 0; i < columns.length; i++) {
                        var height = $(this).children(o.columns + ':eq(' + i + ')').outerHeight();
                        if(height > maxHeight) {
                            maxHeight = height;
                        }
                    }

                    $(columns).each(function() {
                        $(this).height(maxHeight);
                    });
                }

                sizingFunction.call(target);

                $(target).find('img').each(function() {
                    $(this).load(function() {
                        sizingFunction.call(target);
                    });
                });

            });
        }
    });
     
})(jQuery);
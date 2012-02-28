// This code is used to control the navigation bar. When a navigation
// element is clicked it will be active until an other element is
// clicked.

// By using a self executing function we achieve multiple things
// Firstly, we don't pollute the name space. Second we are certain
// about the values of `$` and `undefined`.
(function($,undefined){
    // We define a function which will be bound to all navigation
    // elements. It will do the heavy lifting for use.
    var makeActive = function() {
	// Disable other *active* elements...
	$("ul.nav li").removeClass("active");
	// ... and  enable the current element.
	$(this).parent("li").addClass("active");
    }
    
    // When the document is loaded bind all the navigational elements
    // click events the `makeActive` function.
    $(function(){
	$("ul.nav a, .brand").click(makeActive);
    });
})(jQuery)
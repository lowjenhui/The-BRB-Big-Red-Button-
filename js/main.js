$( document ).ready(function() {
	$(".useful").hover(
	  function () {
	    $(this).addClass("useful-hover");
	    $(".useful-stuff").addClass("show");
	  },
	  function () {
	    $(this).removeClass("useful-hover");
	    $(".useful-stuff").removeClass("show");
	  }
	);
	$(".normal").hover(
	  function () {
	    $(this).addClass("normal-hover");
	    $(".normal-stuff").addClass("show");
	  },
	  function () {
	    $(this).removeClass("normal-hover");
	    $(".normal-stuff").removeClass("show");
	  }
	);
	$(".asshole").hover(
	  function () {
	    $(this).addClass(".asshole-hover");
	    $(".asshole-stuff").addClass("show");
	  },
	  function () {
	    $(this).removeClass(".asshole-hover");
	    $(".asshole-stuff").removeClass("show");
	  }
	);
});
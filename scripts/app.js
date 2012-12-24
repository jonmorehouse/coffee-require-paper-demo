requirejs.config({

	urlArgs: "bust=" + (new Date()).getTime(),//used to keep the browser from caching the scripts as we move
	baseUrl : "scripts",//base scripts page!


	paths : {	

		'jquery' : "../components/jquery/jquery.min", //specific libraries -- can be specified later
		'underscore' : "../components/underscore/underscore",
		'paper' : "../components/paper/paper"
	},

	shim: {

        'underscore': {
        	exports: '_'
        },

        'paper' : {
        	exports: 'paper'
        },
    },
});

// initialize the document with a doc ready!

requirejs(["jquery", "homepage", "paper"], function ($, homepage, paper) {
	
	$(document).ready(function() {

		homepage();

	});

});

define ['paths', 'chain'], (paths, chain) ->

	# initialize a paper test suite
	# test = new paths.drawing $('div')
	homepage = () ->



		canvas = document.getElementById "drawing_2"
		drawing = new paths.drawing canvas

		test = new chain.Chain $('#drawing_1')[0]
	

	





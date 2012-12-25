define ['paths', 'test'], (paths, test) ->

	# initialize a paper test suite
	# test = new paths.drawing $('div')
	homepage = () ->

		canvas = document.getElementById "drawing_1"

		drawing = new paths.drawing canvas

		test.draw()

	

	





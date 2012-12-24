define ['paper'], (paper) ->

	drawing = (canvas) ->

		paper.setup canvas

		path = new paper.Path()

		path.strokeColor = "blue"

		start = new paper.Point 0,0

		path.moveTo start

		path.add new paper.Point 25,25

		path.add new paper.Point 50,50

		paper.view.draw()

	# return functions from this!
	# test: test,
	drawing: drawing


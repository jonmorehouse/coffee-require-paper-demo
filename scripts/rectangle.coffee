define ['paper'], (paper) ->

	rectangle = (x, y, height, width) ->

		path = new paper.Path()
		path.add new paper.Point x, y
		path.add new paper.Point x, y + height
		path.add new paper.Point x + width, y
		path.add new paper.Point x + width, y + height

		path.closed = true

		return path

	test = () ->

		do alert _test 
		return do alert "HELLO WORLD"

	rectangle: rectangle
	test: test




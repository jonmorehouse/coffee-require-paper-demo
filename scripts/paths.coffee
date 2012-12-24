define ['paper', 'rectangle'], (paper, rectangle) ->

	test = () ->

		alert "HELLO WORLD"

	drawing = (canvas) ->

		paper.setup canvas

		# create a basic rectangle
		# _rect = new rectangle 0, 0, 200, 200

		..test
		alert "HELLO WORLD"

		path = new paper.Path()

		path.style = 

			fillColor: "rgb(255,36,36)"
			strokeColor: "black"
			strokeWidth: 8

		path.add new paper.Point 50, 50,
		path.add new paper.Point 50, 100
		path.add new paper.Point 100, 50
		path.add new paper.Point 100, 100

		path.closed = true

		# create a copy and move it!
		# copy = path.clone()

		# copy.position.x += 200





		paper.view.draw()
	# RETURN VALUE!
	drawing: drawing


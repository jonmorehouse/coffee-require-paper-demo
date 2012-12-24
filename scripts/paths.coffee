define ['paper'], (paper) ->

	drawing = (canvas) ->

		paper.setup canvas

		pathStyle = 

			strokeWidth: 10

		path = new paper.Path()

		path.style = pathStyle

		path.strokeColor = "blue"
		path.segments = []

		path.add paper.view.bounds.bottomLeft

		for x in [0, paper.view.size.width]
				
			# max_height * ratio of x for sing
			_height = Math.sin(x / paper.view.size.width) * paper.view.size.height
			path.add new paper.Point x, _height



		circle = new paper.Path.Circle 100, 20
		circle.fillColor = "blue"

		paper.view.draw()



	# RETURN VALUE!
	drawing: drawing


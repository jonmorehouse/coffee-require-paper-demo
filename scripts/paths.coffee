define ['paper'], (paper) ->

	drawing = (canvas) ->

		paper.setup canvas



		pathStyle = 

			strokeWidth: 5

		circle = new paper.Path.Circle 100, 40
		circle.fillColor = "rgb(100,200,255)"
		circle.strokeWidth = 200


		tool = new paper.Tool()
		paper.Tool.maxDistance = 100

		tool.onMouseDown = () ->


			tool.onMouseDrag = () ->

				console.log "HELLO DRAG"

		paper.onFrame = (event) ->

			console.log "HELLO WORLD"
			destination = paper.Point.random() * paper.view.size 

			circle.moveTo destination


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


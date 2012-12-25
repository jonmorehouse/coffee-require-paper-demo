define ['paper'], (paper) ->

	class Chain #this is the basic chain class for our project!

		constructor: (canvas) ->

			# initialize canvas
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
			@tool = new @paper.Tool()
				
			# initialize the path for the chain
			@path = new paper.Path()
			@size = 25
			@segments = @path.segments
			@path.style = 

				strokeColor: "blue"
				strokeWidth: 20
				strokeCap: "round"

			@init()

			@tool.onMouseDown = () ->

				alert @size


		init: () =>

			# initialize the path element for the starting point
			start = @paper.view.center

			# initialize the path segments
			for i in [0..@size]	
				@path.add new @paper.Point start.x + i * 10, start.y

			# actually draw the view on the page
			@paper.view.draw()

			# initialize listener functions
			@tool.onMouseDown = @paper.onMouseDown


		test: () =>

			alert @size


			# @tool.onMouseOver = (event) -> return @mouse_over event 

			# @tool.onMouseUp = (event) -> return @mouse_up event

		
		mouse_down : (event) =>

			console.log "HELLO WORLD FROM MOUSE DOWN!"

		mouse_over: (event) => 

			console.log "HELLO WORLD FROM MOUSE OVER!"

		mouse_up: (event) =>

			console.log "HELLO WORLD FROM MOUSE UP!!!"



	# return values

	Chain: Chain


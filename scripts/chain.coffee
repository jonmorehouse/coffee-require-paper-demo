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
			# initialize the proper paper listener functions
			# the paper constructors take away the this scope so we need to create a reference to it!
			self = @
			
			# initialize the parents!
			@tool.onMouseDown = () ->

				return self.mouse_down()
	
			@tool.onMouseOver = () ->

				return self.mouse_over()

			@tool.onMouseUp = () ->

				return self.mouse_up()

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

		mouse_down : (event) =>



		mouse_over: (event) => 

			

		mouse_up: (event) =>

			console.log "HELLO WORLD FROM MOUSE UP!!!"



	# return values

	Chain: Chain


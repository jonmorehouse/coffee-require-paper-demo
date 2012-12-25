define ['paper'], (paper) ->

	class Chain

		constructor: (canvas) ->

			# initialize canvas
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
				
			# initialize the path for the chain
			@path = new paper.Path()
			@size = 25
			@segments = @path.segments
			@path.style = 

				strokeColor: "blue"
				strokeWidth: 20
				strokeCap: "round"

			@init()

		init: () =>

			# initialize the path element for the starting point
			start = @paper.view.center

			for i in [0..@size]	
				@path.add new @paper.Point start.x + i * 10, start.y

			# alert "HELLO WORLD"
			@paper.view.draw()


			




	# return values

	Chain: Chain


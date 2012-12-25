define ['paper'], (paper) ->

	class Chain #this is the basic chain class for our project!

		accuracy : 5

		constructor: (canvas) ->

			# initialize canvas
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
			@tool = new @paper.Tool()
				
			# initialize the path for the chain
			@path = new paper.Path()
			@size = 10
			@length = 20
			@segments = @path.segments
			@style = 

				strokeColor: "gray"
				strokeWidth: 15
				strokeCap: "round"

			@path.style = @style

			@init()
			# initialize the proper paper listener functions
			# the paper constructors take away the this scope so we need to create a reference to it!
			self = @
			
			# initialize the parents!
			@tool.onMouseDown = (event) ->

				
				
				return self.mouse_down event
	
			@tool.onMouseMove = (event) ->

				return self.mouse_move event

			@tool.onMouseUp = (event) ->

				return self.mouse_up event

		init: () =>

			# initialize the path element for the starting point
			start = @paper.view.center

			# initialize the path segments
			for i in [0..@size]	
				@path.add new @paper.Point start.x + i * 10, start.y

			# actually draw the view on the page
			@paper.view.draw()
			@grow_length()

			# initialize listener functions
			@tool.onMouseDown = @paper.onMouseDown

		grow_length : () =>

			console.log @length
			@length = @length + 1

			return setTimeout @grow_length, 2000

		compare_points : (point_1, point_2) ->

			delta_x = point_1.x - point_2.x
			delta_y = point_2.y - point_2.y

			delta_x = delta_x if delta_x > 0 else -1 * delta_x
			delta_y = delta_y if delta_y > 0 else -1 * delta_y

			return if delta_x <= @accuracy and delta_y <= @accuracy


		mouse_down : (event) =>	

			@path.style = 

				strokeColor: "orange"
				strokeWidth: 10

			@path.selected = true

		mouse_move : (event) => 

			@segments[0].point = event.point

			for i in [0..@size-1]

				
				next = @segments[i+1] #next element
				current = @segments[i] #current element

				# remember that there are no point operations in script !== paperscript
				angle = (current.point.subtract next.point).angle

				vector = new paper.Point {angle: angle, length: @length}
				next.point = current.point.subtract vector

			@path.smooth()
		

		mouse_up : (event) =>

			@path.style = @style

			@path.selected = false



	# return values

	Chain: Chain

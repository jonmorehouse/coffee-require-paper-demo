define ['paper'], (paper) ->

	class Chain #this is the basic chain class for our project!

		accuracy : 5

		constructor: (canvas) ->

			# initialize canvas
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
			@tool = new @paper.Tool()
		
			# initialize settings
			@size = 25
			@length = 10
			@growing = 
				status: true
				max_length: 50
				min_length: 10
				delta: 2
				interval: 1500
			@style = 
				strokeColor: "gray"
				strokeWidth: 15
				strokeCap: "round"

			# initialize the path for the chain
			@path = new paper.Path()
			@segments = @path.segments
			@path.style = @style

			# initialize click settings
			@clicked = false
			@first = true

			# create teh path
			@init()
			# initialize the proper paper listener functions
			# the paper constructors take away the this scope so we need to create a reference to it!
			self = @
			
			# initialize listners and map to object
			@tool.onMouseDown = (event) ->

				return self.mouse_down event
		
			@tool.onMouseMove = (event)->

				return self.mouse_move event

			@tool.onMouseUp = (event) ->

				return self.mouse_up event
		
		init: () =>

			# initialize the path element for the starting point
			start = @paper.view.center
			delta_x = @paper.view.size.width / @size
			@length = delta_x * 0.5

			# want the end point to be halfway across the other element
			# initialize the path segments
			for i in [0..@size]	
				@path.add new @paper.Point start.x + i * delta_x, start.y

			# actually draw the view on the page
			@paper.view.draw()
			@grow_length()

			# initialize listener functions
			@tool.onMouseDown = @paper.onMouseDown

		grow_length : () =>

			if not @growing.status or @length > @growing.max_length
				return false

			@length = @length + @growing.delta

			return setTimeout @grow_length, @growing.interval

		difference : (point_1, point_2) ->#assumes that we are sending in two points!

			delta_x = point_1.x - point_2.x
			delta_y = point_1.y - point_2.y

			delta_x = if delta_x > 0 then delta_x else (-1*delta_x)
			delta_y = if delta_y > 0 then delta_y else (-1 * delta_y)


			return delta_x + delta_y

		mouse_down : (event) =>	

			@clicked = true
			
			# determine whether we clicked near the beginning 
			delta_first = @difference event.downPoint, @segments[0].point
			delta_last = @difference event.point, @segments[@size-1].point

			# set this globally in the object
			@first = if delta_first < delta_last then true else false

			# path is selected variable
			@path.selected = true

		mouse_move : (event) => 

			if not @clicked
				return 

			if @first

				# set the first element as the event
				@segments[0].point = event.point
				# intiialize the for loop and change all element
				for i in [0..@size-1]

					next = @segments[i+1] #next element
					current = @segments[i] #current element

					# remember that there are no point operations in script !== paperscript
					angle = (current.point.subtract next.point).angle

					vector = new paper.Point {angle: angle, length: @length}
					next.point = current.point.subtract vector
			

			else 

				@segments[@size].point = event.point
				# intiialize the for loop and change all element
				for i in [@size..1]

					next = @segments[i-1] #next element
					current = @segments[i] #current element

					# remember that there are no point operations in script !== paperscript
					angle = (current.point.subtract next.point).angle

					vector = new paper.Point {angle: angle, length: @length}
					next.point = current.point.subtract vector


			# smooth path
			@path.smooth()
		
		mouse_up : (event) =>

			@path.style = @style
			@clicked = false

			@path.selected = false

	# return values

	Chain: Chain

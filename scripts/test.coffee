define ['paper'], (paper) ->

	draw = () ->

		paper = new paper.PaperScope()

		paper.setup $('#drawing_2')[0]

		path = new paper.Path()

		points =

			begin: new paper.Point 0, 0
			through_top: new paper.Point paper.view.size.width * 0.5, paper.view.size.height * 0.25
			through_bottom: new paper.Point paper.view.size.width * 0.5, paper.view.size.height * 0.75
			end: new paper.Point paper.view.size.width, paper.view.size.height

		path.add points.begin

		# Path.Arc (from through, to)

		bottom_path = new paper.Path.Arc points.begin, points.through_bottom, points.end
		top_path = new paper.Path.Arc points.begin, points.through_top, points.end
		top_path.strokeColor = "black"
		bottom_path.strokeColor = "blue"

		top_path.smooth = true
		bottom_path.smooth = true	
		path.style = 

			strokeColor: "orange"

		paper.view.draw()

	draw : draw

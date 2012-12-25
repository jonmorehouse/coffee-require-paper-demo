define ['paper', 'rectangle'], (paper, rectangle) ->

	drawing = (canvas) ->

		paper = new paper.PaperScope()
		paper.setup canvas

		# create a basic rectangle
		# _rect = new rectangle 0, 0, 200, 200
		path = new paper.Path()

		path.style =

			strokeColor: "green"
			strokeWidth: 2

		path.fullySelected = false

		points = 

			begin : new paper.Point 200, 100
			end: new paper.Point paper.view.size.width * 0.05, paper.view.size.height
			through: new paper.Point paper.view.size.width * 0.20, paper.view.size.height * 0.5

		path.add points.begin
		path.arcTo points.through, points.end
		

		# created the stem ... need to create the flower now!

		circle = new paper.Path.Circle points.begin, 20
		circle.style = path.style
		circle.strokeColor = "orange"
		circle.fillColor = "orange"

		# now need to create the brushes

		size = new paper.Size 5, 20

		rectangle = new paper.Rectangle points.end, size
		bottom = paper.Path.Oval rectangle
		bottom.fillColor = "#d0aa7b"

		stem = new paper.Path()
		stem.style = 
			strokeColor : "#567e37"
			strokeWidth: 1
			fillColor: false

		stem.add new paper.Point points.end.x + 3, points.end.y








		# draw paper
		paper.view.draw()

	# RETURN VALUE!
	drawing: drawing


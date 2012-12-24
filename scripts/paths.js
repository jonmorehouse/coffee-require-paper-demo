// Generated by CoffeeScript 1.4.0

define(['paper', 'rectangle'], function(paper, rectangle) {
  var drawing, test;
  test = function() {
    return alert("HELLO WORLD");
  };
  drawing = function(canvas) {
    var path;
    paper.setup(canvas);
    alert("HELLO WORLD");
    path = new paper.Path();
    path.style = {
      fillColor: "rgb(255,36,36)",
      strokeColor: "black",
      strokeWidth: 8
    };
    path.add(new paper.Point(50, 50, path.add(new paper.Point(50, 100))));
    path.add(new paper.Point(100, 50));
    path.add(new paper.Point(100, 100));
    path.closed = true;
    return paper.view.draw();
  };
  return {
    drawing: drawing
  };
});

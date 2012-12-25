// Generated by CoffeeScript 1.4.0

define(['paper'], function(paper) {
  var rectangle, test;
  rectangle = function(x, y, height, width) {
    var path;
    path = new paper.Path();
    path.add(new paper.Point(x, y));
    path.add(new paper.Point(x, y + height));
    path.add(new paper.Point(x + width, y));
    path.add(new paper.Point(x + width, y + height));
    path.closed = true;
    return path;
  };
  test = function() {
    alert(_test)();
    return alert("HELLO WORLD")();
  };
  return {
    rectangle: rectangle,
    test: test
  };
});
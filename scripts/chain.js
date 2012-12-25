// Generated by CoffeeScript 1.4.0
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(['paper'], function(paper) {
  var Chain;
  Chain = (function() {

    function Chain(canvas) {
      this.mouse_up = __bind(this.mouse_up, this);

      this.mouse_over = __bind(this.mouse_over, this);

      this.mouse_down = __bind(this.mouse_down, this);

      this.init = __bind(this.init, this);

      var self;
      this.canvas = canvas;
      this.paper = new paper.PaperScope();
      this.paper.setup(this.canvas);
      this.tool = new this.paper.Tool();
      this.path = new paper.Path();
      this.size = 25;
      this.segments = this.path.segments;
      this.path.style = {
        strokeColor: "blue",
        strokeWidth: 20,
        strokeCap: "round"
      };
      this.init();
      self = this;
      this.tool.onMouseDown = function() {
        return self.mouse_down();
      };
      this.tool.onMouseOver = function() {
        return self.mouse_over();
      };
      this.tool.onMouseUp = function() {
        return self.mouse_up();
      };
    }

    Chain.prototype.init = function() {
      var i, start, _i, _ref;
      start = this.paper.view.center;
      for (i = _i = 0, _ref = this.size; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.path.add(new this.paper.Point(start.x + i * 10, start.y));
      }
      this.paper.view.draw();
      return this.tool.onMouseDown = this.paper.onMouseDown;
    };

    Chain.prototype.mouse_down = function(event) {};

    Chain.prototype.mouse_over = function(event) {};

    Chain.prototype.mouse_up = function(event) {
      return console.log("HELLO WORLD FROM MOUSE UP!!!");
    };

    return Chain;

  })();
  return {
    Chain: Chain
  };
});

// Generated by CoffeeScript 1.4.0
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(['paper'], function(paper) {
  var Chain;
  Chain = (function() {

    Chain.prototype.accuracy = 5;

    function Chain(canvas) {
      this.mouse_up = __bind(this.mouse_up, this);

      this.mouse_move = __bind(this.mouse_move, this);

      this.mouse_down = __bind(this.mouse_down, this);

      this.grow_length = __bind(this.grow_length, this);

      this.init = __bind(this.init, this);

      var self;
      this.canvas = canvas;
      this.paper = new paper.PaperScope();
      this.paper.setup(this.canvas);
      this.tool = new this.paper.Tool();
      this.size = 10;
      this.length = 20;
      this.growing = false;
      this.style = {
        strokeColor: "gray",
        strokeWidth: 15,
        strokeCap: "round"
      };
      this.path = new paper.Path();
      this.segments = this.path.segments;
      this.path.style = this.style;
      this.clicked = false;
      this.first = true;
      this.init();
      self = this;
      this.tool.onMouseDown = function(event) {
        return self.mouse_down(event);
      };
      this.tool.onMouseMove = function(event) {
        return self.mouse_move(event);
      };
      this.tool.onMouseUp = function(event) {
        return self.mouse_up(event);
      };
    }

    Chain.prototype.init = function() {
      var i, start, _i, _ref;
      start = this.paper.view.center;
      for (i = _i = 0, _ref = this.size; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.path.add(new this.paper.Point(start.x + i * 10, start.y));
      }
      this.paper.view.draw();
      this.grow_length();
      return this.tool.onMouseDown = this.paper.onMouseDown;
    };

    Chain.prototype.grow_length = function() {
      if (!this.growing) {
        return false;
      }
      this.length = this.length + 1;
      return setTimeout(this.grow_length, 2000);
    };

    Chain.prototype.difference = function(point_1, point_2) {
      var delta_x, delta_y;
      delta_x = point_1.x - point_2.x;
      delta_y = point_1.y - point_2.y;
      delta_x = delta_x > 0 ? delta_x : -1 * delta_x;
      delta_y = delta_y > 0 ? delta_y : -1 * delta_y;
      return delta_x + delta_y;
    };

    Chain.prototype.mouse_down = function(event) {
      var delta_first, delta_last;
      this.clicked = true;
      delta_first = this.difference(event.downPoint, this.segments[0].point);
      delta_last = this.difference(event.point, this.segments[this.size - 1].point);
      this.first = delta_first < delta_last ? true : false;
      return this.path.selected = true;
    };

    Chain.prototype.mouse_move = function(event) {
      var angle, current, i, next, vector, _i, _ref;
      if (!this.clicked) {
        return;
      }
      this.segments[0].point = event.point;
      for (i = _i = 0, _ref = this.size - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        next = this.segments[i + 1];
        current = this.segments[i];
        angle = (current.point.subtract(next.point)).angle;
        vector = new paper.Point({
          angle: angle,
          length: this.length
        });
        next.point = current.point.subtract(vector);
      }
      return this.path.smooth();
    };

    Chain.prototype.mouse_up = function(event) {
      this.path.style = this.style;
      this.clicked = false;
      return this.path.selected = false;
    };

    return Chain;

  })();
  return {
    Chain: Chain
  };
});


// Task: Use strategy pattern to draw a few colors

protocol Colorable: class {
  func draw()
}

class BrushRed: Colorable {
  func draw() { print("draw red color") }
}

class BrushGreen: Colorable {
  func draw() { print("draw green color") }
}

class Canvas: Colorable {
  var brush: Colorable?

  func set(brush: Colorable) {
    self.brush = brush
  }

  func draw() {
    self.brush?.draw()
  }
}

let brushRed = BrushRed()
let brushGreen = BrushGreen()
let canvas = Canvas()

canvas.set(brush: brushRed)
canvas.draw()

canvas.set(brush: brushGreen)
canvas.draw()

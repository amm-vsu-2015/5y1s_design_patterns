
class Canvas: Colorable {
  var brush: Colorable?

  func set(brush: Colorable) {
    self.brush = brush
  }

  func draw() {
    self.brush?.draw()
  }
}

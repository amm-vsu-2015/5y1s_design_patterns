

class LightCommand: Command {

  private var light: Light

  init(_ light: Light) {
    self.light = light
  }

  func execute() {
      light.on()
  }

}

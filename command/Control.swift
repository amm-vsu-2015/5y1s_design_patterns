


import Foundation

protocol Command {
  func execute()
}

class Brush {
  func draw() { print("drawing with brush") }
  func undo() { print("cleaning") }
}


class LightCommand: Command {
  private var light: Light

  init(_ light: Light) {
    self.light = light
  }

  func execute() {
    light.on()
  }
}

class Control {
  private var commands: [Command] = []

  func set(command: Command) {
    commands.append(command)
  }

  func execute() {
    commands.forEach { $0.execute() }
  }
}


class Invoker {

  static func run(control: Control) {
    control.set(command: LightCommand(Light()))
    control.execute()
  }

}

Invoker.run(control: Control())
















///

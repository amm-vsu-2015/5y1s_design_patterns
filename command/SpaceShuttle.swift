
import Foundation

protocol Command {
    func execute()
    func undo()
}

protocol DeviceSystem {
    func on()
    func off()
    func validate() -> Bool
}


// MARK: - RecoverySystem

class RecoverySystem: DeviceSystem {
    private var enabled: Bool = false
    private var name: String = "Recovery System"

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool {
        return enabled
    }
}

class RecoverySystemOnCommand: Command {
    private let system: RecoverySystem

    init(system: RecoverySystem) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class RecoverySystemOffCommand: Command {
    private let system: RecoverySystem

    init(system: RecoverySystem) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

// MARK: - LaunchSystem

class LaunchSystem: DeviceSystem {
    private var enabled: Bool = false
    private var name: String = "Launch System"

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool {
        return enabled
    }
}

class LaunchSystemOnCommand: Command {
    private let system: LaunchSystem

    init(system: LaunchSystem) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class LaunchSystemOffCommand: Command {
    private let system: LaunchSystem

    init(system: LaunchSystem) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

// MARK: - LandingSystem

class LandingSystem: DeviceSystem {
    private var enabled: Bool = false
    private var name: String = "Landing System"

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool {
        return enabled
    }
}

class LandingSystemOnCommand: Command {
    private let system: LandingSystem

    init(system: LandingSystem) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class LandingSystemOffCommand: Command {
    private let system: LandingSystem

    init(system: LandingSystem) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

// MARK: - GravitySystem

class GravitySystem: DeviceSystem {
    private var enabled: Bool = false
    private var name: String = "Gravity System"

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool {
        return enabled
    }
}

class GravitySystemOnCommand: Command {
    private let system: GravitySystem

    init(system: GravitySystem) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class GravitySystemOffCommand: Command {
    private let system: GravitySystem

    init(system: GravitySystem) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

// MARK: - SpaceEngineSystem

class SpaceEngineSystem: DeviceSystem {
    private var enabled: Bool = false
    private var name: String = "Space Engine System"

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool {
        return enabled
    }
}

class SpaceEngineSystemOnCommand: Command {
    private let system: SpaceEngineSystem

    init(system: SpaceEngineSystem) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class SpaceEngineSystemOffCommand: Command {
    private let system: SpaceEngineSystem

    init(system: SpaceEngineSystem) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

class ShuttleControl {
    private var onCommands: [Command] = []
    private var offCommands: [Command] = []
    private var undoCommands: [Command] = []
    private var store: Store

    init(store: Store) {
        self.store = store
    }

    func add(on onCommand: Command, off offCommand: Command, at place: Int) {
       onCommands.insert(onCommand, at: place)
       offCommands.insert(offCommand, at: place)
    }

    func start(system: Int) {
        onCommands[system].execute()
        undoCommands.append(onCommands[system])
    }

    func stop(system: Int) {
        offCommands[system].execute()
        undoCommands.append(offCommands[system])
    }

    func startAll() {
        for command in onCommands {
            command.execute()
            undoCommands.append(command)
        }
    }

    func stopAll() {
        for command in offCommands {
            command.execute()
            undoCommands.append(command)
        }
    }

    func undo() {
        while (!undoCommands.isEmpty) {
            undoCommands.removeLast().undo()
        }
    }

    func validate() {
        let status = store.validate()

        if status {
            print("--> shuttle control finished successfully.")
        } else {
            print("--> shuttle control finished with erros.")
        }
    }
}

class Store {
    private var systems: [DeviceSystem] = []

    func add(system: DeviceSystem) {
        systems.append(system)
    }

    func validate() -> Bool {
        return !systems.map { $0.validate() }.contains(false)
    }
}

let recoverySystem = RecoverySystem()
let recoveryOnCommand = RecoverySystemOnCommand(system: recoverySystem)
let recoveryOffCommand = RecoverySystemOffCommand(system: recoverySystem)

let launchSystem = LaunchSystem()
let launchSystemOnCommand = LaunchSystemOnCommand(system: launchSystem)
let launchSystemOffCommand = LaunchSystemOffCommand(system: launchSystem)

let landingSystem = LandingSystem()
let landingSystemOnCommand = LandingSystemOnCommand(system: landingSystem)
let landingSystemOffCommand = LandingSystemOffCommand(system: landingSystem)

let gravitySystem = GravitySystem()
let gravitySystemOnCommand = GravitySystemOnCommand(system: gravitySystem)
let gravitySystemOffCommand = GravitySystemOffCommand(system: gravitySystem)

let spaceEngineSystem = SpaceEngineSystem()
let spaceEngineSystemOnCommand = SpaceEngineSystemOnCommand(system: spaceEngineSystem)
let spaceEngineSystemOffCommand = SpaceEngineSystemOffCommand(system: spaceEngineSystem)

let store = Store()

store.add(system: recoverySystem)
store.add(system: launchSystem)
store.add(system: landingSystem)
store.add(system: gravitySystem)
store.add(system: spaceEngineSystem)

let shuttleControl = ShuttleControl(store: store)

shuttleControl.add(on: recoveryOnCommand, off: recoveryOffCommand, at: 0)
shuttleControl.add(on: launchSystemOnCommand, off: launchSystemOffCommand, at: 1)
shuttleControl.add(on: landingSystemOnCommand, off: landingSystemOffCommand, at: 2)
shuttleControl.add(on: gravitySystemOnCommand, off: gravitySystemOffCommand, at: 3)
shuttleControl.add(on: spaceEngineSystemOnCommand, off: spaceEngineSystemOffCommand, at: 4)

shuttleControl.start(system: 0)
shuttleControl.validate()
print()
shuttleControl.startAll()
shuttleControl.validate()
print()
shuttleControl.stopAll()
shuttleControl.validate()

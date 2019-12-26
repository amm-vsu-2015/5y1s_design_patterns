
protocol Command {
    func execute()
    func undo()
}

protocol DeviceSystem {
    var name: String { get }
    func on()
    func off()
    func validate() -> Bool
}

// MARK: - Base classes

class BasicSystem: DeviceSystem {
    private var enabled: Bool = false
    var name: String { "Basic System" }

    func on() {
        print("\(name): is on.")
        enabled = true
    }

    func off() {
        print("\(name): is off.")
        enabled = false
    }

    func validate() -> Bool { enabled }
}

class BasicSystemOnCommand<System: DeviceSystem>: Command {
    let system: System

    init(system: System) {
        self.system = system
    }

    func execute() { system.on() }
    func undo() { system.off() }
}

class BasicSystemOffCommand<System: DeviceSystem>: Command {
    private let system: System

    init(system: System) {
        self.system = system
    }

    func execute() { system.off() }
    func undo() { system.on() }
}

// MARK: - RecoverySystem

class RecoverySystem: BasicSystem {
    override var name: String { "Recovery System" }
}

// MARK: - LaunchSystem

class LaunchSystem: BasicSystem {
    override var name: String { "Launch System" }
}

// MARK: - LandingSystem

class LandingSystem: BasicSystem {
    override var name: String { "Landing System" }
}

// MARK: - GravitySystem

class GravitySystem: BasicSystem {
    override var name: String { "Gravity System" }
}

// MARK: - SpaceEngineSystem

class SpaceEngineSystem: BasicSystem {
    override var name: String { "Space Engine System" }
}

// MARK: - ShuttleControl

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

        Swift.print()
        if status {
            print("-> shuttle control finished successfully.")
        } else {
            print("-> shuttle control finished with errors:")
            store.print()
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

    func print() {
        systems.forEach { (system) in
            let status = system.validate()

            if status {
                Swift.print("[ passed ] \(system.name) is correct.")
            } else {
                Swift.print("[ error ]  \(system.name) has error!")
            }
        }
    }
}

let recoverySystem = RecoverySystem()
let recoveryOnCommand = BasicSystemOnCommand(system: recoverySystem)
let recoveryOffCommand = BasicSystemOffCommand(system: recoverySystem)

let launchSystem = LaunchSystem()
let launchSystemOnCommand = BasicSystemOnCommand(system: launchSystem)
let launchSystemOffCommand = BasicSystemOffCommand(system: launchSystem)

let landingSystem = LandingSystem()
let landingSystemOnCommand = BasicSystemOnCommand(system: landingSystem)
let landingSystemOffCommand = BasicSystemOffCommand(system: landingSystem)

let gravitySystem = GravitySystem()
let gravitySystemOnCommand = BasicSystemOnCommand(system: gravitySystem)
let gravitySystemOffCommand = BasicSystemOffCommand(system: gravitySystem)

let spaceEngineSystem = SpaceEngineSystem()
let spaceEngineSystemOnCommand = BasicSystemOnCommand(system: spaceEngineSystem)
let spaceEngineSystemOffCommand = BasicSystemOffCommand(system: spaceEngineSystem)

let store = Store()

store.add(system: recoverySystem)
store.add(system: launchSystem)
store.add(system: landingSystem)
store.add(system: gravitySystem)
store.add(system: spaceEngineSystem)

let shuttleControl = ShuttleControl(store: store)

shuttleControl.add(on: recoveryOnCommand,          off: recoveryOffCommand,          at: 0)
shuttleControl.add(on: launchSystemOnCommand,      off: launchSystemOffCommand,      at: 1)
shuttleControl.add(on: landingSystemOnCommand,     off: landingSystemOffCommand,     at: 2)
shuttleControl.add(on: gravitySystemOnCommand,     off: gravitySystemOffCommand,     at: 3)
shuttleControl.add(on: spaceEngineSystemOnCommand, off: spaceEngineSystemOffCommand, at: 4)

shuttleControl.start(system: 0)
shuttleControl.validate()

print();print();
shuttleControl.startAll()
shuttleControl.validate()

print();print();
shuttleControl.stopAll()
shuttleControl.validate()


















//

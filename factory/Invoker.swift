
class Invoker {
    static func start() {
        let hens: [Hen] = [
            Factory.makeHen(type: .japan),
            Factory.makeHen(type: .russian),
            Factory.makeHen(type: .usa),
            Factory.makeHen(type: .network)
        ]

        hens.forEach { print($0.description) }
    }
}

Invoker.start()

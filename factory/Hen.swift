
protocol Hen {
    var eggsCount: Int { get }
    var description: String { get }
}

extension Hen {
    var description: String {
        return "I'm Chiken."
    }
}


import Foundation

protocol FileReadable: class {
    // current file url
    var fileURL: URL? { get set }
    // template method
    func update(fileURL: String)
    // setup file url
    func open(_ fileURL: String)
    // process file and write
    func process()
    // show changed file
    func show()
}

// Default realization
extension FileReadable {
    func update(fileURL: String) {
        open(fileURL)
        process()
        show()
    }

    func open(_ fileURL: String) {
        let fileManager = FileManager.default
        let fullPath = "\(fileManager.currentDirectoryPath)/\(fileURL)"
        if fileManager.fileExists(atPath: fullPath) {
            self.fileURL = URL(fileURLWithPath: fullPath)
        }
    }

    func show() {
        if let text = try? String(contentsOf: self.fileURL!, encoding: .utf8) {
            print(text)
        }
    }
}

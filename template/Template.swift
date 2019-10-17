
// 2. Шаблонный метод: тексовый файл.
//    Прочитать файлы и произвести какие-либо действия (счет цифр, верхний регистр букв), затем закрыть

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
        let fullPath = "\(FileManager.default.currentDirectoryPath)/\(fileURL)"
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


// Read digits
class DigitsReader: FileReadable {
  var fileURL: URL?

  func process() {
    do {
        let text = try String(contentsOfFile: self.fileURL!.path, encoding: .utf8)
        let sum = text.components(separatedBy: .newlines).reduce(0) { $0 + (Double($1) ?? 0) }
        let newText = "\(text)\n\(sum)"
        try newText.write(to: self.fileURL!, atomically: true, encoding: .utf8)
    } catch {
        print(error)
    }
  }

}

// Read text
class TextReader: FileReadable {
  var fileURL: URL?

  func process() {
    do {
        let text = try String(contentsOfFile: self.fileURL!.path, encoding: .utf8)
        let newText = text.uppercased()
        try newText.write(to: self.fileURL!, atomically: true, encoding: .utf8)
    } catch {
        print(error)
    }
  }

}

// Run program
let textReader = TextReader()
textReader.update(fileURL: "chars.txt")

let digitsReader = DigitsReader()
digitsReader.update(fileURL: "digits.txt")

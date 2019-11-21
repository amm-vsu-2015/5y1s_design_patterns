
import Foundation

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

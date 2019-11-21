
import Foundation

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

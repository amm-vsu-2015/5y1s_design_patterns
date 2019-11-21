
// Optional user of API
class FileReader {
    static func update(url: String, with processor: FileReadable) {
        processor.update(fileURL: url)
    }
}

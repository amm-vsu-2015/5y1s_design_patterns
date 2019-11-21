
#cat "sources/FileReadable.swift" "sources/DigitsReader.swift" "sources/TextReader.swift" "sources/FileReader.swift" "sources/RunProcess.swift"  | swift -
swiftc "sources/FileReadable.swift" "sources/DigitsReader.swift" "sources/TextReader.swift" "sources/FileReader.swift" "sources/main.swift" -o program

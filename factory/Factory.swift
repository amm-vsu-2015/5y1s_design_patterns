

enum HenType {
  case russian
  case usa
  case japan
  case network
}

class Factory {
    static func makeHen(type: HenType) -> Hen {
        switch type {
        case .russian:
          return RussianHen()
        case .usa:
          return UsaHen()
        case .japan:
          return JapanHen()
        case .network:
          return NetworkHen()
        }
    }
}

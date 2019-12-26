
protocol Contact {
    func getName() -> String
    func getPhoneNumber() -> String
}

protocol Customer {
    func getCompanyName() -> String
    func getCountryName() -> String
}

protocol IncomeData {
    var getCompany: String { get }
    var getCountryCode: String { get }
    var getContactFirstName: String { get }
    var getContactLastName: String { get }
    var getCountryPhoneCode: Int { get }
    var getPhoneNumber: String { get }
}

class UserData: IncomeData {
    var getCompany: String { "Apple" }
    var getCountryCode: String { "CA" }
    var getContactFirstName: String { "Pavlek" }
    var getContactLastName: String { "Box" }
    var getCountryPhoneCode: Int { 2 }
    var getPhoneNumber: String { "999-124-33-11" }
}

class IncomeDataAdapter: Customer, Contact {

    private static var country = [
        "UA": "Ukraine",
        "RU": "Russia",
        "CA": "Canada",
    ]

    private let user: IncomeData;

    init(user: IncomeData) {
        self.user = user;
    }

    // Customer

    func getCompanyName() -> String {
        return user.getCompany
    }

    func getCountryName() -> String {
        return IncomeDataAdapter.country[user.getCountryCode]!
    }

    // Contact

    func getName() -> String {
      return "\(user.getContactLastName), \(user.getContactFirstName)"
    }

    func getPhoneNumber() -> String {
      return "+\(user.getCountryPhoneCode) \(user.getPhoneNumber)"
    }

}

class Main {
    static func start() {
        let adapter = IncomeDataAdapter(user: UserData())

        print(adapter.getCompanyName())
        print(adapter.getCountryName())
        print(adapter.getName())
        print(adapter.getPhoneNumber())
    }
}

Main.start()

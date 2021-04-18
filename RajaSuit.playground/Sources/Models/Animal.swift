import Foundation

enum Animal: String {
    case giraffe
    case ant
    case elephant
}

extension Animal: CaseIterable {
    static func getRandomAnimal() -> Animal {
        return Animal.allCases[Int.random(in: 0..<Animal.allCases.count)]
    }
}

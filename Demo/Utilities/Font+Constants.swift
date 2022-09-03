import SwiftUI

extension Font {
    static func mise(size: CGFloat, weight: Font.Weight) -> Font {
        switch weight {
        case .regular:
            return Font.custom("NotoSans-Regular", size: size)
        case .bold:
            return Font.custom("NotoSans-Bold", size: size)
        case .semibold:
            return Font.custom("NotoSans-SemiBold", size: size)
        default:
            fatalError("Unsupported weight '\(weight)'.")
        }
    }
}

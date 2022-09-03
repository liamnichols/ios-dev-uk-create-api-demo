import UIKit

extension UIBarButtonItem {
    func applyMise() {
        tintColor = UIColor(named: "AccentColor")
        setTitleTextAttributes([.font: UIFont(name: "NotoSans-regular", size: 17)!], for: .normal)
        setTitleTextAttributes([.font: UIFont(name: "NotoSans-regular", size: 17)!], for: .highlighted)
    }
}

extension UINavigationBar {
    func applyMise() {
        titleTextAttributes = [
            .foregroundColor: UIColor(named: "Color/Text/Primary")!,
            .font: UIFont(name: "NotoSans-SemiBold", size: 17)!
        ]

        largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "Color/Text/Primary")!,
            .font: UIFont(name: "NotoSans-Bold", size: 34)!
        ]
    }
}

import UIKit

class BlackBackgroundView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 13
        layer.backgroundColor = BLACK_BACKGROND
    }
}

class BlackBackgroundButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 13
        layer.backgroundColor = BLACK_BACKGROND
    }
}

import UIKit

class FadeButtonAnimation : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.5) {
                    self.alpha = 1.0
                }
            } else  {
                UIView.animate(withDuration: 0.5) {
                    self.alpha = 0.5
                }
            }
        }
    }
}

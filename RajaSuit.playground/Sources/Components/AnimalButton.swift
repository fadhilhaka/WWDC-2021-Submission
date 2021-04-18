import UIKit

final class AnimalButton: UIButton {
    
    convenience init(name: String) {
        self.init()
        self.setImage(UIImage(named: name), for: .normal)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.contentMode = .scaleAspectFit
    }
}

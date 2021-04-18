import UIKit

final class NameLabel: UILabel {
    
    convenience init(name: String) {
        self.init()
        self.text = name
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
        self.font = .boldSystemFont(ofSize: 18)
        self.textAlignment = .center
        self.textColor = UIColor.darkBlueGrey
    }
}

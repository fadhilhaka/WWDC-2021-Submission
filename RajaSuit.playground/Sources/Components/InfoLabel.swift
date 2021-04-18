import UIKit

final class InfoLabel: UILabel {
    
    convenience init(info: String) {
        self.init()
        self.text = info
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
        self.font = .systemFont(ofSize: 12)
        self.textAlignment = .center
        self.textColor = UIColor.darkBlueGrey
    }
}

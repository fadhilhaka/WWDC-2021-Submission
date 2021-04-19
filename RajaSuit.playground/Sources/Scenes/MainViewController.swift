//
//  MainViewController.swift
//  RajaSuit
//
//  Created by Fadhil Hanri on 18/04/21.
//
import UIKit

public final class MainViewController: UIViewController {
    
    private let model = AnimalPrediction()
    
    private let computerLabel = NameLabel(name: "Computer")
    private let playerLabel = NameLabel(name: "Player")
    
    private let computerInfoLabel = InfoLabel(info: "is preparing...")
    private let playerInfoLabel = InfoLabel(info: "")
    
    private let antButton = AnimalButton(name: "ant")
    private let elephantButton = AnimalButton(name: "elephant")
    private let giraffeButton = AnimalButton(name: "giraffe")
    
    private let computerAnimalImage: UIImageView = {
        let img = UIImage(cgImage: (UIImage(named: "ant")?.cgImage)!, scale: 1.0, orientation: .upMirrored)
        let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.image = img
        
        return imageView
    }()
    
    private let playerAnimalImage: UIImageView = {
        let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "ant")
        
        return imageView
    }()
    
    private let prepareLabel: UILabel = {
        let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18)
            label.textAlignment = .center
            label.textColor = UIColor.darkBlueGrey
            label.text = "Pick your animal..."
        
        return label
    }()
    
    private let challengeButton: UIButton = {
        let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.borderWidth = 5.0
            button.layer.borderColor = UIColor.redGrey.cgColor
            button.layer.cornerRadius = 10.0
            button.setTitle("Challange", for: .normal)
            button.setTitleColor(UIColor.darkredGrey, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 18)
            button.backgroundColor = .lightRedGrey
        
        return button
    }()
    
    private var computerAnimal = Animal.getRandomAnimal()
    private var playerAnimal: Animal = .ant
    private var currentResult = [String]()
    private var computerScore = 0
    private var playerScore = 0
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        computerAnimalImage.isHidden = true
        playerAnimalImage.isHidden = true
    }
    
    
    private func setupView() {
        view.backgroundColor = UIColor.blueGrey.withAlphaComponent(0.8)
        view.addSubviews(computerLabel, computerInfoLabel, computerAnimalImage, prepareLabel, playerAnimalImage, antButton, elephantButton, giraffeButton, playerLabel, playerInfoLabel, challengeButton)
        
        let metrics = ["height1": 20.0, "height2": 40.0, "height3": 60.0, "height4": 72.0, "width": UIScreen.main.bounds.width-32.0, "width2": 120.0, "width3": 60.0]
        let viewsDictionary = ["computerLabel": computerLabel, "computerInfoLabel": computerInfoLabel, "computerAnimalImage": computerAnimalImage, "prepareLabel": prepareLabel, "playerAnimalImage": playerAnimalImage, "giraffeButton": giraffeButton, "antButton": antButton, "elephantButton": elephantButton, "playerLabel": playerLabel, "playerInfoLabel": playerInfoLabel, "challengeButton": challengeButton]
        
        let computerVerticalFormat = "V:|-(16.0)-[computerLabel(height2)]-[computerInfoLabel(height1)]-[computerAnimalImage(height3)]"
        let computerVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: computerVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let prepareVerticalFormat = "V:[computerAnimalImage(height3)]-(height2)-[prepareLabel(height2)]"
        let prepareVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: prepareVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let playerAnimalVerticalFormat = "V:[prepareLabel(height2)]-(height2)-[playerAnimalImage(height3)]"
        let playerAnimalVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: playerAnimalVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let giraffeVerticalFormat = "V:[prepareLabel(height2)]-(height2)-[giraffeButton(height3)]"
        let giraffeVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: giraffeVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let antVerticalFormat = "V:[prepareLabel(height2)]-(height2)-[antButton(height3)]"
        let antVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: antVerticalFormat, options: [], metrics: metrics, views: viewsDictionary)
        
        let elephantVerticalFormat = "V:[prepareLabel(height2)]-(height2)-[elephantButton(height3)]"
        let elephantVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: elephantVerticalFormat, options: [], metrics: metrics, views: viewsDictionary)
        
        let playerVerticalFormat = "V:[giraffeButton(height3)]-(height3)-[playerLabel(height2)]-[playerInfoLabel(height1)]"
        let playerVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: playerVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let actionVerticalFormat = "V:[playerInfoLabel(height1)]-(height1)-[challengeButton(height2)]-(>=16.0)-|"
        let actionVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: actionVerticalFormat, options: [.alignAllCenterX], metrics: metrics, views: viewsDictionary)
        
        let computerLabelHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(16.0)-[computerLabel(width)]-(16.0)-|", options: [], metrics: metrics, views: viewsDictionary)
        
        let actionHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=16.0)-[challengeButton(width2)]-(>=16.0)-|", options: [], metrics: metrics, views: viewsDictionary)
        
        let playerHorizontalFormat = "H:|-(>=16.0)-[antButton(width3)]-(height1)-[giraffeButton(width3)]-(height1)-[elephantButton(width3)]-(>=16.0)-|"
        let playerAnimalHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: playerHorizontalFormat, options: [], metrics: metrics, views: viewsDictionary)
        
        let allConstraints: [NSLayoutConstraint] = computerVerticalConstraints + prepareVerticalConstraints + playerAnimalVerticalConstraints + giraffeVerticalConstraints + antVerticalConstraints + elephantVerticalConstraints + playerVerticalConstraints + actionVerticalConstraints +
            computerLabelHorizontalConstraints + actionHorizontalConstraints + playerAnimalHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        setupButton()
    }
    
    func setupButton() {
        antButton.addTarget(self, action: #selector(animalSelected(_:)), for: .touchUpInside)
        elephantButton.addTarget(self, action: #selector(animalSelected(_:)), for: .touchUpInside)
        giraffeButton.addTarget(self, action: #selector(animalSelected(_:)), for: .touchUpInside)
        challengeButton.addTarget(self, action: #selector(startchallenge(_:)), for: .touchUpInside)
    }
    
    func reset() {
        currentResult = []
        playerInfoLabel.text = ""
        challengeButton.setTitle("Challenge", for: .normal)
    }
    
    var previousCondition = [String]()
    var previous_result = "none"
    var previous_animal = "none"
    
    func getAnimalPrediction() -> Animal {
        var predictedAnimal: Animal = .ant
        
        do {
            let prediction = try model.prediction(input: AnimalPrediction_1Input(previous_condition: previousCondition.joined(separator: ", "), previous_result: previous_result, previous_animal: previous_animal, selected_animal: 0, result: "win"))
            let index = Int(prediction.prediction_animal)
            let animal_list: [Animal] = [.ant, .elephant, .giraffe]
            
            guard index > 0 && index < animal_list.count else {
                return Animal.getRandomAnimal()
            }
            
            predictedAnimal = animal_list[index]
            
        } catch {
            print("Error feeding data at: \(#function)")
            predictedAnimal = Animal.getRandomAnimal()
        }
        
        return predictedAnimal
    }
    
    @objc
    func startchallenge(_ sender: UIButton) {
        guard !currentResult.isEmpty else { return }
        
        if currentResult.count == Animal.allCases.count {
            reset()
        }
        
        previousCondition.append(currentResult.isEmpty ? "none" : playerAnimal.rawValue)
        computerAnimal = getAnimalPrediction()
        computerInfoLabel.text = "is preparing..."
        prepareLabel.text = "Pick your animal..."
        computerAnimalImage.isHidden = true
        computerInfoLabel.isHidden = false
        playerAnimalImage.isHidden = true
        antButton.isHidden = false
        elephantButton.isHidden = false
        giraffeButton.isHidden = false
    }
    
    @objc
    func animalSelected(_ sender: UIButton) {
        switch sender {
        case antButton:
            print("Ant selected")
            playerAnimalImage.image = UIImage(named: "ant")
            playerAnimal = .ant
            
        case elephantButton:
            print("Elephant selected")
            playerAnimalImage.image = UIImage(named: "elephant")
            playerAnimal = .elephant
            
        case giraffeButton:
            print("Giraffe selected")
            playerAnimalImage.image = UIImage(named: "giraffe")
            playerAnimal = .giraffe
            
        default:
            break
        }

        updateView()
        processResult()
        previous_animal = playerAnimal.rawValue
    }
    
    func updateView() {
        computerAnimalImage.image = UIImage(cgImage: (UIImage(named: computerAnimal.rawValue)?.cgImage)!, scale: 1.0, orientation: .upMirrored)
        computerAnimalImage.isHidden = false
        computerInfoLabel.isHidden = true
        playerAnimalImage.isHidden = false
        antButton.isHidden = true
        elephantButton.isHidden = true
        giraffeButton.isHidden = true
        
        if currentResult.count == Animal.allCases.count-1 {
            challengeButton.setTitle("Restart", for: .normal)
        }
    }
    
    func processResult() {
        guard playerAnimal != computerAnimal else {
            currentResult.append("⚪️")
            playerInfoLabel.text = currentResult.joined(separator: " ")
            
            prepareLabel.text = "It's a draw.."
            previous_result = "draw"
            
            computerScore += 1
            playerScore += 1
            
            if currentResult.count == 3 {
                prepareLabel.text! += computerScore > playerScore ? " It's over, Computer Wins." : computerScore == playerScore ? " You're both strong." : "\nCongratulation! You Win!!"
            }
            
            return
        }
        
        prepareLabel.text = "You Win!!!"
        previous_result = "lose"
        
        if playerAnimal == .ant && computerAnimal == .elephant {
            currentResult.append("🟢")
            
            playerScore += 3
            
        } else if playerAnimal == .elephant && computerAnimal == .giraffe {
            currentResult.append("🟢")
            
            playerScore += 3
            
        } else if playerAnimal == .giraffe && computerAnimal == .ant {
            currentResult.append("🟢")
            
            playerScore += 3
            
        } else {
            currentResult.append("🔴")
            prepareLabel.text = "You lose..."
            previous_result = "win"
            
            computerScore += 3
        }
        
        playerInfoLabel.text = currentResult.joined(separator: " ")
        
        if currentResult.count == 3 {
            prepareLabel.text! += computerScore > playerScore ? " It's over, Computer Wins." : computerScore == playerScore ? " You're both strong." : " Congratulation! You beat Computer!!"
        }
    }
}

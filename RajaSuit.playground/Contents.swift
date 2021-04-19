/*:
 
# Raja Suit
 
 There are three available animals, each has one weakness and one strength.

 1. Ant, can beat Elephant.
 2. Elephant, can beat Giraffe.
 3. Giraffe, can beat Ant.
 
 ## How to Play

 Pick one from three available animal to fight your opponent.

*/
//: Icon made by [Freepik](https://www.flaticon.com/authors/freepik) from [www.flaticon.com](http://www.flaticon.com/)
  
import UIKit
import PlaygroundSupport

let viewController = MainViewController()
viewController.preferredContentSize = .init(width: 384, height: 512)

PlaygroundPage.current.liveView = MainViewController()

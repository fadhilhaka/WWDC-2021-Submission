/*:
 
 # Title
 
 Text
    It's a game every Indonesian know and play.
*/

//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let viewController = MainViewController()
viewController.preferredContentSize = .init(width: 384, height: 512)

PlaygroundPage.current.liveView = MainViewController()

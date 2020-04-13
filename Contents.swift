//: A SpriteKit based Playground

import PlaygroundSupport
import UIKit
import SpriteKit

class firstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = .blue
        //colocar imagem de fundo
        //let imagem = UIImage(named:"fundoStart.png"
        //let imagemView = UIImageView(image: imagem)
        //imagemView.frame =
        
        
        let label = UILabel()
        label.frame = CGRect (x: 395, y: 260, width: 260, height: 200)
        label.text = "Orfeu"
        label.textColor = .white
        let fontURL = Bundle.main.url(forResource: "Gelio Kleftiko", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        label.font = UIFont(name: "Gelio Kleftiko", size: 100)
        
        
        
        let buttonStart = UIButton()
        buttonStart.frame = CGRect (x: 475, y: 400, width: 110, height: 60)
        buttonStart.setTitle("START", for: .normal)
        let backgroundImage = UIImage(named: "background")
        buttonStart.setImage(backgroundImage, for: .normal)
        view.addSubview(buttonStart)
        buttonStart.addTarget(self, action: #selector(firstViewController.touchedStart), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(buttonStart)
    }
    
    @IBAction func touchedStart(){
        show(secondPage, sender: nil)
    }
}

class secondViewController: UIViewController {
    var orfeu = SKSpriteNode()
    let scene = SKScene(size: CGSize(width: 768, height: 1024))
    var location = CGPoint()
    override func loadView() {
        
        let view = SKView()
        //funcao de reconhecer toque
        scene.backgroundColor = .systemBlue
        view.presentScene(scene)
        view.showsFPS
        self.view = view
        
        
        let fixedGround = SKSpriteNode(imageNamed: "fixedGround")
        fixedGround.setScale(0.5)
        fixedGround.anchorPoint = CGPoint.zero
        scene.addChild(fixedGround)
        
        let cave = SKSpriteNode(imageNamed: "cave")
        cave.anchorPoint = CGPoint.zero
        cave.position = CGPoint(x: 517, y: 600)
        cave.size = CGSize(width: 250, height: 330)
        
        
        let ground1 = SKSpriteNode(imageNamed: "ground1")
        ground1.setScale(0.48)
        ground1.anchorPoint = CGPoint.zero
        ground1.position = CGPoint(x: 177, y: 60)
        
        
        //movement ground 1
        let toRight = SKAction.moveBy(x: 200, y: 150, duration: 5.0)
        let toLeft = SKAction.moveBy(x: -200, y: -150, duration: 5.0)
        let pause = SKAction.moveBy(x:0, y:0, duration: 1.0)
        let sequence = SKAction.sequence([toRight,pause,toLeft,pause])
        let runForever = SKAction.repeatForever(sequence)
        
        let ground2 = SKSpriteNode(imageNamed: "ground2.tif")
        ground2.setScale(0.26)
        ground2.anchorPoint = CGPoint.zero
        ground2.position = CGPoint (x: 322, y: 247)
        
        //movement ground 2
        let toLeft2 = SKAction.moveBy(x: -270, y: 200, duration: 2.0)
        let toRight2 = SKAction.moveBy(x: 270, y: -200, duration: 2.0)
        let sequence2 = SKAction.sequence([toLeft2,pause,toRight2,pause])
        let runForever2 = SKAction.repeatForever(sequence2)
        
        let ground3 = SKSpriteNode(imageNamed: "ground3")
        ground3.setScale(0.20)
        ground3.anchorPoint = CGPoint.zero
        ground3.position = CGPoint(x: 420, y: 709)
        
        //movement ground 3
        let toLeft3 = SKAction.moveBy(x: -230, y: 0 , duration: 3.0)
        let toRight3 = SKAction.moveBy(x: 230, y: 0, duration: 3.0)
        let sequence3 = SKAction.sequence([toLeft3, pause, toRight3, pause])
        let runForever3 = SKAction.repeatForever(sequence3)
        
        let ground4 = SKSpriteNode(imageNamed: "ground4")
        ground4.setScale(0.20)
        ground4.anchorPoint = CGPoint.zero
        ground4.position = CGPoint(x: 100, y: 700)
        
        //movement ground 4
        let up = SKAction.moveBy(x: 0, y: 193, duration: 2.0)
        let down = SKAction.moveBy(x: 0, y: -193 , duration: 2.0)
        let sequence4 = SKAction.sequence([down,pause,up,pause])
        let runForever4 = SKAction.repeatForever(sequence4)
        
        orfeu = SKSpriteNode(imageNamed: "Orfeu2")
        orfeu.setScale(0.20)
        orfeu.anchorPoint = CGPoint.zero
        orfeu.position = CGPoint(x: 140, y: 65)
        
        scene.addChild(ground3)
        scene.addChild(ground2)
        scene.addChild(ground1)
        scene.addChild(ground4)
        scene.addChild(cave)
        scene.addChild(orfeu)
        ground1.run(runForever)
        ground2.run(runForever2)
        ground3.run(runForever3)
        ground4.run(runForever4)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            location = touch.location(in: scene)
            let movement = SKAction.move(to: location, duration: 0.5)
            orfeu.run(movement)
        }
    }
}

let firstPage = firstViewController (screenType: .ipad, isPortrait: false)
let secondPage = secondViewController (screenType: .ipad, isPortrait: false)
secondPage.modalPresentationStyle = .fullScreen

let navigation = UINavigationController(screenType: .ipad, isPortrait: false)
navigation.pushViewController (firstPage, animated: false)
navigation.navigationBar.isHidden =  true

PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
//PlaygroundPage.current.liveView = secondPage.scale(to: 0.5)

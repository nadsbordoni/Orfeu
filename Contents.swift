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
        buttonStart.frame = CGRect (x: 430, y: 350, width: 200, height: 180)
        buttonStart.setTitle("START", for: .normal)
        //colocar uma imagem de fundo
        //buttonStart.backgroundImage(for: <#T##UIControl.State#>)
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
    override func loadView() {
        
        let view = SKView()
    
        let scene = SKScene(size: CGSize(width: 768, height: 1024))
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
        scene.addChild(cave)
        
        let ground1 = SKSpriteNode(imageNamed: "ground1")
        ground1.setScale(0.48)
        ground1.anchorPoint = CGPoint.zero
        ground1.position = CGPoint(x: 177, y: 60)
        scene.addChild(ground1)
        
        //movement
        let toRight = SKAction.moveBy(x: 200, y: 150, duration: 2.0)
        let toLeft = SKAction.moveBy(x: -200, y: -150, duration: 2.0)
        let sequence = SKAction.sequence([toRight,toLeft])
        let runForever = SKAction.repeatForever(sequence)
        
        let orfeu = SKSpriteNode(imageNamed: "Orfeu2")
        orfeu.setScale(0.20)
        orfeu.anchorPoint = CGPoint.zero
        orfeu.position = CGPoint(x: 140, y: 65)
        
        scene.addChild(orfeu)
         ground1.run(runForever)
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

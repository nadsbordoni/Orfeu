//: A SpriteKit based Playground

import PlaygroundSupport
import UIKit
import SpriteKit
import AVFoundation

class firstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = .blue
        let orfeuStart = UIImage(named:"fundoStart.png")
        let imageViewOrfeu = UIImageView(image: orfeuStart)
        imageViewOrfeu.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        view.addSubview(imageViewOrfeu)
        
        
        
        let label = UILabel()
        label.frame = CGRect (x: 305, y: 100, width: 400, height: 400)
        label.text = "orfeu"
        label.textColor = .white
        let fontURL = Bundle.main.url(forResource: "Gelio Kleftiko", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        label.font = UIFont(name: "Gelio Kleftiko", size: 150)
        
        
        
        let buttonStart = UIButton()
        buttonStart.frame = CGRect (x: 460, y: 400, width: 120, height: 60)
        buttonStart.setTitle("START", for: .normal)
        let backgroundImage = UIImage(named: "background")
        buttonStart.setImage(backgroundImage, for: .normal)
        view.addSubview(buttonStart)
        buttonStart.addTarget(self, action: #selector(firstViewController.touchedStart), for: .touchUpInside)
        
        let label2 = UILabel()
        label2.frame = CGRect (x: 484, y: 380, width: 110, height: 100)
        label2.text = "start"
        label2.textColor = .init(red: 0.45, green: 0.18 , blue: 0.22, alpha: 1.0)
        label2.font = UIFont(name: "Gelio Kleftiko", size: 30)
        
        view.addSubview(label)
        view.addSubview(buttonStart)
        view.addSubview(label2)
    }
    
    @IBAction func touchedStart(){
        show(secondPage, sender: nil)
    }
}

class secondViewController: UIViewController {
    var orfeu = SKSpriteNode()
    let scene = SKScene(size: CGSize(width: 768, height: 1024))
    let buttonPause = UIButton()
    let buttonClose = UIButton()
    var buttonMusic = UIButton()
    var buttonActive = false
    let cave = SKSpriteNode(imageNamed: "cave")
    let ground1 = SKSpriteNode(imageNamed: "ground1")
    let ground2 = SKSpriteNode(imageNamed: "ground2.tif")
    let ground3 = SKSpriteNode(imageNamed: "ground3")
    let ground4 = SKSpriteNode(imageNamed: "ground4")
    
    let backgroundPause = SKSpriteNode(imageNamed: "pause3.png")
    let labelPause = UILabel()
    let labelFase = UILabel()
    var backgroundmusic = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        //view
        let view = SKView()
        view.presentScene(scene)
        view.showsFPS
        self.view = view
        //background msuic
        let path = Bundle.main.path(forResource: "Wandering_and_Floating", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            backgroundmusic = try AVAudioPlayer(contentsOf: url)
            backgroundmusic.numberOfLoops = 2
            backgroundmusic.play()
        } catch {
        }
        
        //backgroundImage
        let backgroundImage = SKSpriteNode(imageNamed: "start morfeu1")
        backgroundImage.size = CGSize(width: 768, height: 1024)
        backgroundImage.anchorPoint = CGPoint.zero
        scene.addChild(backgroundImage)
        
        //button pause
        
        buttonPause.frame = CGRect (x: 920, y: 20, width: 80, height: 50)
        let backgroundImageButton = UIImage(named: "background")
        buttonPause.setImage(backgroundImageButton, for: .normal)
        buttonPause.addTarget(self, action: #selector(secondViewController.touchedPause), for: .touchUpInside)
        view.addSubview(buttonPause)
        
        //button Close
        buttonClose.frame = CGRect (x: 920, y: 20, width: 80, height: 50)
        let backgroundImageButton2 = UIImage(named: "background")
        buttonClose.setImage(backgroundImageButton2, for: .normal)
        buttonClose.addTarget(self, action: #selector(secondViewController.touchedClose), for: .touchUpInside)
        
        //label pause
        labelPause.frame = CGRect (x: 938, y: 15, width: 80, height: 60)
        labelPause.text = " || "
        labelPause.textColor = .init(red: 0.45, green: 0.18 , blue: 0.22, alpha: 1.0)
        let fontURL = Bundle.main.url(forResource: "Gelio Kleftiko", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        labelPause.font = UIFont(name: "Gelio Kleftiko", size: 32)
        view.addSubview(labelPause)
        
        //button music
        buttonMusic.frame = CGRect (x: 480, y: 420, width: 100, height: 110)
        let backgroundImageButton3 = UIImage(named: "com musica.png")
        buttonMusic.setImage(backgroundImageButton3, for: .normal)
        buttonMusic.addTarget(self, action: #selector(secondViewController.touchedMusic), for: .touchUpInside)
        
        let fixedGround = SKSpriteNode(imageNamed: "fixedGround")
        fixedGround.setScale(0.5)
        fixedGround.anchorPoint = CGPoint.zero
        scene.addChild(fixedGround)
        
        //cave
        cave.anchorPoint = CGPoint.zero
        cave.position = CGPoint(x: 517, y: 600)
        cave.size = CGSize(width: 250, height: 330)
        
        
        //ground1
        ground1.setScale(0.48)
        ground1.anchorPoint = CGPoint.zero
        ground1.position = CGPoint(x: 177, y: 60)
        
        
        //movement ground 1
        let toRight = SKAction.moveBy(x: 200, y: 150, duration: 5.0)
        let toLeft = SKAction.moveBy(x: -200, y: -150, duration: 5.0)
        let pause = SKAction.moveBy(x:0, y:0, duration: 1.0)
        let sequence = SKAction.sequence([toRight,pause,toLeft,pause])
        let runForever = SKAction.repeatForever(sequence)
        
        //ground2
        ground2.setScale(0.26)
        ground2.anchorPoint = CGPoint.zero
        ground2.position = CGPoint (x: 322, y: 247)
        
        //movement ground 2
        let toLeft2 = SKAction.moveBy(x: -270, y: 200, duration: 2.0)
        let toRight2 = SKAction.moveBy(x: 270, y: -200, duration: 2.0)
        let sequence2 = SKAction.sequence([toLeft2,pause,toRight2,pause])
        let runForever2 = SKAction.repeatForever(sequence2)
        
        //ground3
        ground3.setScale(0.20)
        ground3.anchorPoint = CGPoint.zero
        ground3.position = CGPoint(x: 420, y: 709)
        
        //movement ground 3
        let toLeft3 = SKAction.moveBy(x: -230, y: 0 , duration: 3.0)
        let toRight3 = SKAction.moveBy(x: 230, y: 0, duration: 3.0)
        let sequence3 = SKAction.sequence([toLeft3, pause, toRight3, pause])
        let runForever3 = SKAction.repeatForever(sequence3)
        
        //ground4
        ground4.setScale(0.20)
        ground4.anchorPoint = CGPoint.zero
        ground4.position = CGPoint(x: 100, y: 700)
        
        //movement ground 4
        let up = SKAction.moveBy(x: 0, y: 199, duration: 2.0)
        let down = SKAction.moveBy(x: 0, y: -199, duration: 2.0)
        let sequence4 = SKAction.sequence([down,pause,up,pause])
        let runForever4 = SKAction.repeatForever(sequence4)
        
        //orfeu
        orfeu = SKSpriteNode(imageNamed: "Orfeu2")
        orfeu.size = CGSize(width: 100, height: 140)
        orfeu.anchorPoint = CGPoint.zero
        orfeu.position = CGPoint(x: 140, y: 65)
        
        scene.addChild(ground4)
        scene.addChild(ground3)
        scene.addChild(ground2)
        scene.addChild(ground1)
        scene.addChild(cave)
        scene.addChild(orfeu)
        ground1.run(runForever)
        ground2.run(runForever2)
        ground3.run(runForever3)
        ground4.run(runForever4)
        
    }
    @IBAction func touchedPause(){
        
        buttonPause.removeFromSuperview()
        
        
        //button Close
        view.addSubview(buttonClose)
        
        //label button close
        let labelClose = UILabel()
        labelClose.frame = CGRect (x: 937, y: 14, width: 80, height: 65)
        labelClose.text = " X "
        labelClose.textColor = .init(red: 0.45, green: 0.18 , blue: 0.22, alpha: 1.0)
        let fontURL = Bundle.main.url(forResource: "Gelio Kleftiko", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        labelClose.font = UIFont(name: "Gelio Kleftiko", size: 35)
        view.addSubview(labelClose)
        
        //Pause stuff
        backgroundPause.size = CGSize(width: 470, height: 600)
        backgroundPause.position = CGPoint(x: 390, y: 500)
        scene.addChild(backgroundPause)
        
        //label Fase
        labelFase.frame = CGRect (x: 400, y: 200, width: 250, height: 90)
        labelFase.text = " FASE 1 "
        labelFase.textColor = .init(red: 0.45, green: 0.18 , blue: 0.22, alpha: 1.0)
        labelFase.font = UIFont(name: "Gelio Kleftiko", size: 70)
        view.addSubview(labelFase)
        
        //button music
        view.addSubview(buttonMusic)
        
        
        
    }
    @IBAction func touchedClose(){
        backgroundPause.removeFromParent()
        buttonClose.removeFromSuperview()
        labelFase.removeFromSuperview()
        view.addSubview(buttonPause)
        view.addSubview(labelPause)
        buttonMusic.removeFromSuperview()
        
        
    }
    @IBAction func touchedMusic(){
        if !backgroundmusic.isPlaying {
            backgroundmusic.play()
        }
        else{
            backgroundmusic.stop()
        }
        if buttonActive {
            buttonMusic.setBackgroundImage(UIImage(named: "com musica"), for: .normal)
        } else {
            buttonMusic.setBackgroundImage(UIImage(named: "sem musica"), for: .normal)
        }
        buttonActive = !buttonActive
    }
    
    func moveOrfeu(location: CGPoint) {
        
        var multiplierForDirection: CGFloat
        let orfeuSpeed = scene.frame.size.width / 3.0
        let moveDifference = CGPoint(x: location.x - orfeu.position.x, y: location.y - orfeu.position.y)
        let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        let moveDuration = distanceToMove / orfeuSpeed
        
        if moveDifference.x < 0 {
            multiplierForDirection = 1.0
        } else {
            multiplierForDirection = -1.0
        }
        orfeu.xScale = abs(orfeu.xScale) * multiplierForDirection
        
        let moveAction = SKAction.move(to: location, duration:(TimeInterval(moveDuration)))
        
        orfeu.run(moveAction)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: scene)
        let touchArea1 = CGRect(x: 170, y: 80, width: 100, height: 100)
        let touchArea2 = CGRect(x: 322, y: 247, width: 100, height: 100)
        let touchArea3 = CGRect(x: 100, y: 507, width: 100, height: 100)
        let touchArea4 = CGRect(x: 100, y: 710, width: 100, height: 100)
        let touchArea5 = CGRect(x: 600, y: 709, width: 200, height: 200)
        
        if  touchArea1.contains(location) {
            moveOrfeu(location: location)
            orfeu.removeFromParent()
            ground1.addChild(orfeu)
            orfeu.setScale(2.0)
        }
        if touchArea2.contains(location) && orfeu.parent == ground1 {
            moveOrfeu(location: location)
            orfeu.removeFromParent()
            ground2.addChild(orfeu)
            orfeu.setScale(3.5)
        }
        if touchArea3.contains(location) && orfeu.parent == ground2 {
            moveOrfeu(location: location)
            orfeu.removeFromParent()
            ground4.addChild(orfeu)
            orfeu.setScale(4.5)
        }
        
        if touchArea4.contains(location) && orfeu.parent == ground4 {
            moveOrfeu(location: location)
            orfeu.removeFromParent()
            ground3.addChild(orfeu)
            orfeu.setScale(4.5)
            
        }
        
        if touchArea5.contains(location) && orfeu.parent == ground3 {
            orfeu.position = CGPoint(x: 585, y: 723)
            orfeu.removeFromParent()
            scene.addChild(orfeu)
            orfeu.setScale(1.0)
        }
    }
}

let firstPage = firstViewController()

let secondPage = secondViewController(screenType: .ipad, isPortrait: false)

let navigation = UINavigationController(screenType: .ipad, isPortrait: false)
navigation.pushViewController (firstPage, animated: false)
navigation.navigationBar.isHidden =  true
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
//PlaygroundPage.current.liveView = secondPage.scale(to: 0.5)

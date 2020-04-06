//: A SpriteKit based Playground

import PlaygroundSupport
import UIKit

class firstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = .black
        //colocar imagem de fundo
        //let imagem = UIImage(named:"fundoStart.png"
        //let imagemView = UIImageView(image: imagem)
        //imagemView.frame =
        
        
        let label = UILabel()
        label.frame = CGRect (x: 120, y: 200, width: 200, height: 75)
        label.text = "Orfeu"
        label.textColor = .white
        let fontURL = Bundle.main.url(forResource: "Gelio Kleftiko", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        label.font = UIFont(name: "Gelio Kleftiko", size: 50)
        
        
        
        let buttonStart = UIButton()
        buttonStart.frame = CGRect (x: 90, y: 260, width: 200, height: 40)
        buttonStart.setTitle("start", for: .normal)
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
        let view = UIView()
        view.backgroundColor = .blue
        self.view = view
    }
}

let firstPage = firstViewController (screenType: .ipad, isPortrait: false)
let secondPage = secondViewController (screenType: .ipad, isPortrait: false)
secondPage.modalPresentationStyle = .fullScreen

let navigation = UINavigationController(screenType: .ipad, isPortrait: false)
navigation.pushViewController (firstpage, animated: false)
navigation.navigationBar.isHidden =  true

PlaygroundPage.current.liveView = navigation.scale(to: 0.5)

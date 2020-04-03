//: A SpriteKit based Playground

import PlaygroundSupport
import UIKit

class MyViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1194, height: 834)
        view.backgroundColor = .black
        
        
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
        buttonStart.addTarget(self, action: #selector(MyViewController.touchedStart), for: .touchUpInside)
        self.view = view
        view.addSubview(label)
        view.addSubview(buttonStart)
    }
    
    @IBAction func touchedStart(){
        //ir pra proxima pagina
    }
}
let firstPage = MyViewController()
PlaygroundPage.current.liveView = firstPage


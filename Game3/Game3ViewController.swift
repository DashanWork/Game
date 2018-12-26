//
//  Game3ViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/19.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game3ViewController: UIViewController {
    
    class func getGame3() -> Game3ViewController{
        let vc = UIStoryboard.init(name: "Game3", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game3ViewControllerID") as! Game3ViewController
        return vc
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: click and action
    @IBAction func clickRule(_ sender: Any) {
        Game3RuleViewController.presentGame3Rule(rootVC: self)
    }
    @IBAction func clickSingle(_ sender: Any) {
        let game = Game3DetailViewController.getGame3Detail(type: 0)
        self.present(game, animated: true, completion: nil)
    }
    @IBAction func clickMedium(_ sender: Any) {
        let game = Game3DetailViewController.getGame3Detail(type: 1)
        self.present(game, animated: true, completion: nil)
    }
    @IBAction func clickHard(_ sender: Any) {
        let game = Game3DetailViewController.getGame3Detail(type: 2)
        self.present(game, animated: true, completion: nil)
    }
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

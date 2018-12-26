//
//  Game1ViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/14.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game1ViewController: UIViewController {
    
    class func getGame1ViewController() -> Game1ViewController{
        let vc = UIStoryboard.init(name: "Game1", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game1ViewControllerID") as! Game1ViewController
        return vc
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    func setUp(){
        self.navigationItem.hidesBackButton = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - click and action
    @IBAction func click9(_ sender: Any) {
        let detail = Game1DetailViewController.getGame1DetailViewController(type: 0)
        self.present(detail, animated: true, completion: nil)
    }
    
    @IBAction func click16(_ sender: Any) {
        let detail = Game1DetailViewController.getGame1DetailViewController(type: 1)
        self.present(detail, animated: true, completion: nil)
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickRule(_ sender: Any) {
        Game1RuleViewController.presentGame1Rule(rootVC: self)
    }
    
}

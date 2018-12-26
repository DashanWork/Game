//
//  Game2ViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/16.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game2ViewController: UIViewController {
    @IBOutlet weak var button1_1: UIButton!
    @IBOutlet weak var button1_2: UIButton!
    @IBOutlet weak var button1_3: UIButton!
    @IBOutlet weak var button2_1: UIButton!
    @IBOutlet weak var button2_2: UIButton!
    @IBOutlet weak var button2_3: UIButton!
    @IBOutlet weak var button3_1: UIButton!
    @IBOutlet weak var button3_2: UIButton!
    @IBOutlet weak var button3_3: UIButton!
    var gameArr : [String]?
    
    
    class func getGame2ViewController() -> Game2ViewController{
        let vc = UIStoryboard.init(name: "Game2", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game2ViewControllerID") as! Game2ViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUp()
    }
    
    func setUp(){
        self.gameArr = AppManager.shareInstance.getGame2()
        let game1 = self.gameArr![0].intValue
        let game2 = self.gameArr![1].intValue
        let game3 = self.gameArr![2].intValue
        switch game1 % 10 {
        case 1:
            self.button1_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button1_2.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
            self.button1_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)

        case 2:
            self.button1_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button1_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button1_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
        case 3:
            self.button1_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button1_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button1_3.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
        default:
            break
        }
        
        switch game2 % 10 {
        case 1:
            self.button2_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button2_2.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
            self.button2_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
        case 2:
            self.button2_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button2_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button2_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
        case 3:
            self.button2_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button2_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button2_3.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
        default:
            break
        }
        
        switch game3 % 10 {
        case 1:
            self.button3_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button3_2.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
            self.button3_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
        case 2:
            self.button3_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button3_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button3_3.setBackgroundImage(UIImage.init(named: "guanka2"), for: .normal)
        case 3:
            self.button3_1.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button3_2.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
            self.button3_3.setBackgroundImage(UIImage.init(named: "guanka1"), for: .normal)
        default:
            break
        }
    }
    
    
    //MARK: - click and action
    @IBAction func click1_1(_ sender: Any) {
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 11)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click1_2(_ sender: Any) {
        if self.gameArr![0].intValue == 11{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 12)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click1_3(_ sender: Any) {
        if self.gameArr![0].intValue != 13{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 13)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click2_1(_ sender: Any) {
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 21)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click2_2(_ sender: Any) {
        if self.gameArr![1].intValue == 21{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 22)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click2_3(_ sender: Any) {
        if self.gameArr![1].intValue != 23{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 23)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click3_1(_ sender: Any) {
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 31)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click3_2(_ sender: Any) {
        if self.gameArr![2].intValue == 31{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 32)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func click3_3(_ sender: Any) {
        if self.gameArr![2].intValue != 33{
            return
        }
        let gameDetail = Game2DetailViewController.getGame2Detail(type: 33)
        self.present(gameDetail, animated: true, completion: nil)
    }
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

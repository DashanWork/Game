//
//  Game2DetailViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/16.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game2DetailViewController: UIViewController {
    let majiangSize = CGSize.init(width: 41, height: 64)
    var type: Int? //11:简单1 12:简单2 13:简单3
                   //21:中等1 22:中单2 23:中单3
                   //31:困难1 32:困难2 33:困难3
    
    class func getGame2Detail(type: Int) -> Game2DetailViewController{
        let vc = UIStoryboard.init(name: "Game2", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game2DetailViewControllerID") as! Game2DetailViewController
        vc.type = type
        return vc
    }
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    var timeNum: Int? = 20
    var time : Timer?
    var btnArr : [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    func setUp(){
        weak var weakSelf = self
        self.mainView.layer.cornerRadius = 5
        self.time = Timer.scheduledTimer(timeInterval: 1, target: weakSelf!, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        self.time?.fireDate = Date.distantFuture
        self.reset()
        
    }
    
    func reset(){
        
        switch (self.type! % 10){
        case 1:
            self.timeNum = 30
        case 2:
            self.timeNum = 20
        case 3:
            self.timeNum = 15
        default:
            break
        }
        self.time?.fireDate = Date.distantPast
        var fromX : CGFloat = 0
        var listNum : Int = 3
        var lineNum : Int = 5
        switch (self.type! / 10) {
        case 1:
            fromX = CGFloat(self.mainView.frame.size.width/2 - majiangSize.width/2*3 - 8)
            listNum = 3
            lineNum = 5
        case 2:
            fromX = CGFloat(self.mainView.frame.size.width/2 - majiangSize.width/2*5 - 8*2)
            listNum = 5
            lineNum = 6
        case 3:
            fromX = CGFloat(self.mainView.frame.size.width/2 - majiangSize.width/2*7 - 8*3)
            listNum = 7
            lineNum = 7
        default:
            break
        }
        let random : Int = Int(arc4random_uniform(UInt32(listNum * lineNum - 1)))
        for n in 0..<(listNum * lineNum) {
            let btn : UIButton
            if n < self.btnArr?.count{
                btn = self.btnArr![n]
            }else{
                btn = UIButton.init(type: .custom)
            }
            
            if !(random == n){
                btn.setBackgroundImage(UIImage.init(named: "majiang1"), for: .normal)
                btn.accessibilityIdentifier = "1"
            }else{
                btn.setBackgroundImage(UIImage.init(named: "majiang2"), for: .normal)
                btn.accessibilityIdentifier = "2"
            }
            btn.addTarget(self, action: #selector(clickBtn(btn:)), for: .touchUpInside)
            let x = fromX + majiangSize.width * CGFloat(n % listNum) + 8 * CGFloat(n % listNum)
            let y = 45 + (majiangSize.height + 8) * CGFloat(n / listNum)
            btn.frame = CGRect.init(x: x, y: y, width: majiangSize.width, height: majiangSize.height)
            self.mainView.addSubview(btn)
            self.btnArr?.append(btn)
        }
    }
    
    
    func gameEnd(win: Bool){
        self.time?.fireDate = Date.distantFuture
        if !win{
            Game2ResultViewController.presentGame2Result(rootVC: self, type: 0)
        }else{
            if timeNum >= 10{
                Game2ResultViewController.presentGame2Result(rootVC: self, type: 3)
            }else if timeNum >= 5{
                Game2ResultViewController.presentGame2Result(rootVC: self, type: 2)
            }else if timeNum > 0{
                Game2ResultViewController.presentGame2Result(rootVC: self, type: 1)
            }
            let num = self.type! % 10
            if num != 3{
                AppManager.shareInstance.saveGame2(num: self.type! + 1)
                
            }
        }

    }
    
    func timeFunc(){
        self.timeNum = self.timeNum! - 1
        self.timeLabel.text = "计时：\(self.timeNum ?? 0)s"
        if timeNum == 0{
            self.time?.fireDate = Date.distantFuture
            self.gameEnd(win: false)
        }
    }
    
    func clickBtn(btn: UIButton){
        if btn.accessibilityIdentifier == "1" {
            return
        }else if btn.accessibilityIdentifier == "2"{
            //成功
            self.gameEnd(win: true)
        }
    }
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension Game2DetailViewController: Game2ResultDelegate{
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func again() {
        self.reset()
    }
    
    
}

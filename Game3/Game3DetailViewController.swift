//
//  Game3DetailViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/19.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game3DetailViewController: UIViewController {
    
    let gameArr : [[[Int]]] =    [[[2,9,0,0,0,0,0,7,6,8,0,0,0,0,3,0,0,5,0,0,4,0,6,9,1,0,0,0,4,7,0,2,0,0,0,0,0,0,9,4,0,6,7,0,0,0,0,0,0,1,0,3,6,0,0,0,1,5,7,0,2,0,0,9,0,0,8,0,0,0,0,1,4,8,0,0,0,0,0,3,7],[3,0,7,0,0,4,9,0,2,0,0,2,0,7,0,4,5,0,9,0,0,0,0,2,1,0,0,0,0,0,0,1,0,2,9,0,0,8,0,0,2,0,0,6,0,0,5,1,0,6,0,0,0,0,0,0,3,6,0,0,0,0,5,0,9,6,0,3,0,7,0,0,1,0,8,7,0,0,6,0,9]],[[0,6,0,0,0,0,0,0,0,5,0,0,8,0,0,6,0,0,0,0,0,7,6,0,8,0,3,6,8,0,1,0,0,0,4,0,0,3,0,4,0,7,0,6,0,0,7,0,0,0,8,3,0,2,9,0,6,0,7,2,0,0,0,0,0,8,0,0,4,0,0,6,0,0,0,0,0,0,0,5,0],[8,0,7,3,0,0,0,0,4,0,6,0,0,9,1,0,5,0,0,0,5,0,0,0,6,0,9,0,5,0,1,0,6,0,0,2,0,3,0,0,7,0,0,4,0,6,0,0,2,0,8,0,9,0,7,0,9,0,0,0,4,0,0,0,2,0,4,8,0,0,6,0,1,0,0,0,0,3,7,0,8]],[[0,7,9,0,0,0,6,0,0,5,0,2,0,6,0,0,7,0,0,0,0,0,0,0,0,5,0,0,0,0,9,2,0,1,3,0,0,0,0,7,0,1,0,0,0,0,1,8,0,4,3,0,0,0,0,6,0,0,0,0,0,0,0,0,5,0,0,3,0,9,0,1,0,0,1,0,0,0,8,6,0],[0,0,4,9,0,0,2,0,0,0,0,8,1,0,0,0,7,0,0,3,9,0,5,0,0,0,6,0,4,1,0,0,0,6,0,0,0,9,0,0,0,0,0,8,0,0,0,5,0,0,0,9,1,0,9,0,0,0,4,0,3,5,0,0,1,0,0,0,2,7,0,0,0,0,3,0,0,9,8,0,0]]]
    let answerArr : [[[Int]]] = [[[2,9,3,1,5,8,4,7,6,8,1,6,7,4,3,9,2,5,7,5,4,2,6,9,1,8,3,6,4,7,3,2,5,8,1,9,1,3,9,4,8,6,7,5,2,5,2,8,9,1,7,3,6,4,3,6,1,5,7,4,2,9,8,9,7,5,8,3,2,6,4,1,4,8,2,6,9,1,5,3,7],[3,6,7,1,5,4,9,8,2,8,1,2,9,7,6,4,5,3,9,4,5,3,8,2,1,7,6,6,3,4,5,1,7,2,9,8,7,8,9,4,2,3,5,6,1,2,5,1,8,6,9,3,4,7,4,7,3,6,9,1,8,2,5,5,9,6,2,3,8,7,1,4,1,2,8,7,4,5,6,3,9]],[[8,6,3,2,4,1,5,7,9,5,1,7,8,3,9,6,2,4,4,9,2,7,6,5,8,1,3,6,8,9,1,2,3,7,4,5,2,3,5,4,9,7,1,6,8,1,7,4,6,5,8,3,9,2,9,5,6,3,7,2,4,8,1,7,2,8,5,1,4,9,3,6,3,4,2,9,8,6,2,5,7],[8,9,7,3,6,5,2,1,4,4,6,2,8,9,1,3,5,7,3,1,5,7,2,4,6,8,9,9,5,4,1,3,6,8,7,2,2,3,8,5,7,9,1,4,6,6,7,1,2,4,8,5,9,3,7,8,9,6,1,2,4,3,5,5,2,3,4,8,7,9,6,1,1,4,6,9,5,3,7,2,8]],[[4,7,9,3,8,5,6,1,2,5,3,2,1,6,9,4,7,8,1,8,6,4,7,2,3,5,9,7,4,5,9,2,8,1,3,6,6,9,3,7,5,1,2,8,4,2,1,8,6,4,3,7,9,5,9,6,4,8,1,7,5,2,3,8,5,7,2,3,6,9,4,1,3,2,1,5,9,4,8,6,7],[1,5,4,9,6,7,2,3,8,2,6,8,1,3,4,5,7,9,7,3,9,2,5,8,1,4,6,3,4,1,8,9,5,6,2,7,6,9,2,7,1,3,4,8,5,8,7,5,4,2,6,9,1,3,9,8,7,6,4,1,3,5,2,5,1,6,3,8,2,7,9,4,4,2,3,5,7,9,8,6,1]]]
    var type : Int? //0简单，1中等，2困难
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    var time: Timer?
    var timeNum: Int? = 10*60
    var playArr: [Int]?
    var answergameArr: [Int]?
    var gameViewArr: [Game3SingleView]?
    
    class func getGame3Detail(type: Int) -> Game3DetailViewController{
        let vc = UIStoryboard.init(name: "Game3", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game3DetailViewControllerID") as! Game3DetailViewController
        vc.type = type
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    func setUp(){
        self.gameViewArr = [Game3SingleView]()
        self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeGo), userInfo: nil, repeats: true)
        self.time?.fireDate = Date.distantPast
        let random = Int(arc4random() % 2)
        let arr = self.gameArr[self.type!][random]
//        let arr = self.gameArr[0][0]
        for n in 0..<arr.count {
            let num = arr[n]
            let width = self.mainView.frame.width / 9
            let height = self.mainView.frame.height / 9
            let x = width * CGFloat(n % 9)
            let y = height * CGFloat(n / 9)
            let gameView = Game3SingleView.init(frame: CGRect.init(x: x, y: y, width: width, height: height))
            gameView.delegate = self
            gameView.setGame(num: num, viewNum: n)
            self.mainView.addSubview(gameView)
            self.gameViewArr?.append(gameView)
        }
        self.playArr = arr
        self.answergameArr = self.answerArr[self.type!][random]
        
    }
    
    //MARK: click and action
    func timeGo(){
        self.timeNum = self.timeNum! - 1
        self.timeLabel.text = "计时：\(self.timeNum! / 60):\(self.timeNum! % 60)"
        if self.timeNum == 0{
            self.time?.fireDate = Date.distantFuture
            self.resignFirstResponder()
            self.gameEnd(type: 1)
        }
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //重置
    func reset(){
        self.timeNum = 10*60
        self.time?.fireDate = Date.distantPast
        let random = Int(arc4random() % 2)
        let arr = self.gameArr[self.type!][random]
        for n in 0..<arr.count {
            let num = arr[n]
            let width = self.mainView.frame.width / 9
            let height = self.mainView.frame.height / 9
            let x = width * CGFloat(n % 9)
            let y = height * CGFloat(n / 9)
//            let gameView = Game3SingleView.init(frame: CGRect.init(x: x, y: y, width: width, height: height))
            let gameView = self.gameViewArr![n]
            gameView.delegate = self
            gameView.setGame(num: num, viewNum: n)
            self.mainView.addSubview(gameView)
        }
        self.playArr = arr
        self.answergameArr = self.answerArr[self.type!][random]
    }
    
    //判断输赢
    func judge(){
        var end = true
        for n in 0..<(self.answergameArr?.count)! {
            let playNum = self.playArr![n]
            let answerNum = self.answergameArr![n]
            if playNum != answerNum{
                end = false
            }
        }
        if end{
            self.gameEnd(type: 0)
        }
    }
    
    func gameEnd(type: Int){
        Game3ResultViewController.presentGame3Result(type: type, rootVC: self)
    }
    

}

extension Game3DetailViewController: Game3SingViewDelegate{
    func change(num: Int, viewNum: Int) {
        self.playArr![viewNum] = num
        self.judge()
        print("\(self.playArr!)")
    }
    
    
}

extension Game3DetailViewController: Game3ResultDelegate{
    func again() {
        self.reset()
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

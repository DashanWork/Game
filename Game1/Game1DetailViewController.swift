//
//  Game1DetailViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/14.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game1DetailViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    var type : Int? //0: 9宫格，1：16宫格
    var btnArr : [UIButton]?
    var imageArr : [String] = ["tushi","tushi1","tushi2","tushi3"]
    var empty : Int?
    class func getGame1DetailViewController(type : Int) -> Game1DetailViewController{
        let vc = UIStoryboard.init(name: "Game1", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game1DetailViewControllerID") as! Game1DetailViewController
        vc.type = type
        return vc
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func setUp(){
        self.btnArr = [UIButton]()
        let imageStr = self.imageArr[Int(arc4random() % UInt32(self.imageArr.count))]
        self.mainImage.image = UIImage.init(named: imageStr)
        if type == 0{
            self.empty = 8
            for i in 0...7{
                let btnX = CGFloat(i % 3) * (self.mainView.frame.width/3)
                let btnY = CGFloat(i / 3) * (self.mainView.frame.height/3)
                let btnWidth = self.mainView.frame.width/3
                let btnHeight = self.mainView.frame.height/3
                let imageView = self.cutImage(imageName: imageStr, frame: CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight))
                let btn = UIButton.init(type: .custom)
                btn.frame = CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight)
                btn.setBackgroundImage(imageView.image, for: .normal)
                btn.layer.borderWidth = 0.5
                btn.layer.borderColor = UIColor.white.cgColor
                btn.accessibilityIdentifier = "\(i)"
                btn.tag = 10000 + i
                btn.addTarget(self, action: #selector(clickMove(btn:)), for: .touchUpInside)
                self.mainView.addSubview(btn)
                self.btnArr?.append(btn)
            }
            var itemArr = self.btnArr
//            for i in 0...7{
//                let num = 7 - i
//                let randomNum = Int(arc4random_uniform(UInt32(num)))
//                let btn = itemArr![randomNum]
//                let btnX = CGFloat(i % 3) * (self.mainView.frame.width/3)
//                let btnY = CGFloat(i / 3) * (self.mainView.frame.height/3)
//                let btnWidth = self.mainView.frame.width/3
//                let btnHeight = self.mainView.frame.height/3
//                btn.frame = CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight)
//                itemArr?.remove(at: randomNum)
//            }
            self.randomPicture(pictureArr: self.btnArr!, emptyInt: self.empty!, num: 50)
        }else if type == 1{
            self.empty = 15
            for i in 0...14{
                let btnX = CGFloat(i % 4) * (self.mainView.frame.width/4)
                let btnY = CGFloat(i / 4) * (self.mainView.frame.height/4)
                let btnWidth = self.mainView.frame.width/4
                let btnHeight = self.mainView.frame.height/4
                let imageView = self.cutImage(imageName: imageStr, frame: CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight))
                let btn = UIButton.init(type: .custom)
                btn.frame = CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight)
                btn.setBackgroundImage(imageView.image, for: .normal)
                btn.layer.borderWidth = 0.5
                btn.layer.borderColor = UIColor.white.cgColor
                btn.accessibilityIdentifier = "\(i)"
                btn.tag = 10000 + i
                btn.addTarget(self, action: #selector(clickMove(btn:)), for: .touchUpInside)
                self.mainView.addSubview(btn)
                self.btnArr?.append(btn)
            }
            var itemArr = self.btnArr
//            for i in 0...14{
//                let num = 14 - i
//                let randomNum = Int(arc4random_uniform(UInt32(num)))
//                let btn = itemArr![randomNum]
//                let btnX = CGFloat(i % 4) * (self.mainView.frame.width/4)
//                let btnY = CGFloat(i / 4) * (self.mainView.frame.height/4)
//                let btnWidth = self.mainView.frame.width/4
//                let btnHeight = self.mainView.frame.height/4
//                btn.frame = CGRect.init(x: btnX, y: btnY, width: btnWidth, height: btnHeight)
//                itemArr?.remove(at: randomNum)
//            }
            self.randomPicture(pictureArr: self.btnArr!, emptyInt: self.empty!, num: 100)
        }
    }
    
    //游戏重置
    func gameReset(){
        for btn in self.btnArr! {
            btn.removeFromSuperview()
        }
        self.setUp()
    }
    
    //判赢
    func winOrFail() -> Bool{
        var win : Bool = true
        for i in 0...(self.btnArr?.count)! - 1{
            let btn = self.btnArr![i]
            if self.type == 0{
                let rect = btn.frame
                let btnX = lround(Double(rect.origin.x/(self.mainView.frame.size.width/3)))
                let btnY = lround(Double(rect.origin.y/(self.mainView.frame.size.height/3)))
//                print("\(btn.accessibilityIdentifier ?? "")   \(btnX)   \(btnY)")
                switch btn.accessibilityIdentifier{
                case "0":
                    if !(btnX == 0 && btnY == 0){
                        win = false
                    }
                case "1":
                    if !(btnX == 1 && btnY == 0){
                        win = false
                    }
                case "2":
                    if !(btnX == 2 && btnY == 0){
                        win = false
                    }
                case "3":
                    if !(btnX == 0 && btnY == 1){
                        win = false
                    }
                case "4":
                    if !(btnX == 1 && btnY == 1){
                        win = false
                    }
                case "5":
                    if !(btnX == 2 && btnY == 1){
                        win = false
                    }
                case "6":
                    if !(btnX == 0 && btnY == 2){
                        win = false
                    }
                case "7":
                    if !(btnX == 1 && btnY == 2){
                        win = false
                    }
                default:
                    win = true
                }
            }else if self.type == 1{
                let rect = btn.frame
                let btnX = lround(Double(rect.origin.x/(self.mainView.frame.size.width/4)))
                let btnY = lround(Double(rect.origin.y/(self.mainView.frame.size.height/4)))
                switch btn.accessibilityIdentifier{
                case "0":
                    if !(btnX == 0 && btnY == 0){
                        win = false
                    }
                case "1":
                    if !(btnX == 1 && btnY == 0){
                        win = false
                    }
                case "2":
                    if !(btnX == 2 && btnY == 0){
                        win = false
                    }
                case "3":
                    if !(btnX == 3 && btnY == 0){
                        win = false
                    }
                case "4":
                    if !(btnX == 0 && btnY == 1){
                        win = false
                    }
                case "5":
                    if !(btnX == 1 && btnY == 1){
                        win = false
                    }
                case "6":
                    if !(btnX == 2 && btnY == 1){
                        win = false
                    }
                case "7":
                    if !(btnX == 3 && btnY == 1){
                        win = false
                    }
                case "8":
                    if !(btnX == 0 && btnY == 2){
                        win = false
                    }
                case "9":
                    if !(btnX == 1 && btnY == 2){
                        win = false
                    }
                case "10":
                    if !(btnX == 2 && btnY == 2){
                        win = false
                    }
                case "11":
                    if !(btnX == 3 && btnY == 2){
                        win = false
                    }
                case "12":
                    if !(btnX == 0 && btnY == 3){
                        win = false
                    }
                case "13":
                    if !(btnX == 1 && btnY == 3){
                        win = false
                    }
                case "14":
                    if !(btnX == 2 && btnY == 3){
                        win = false
                    }
                default:
                    win = true
                }
            }
            
        }
        return win
    }

    
    //MARK: - click and action
    @IBAction func clickChange(_ sender: Any) {
        //换图
        self.gameReset()
    }
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func clickMove(btn : UIButton){
        if self.type == 0{
            //9
            let emptyX = self.empty! % 3
            let emptyY = self.empty! / 3
            let btnRect = btn.frame
            let btnX = lround(Double(btnRect.origin.x / (self.mainView.frame.width/3)))
            let btnY = lround(Double(btnRect.origin.y / (self.mainView.frame.height/3)))
            UIView.animate(withDuration: 0.3, animations: {
                if btnX == emptyX{
                    if btnY == emptyY + 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x, y: btnRect.origin.y - (self.mainView.frame.height/3), width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! + 3
                    }else if btnY == emptyY - 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x, y: btnRect.origin.y + (self.mainView.frame.height/3), width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! - 3
                    }
                }else if btnY == emptyY{
                    if btnX == emptyX + 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x - (self.mainView.frame.width/3), y: btnRect.origin.y, width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! + 1
                    }else if btnX == emptyX - 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x + (self.mainView.frame.width/3), y: btnRect.origin.y, width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! - 1
                    }
                }
            }) { (true) in
                if self.winOrFail(){
                    Game1ResultViewController.presentGame1Result(rootVC: self, type: 3)
                }
            }
        }else if self.type == 1{
            //16
            let emptyX = self.empty! % 4
            let emptyY = self.empty! / 4
            let btnRect = btn.frame
            let btnX = lround(Double(btnRect.origin.x / (self.mainView.frame.width/4)))
            let btnY = lround(Double(btnRect.origin.y / (self.mainView.frame.height/4)))
            UIView.animate(withDuration: 0.3, animations: {
                if btnX == emptyX{
                    if btnY == emptyY + 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x, y: btnRect.origin.y - (self.mainView.frame.height/4), width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! + 4
                    }else if btnY == emptyY - 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x, y: btnRect.origin.y + (self.mainView.frame.height/4), width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! - 4
                    }
                }else if btnY == emptyY{
                    if btnX == emptyX + 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x - (self.mainView.frame.width/4), y: btnRect.origin.y, width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! + 1
                    }else if btnX == emptyX - 1{
                        btn.frame = CGRect.init(x: btnRect.origin.x + (self.mainView.frame.width/4), y: btnRect.origin.y, width: btnRect.size.width, height: btnRect.size.height)
                        self.empty = self.empty! - 1
                    }
                }
            }) { (true) in
                if self.winOrFail(){
                    Game1ResultViewController.presentGame1Result(rootVC: self, type: 3)
                }
            }
        }
        
        
        
        
    }
    
    func cutImage(imageName: String, frame: CGRect) -> UIImageView{
        let image = UIImage.init(named: imageName)
        let newimage = image?.resize(self.mainView.bounds.size)
        let cgImage = newimage?.cgImage
        let newCgImage = cgImage?.cropping(to: frame)
        let newImageView = UIImageView.init(image: UIImage.init(cgImage: newCgImage!))
        return newImageView
    }
    
    
    //打乱
    func randomPicture(pictureArr: [UIButton], emptyInt: Int, num: Int){
        var emptyNum = emptyInt
        for _ in 0..<num {
            if self.type == 0{
                let width = self.mainView.frame.width/3
                let height = self.mainView.frame.height/3
                var arr = [1,3,-1,-3]
                if emptyNum == 0 || emptyNum == 1 || emptyNum == 2{
                    arr.remove(at: 3)
                }
                if emptyNum == 0 || emptyNum == 3 || emptyNum == 6{
                    arr.remove(at: 2)
                }
                if emptyNum == 6 || emptyNum == 7 || emptyNum == 8{
                    arr.remove(at: 1)
                }
                if emptyNum == 2 || emptyNum == 5 || emptyNum == 8{
                    arr.remove(at: 0)
                }
                let random = arc4random_uniform(UInt32(arr.count))
                emptyNum = emptyNum + arr[Int(random)]
                let moveNum = emptyNum + 10000
                let moveView = self.mainView.viewWithTag(moveNum)
                let moveFrame = CGRect.init(origin: (moveView?.frame.origin)!, size: (moveView?.frame.size)!)
                if arr[Int(random)] == 1{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x - width, y: moveFrame.origin.y, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == 3{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x, y: moveFrame.origin.y - height, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == -1{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x + width, y: moveFrame.origin.y, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == -3{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x, y: moveFrame.origin.y + height, width: moveFrame.size.width, height: moveFrame.size.height)
                }
                moveView?.tag = moveNum - arr[Int(random)]
            }else if self.type == 1{
                let width = self.mainView.frame.width/4
                let height = self.mainView.frame.height/4
                var arr = [1,4,-1,-4]
                if emptyNum == 0 || emptyNum == 1 || emptyNum == 2 || emptyNum == 3{
                    arr.remove(at: 3)
                }
                if emptyNum == 0 || emptyNum == 4 || emptyNum == 8 || emptyNum == 12{
                    arr.remove(at: 2)
                }
                if emptyNum == 12 || emptyNum == 13 || emptyNum == 14 || emptyNum == 15{
                    arr.remove(at: 1)
                }
                if emptyNum == 3 || emptyNum == 7 || emptyNum == 11 || emptyNum == 15{
                    arr.remove(at: 0)
                }
                let random = arc4random_uniform(UInt32(arr.count))
                emptyNum = emptyNum + arr[Int(random)]
                let moveNum = emptyNum + 10000
                let moveView = self.mainView.viewWithTag(moveNum)
                let moveFrame = CGRect.init(origin: (moveView?.frame.origin)!, size: (moveView?.frame.size)!)
                if arr[Int(random)] == 1{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x - width, y: moveFrame.origin.y, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == 4{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x, y: moveFrame.origin.y - height, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == -1{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x + width, y: moveFrame.origin.y, width: moveFrame.size.width, height: moveFrame.size.height)
                }else if arr[Int(random)] == -4{
                    moveView?.frame = CGRect.init(x: moveFrame.origin.x, y: moveFrame.origin.y + height, width: moveFrame.size.width, height: moveFrame.size.height)
                }
                moveView?.tag = moveNum - arr[Int(random)]
            }
            
        }
        self.empty = emptyNum
    }

}

extension Game1DetailViewController: Game1ResultDelegate{
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func again() {
        self.gameReset()
    }
    
    
}


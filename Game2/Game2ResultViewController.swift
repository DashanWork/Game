//
//  Game2ResultViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/16.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

protocol Game2ResultDelegate:NSObjectProtocol {
    func back()
    func again()
}

class Game2ResultViewController: UIViewController {
    
    var type : Int? //0,1,2,3
    weak var delegate: Game2ResultDelegate?
    
    class func presentGame2Result(rootVC : UIViewController, type : Int){
        let vc = UIStoryboard.init(name: "Game2", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game2ResultViewControllerID") as! Game2ResultViewController
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.type = type
        vc.delegate = rootVC as? Game2ResultDelegate
        rootVC.present(vc, animated: true, completion: nil)
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch self.type! {
        case 0:
            star1.image = UIImage.init(named: "xingxing2")
            star2.image = UIImage.init(named: "xingxing2")
            star3.image = UIImage.init(named: "xingxing2")
            self.mainLabel.text = "失败了！"
        case 1:
            star1.image = UIImage.init(named: "xingxing")
            star2.image = UIImage.init(named: "xingxing2")
            star3.image = UIImage.init(named: "xingxing2")
        case 2:
            star1.image = UIImage.init(named: "xingxing")
            star2.image = UIImage.init(named: "xingxing")
            star3.image = UIImage.init(named: "xingxing")
        case 3:
            star1.image = UIImage.init(named: "xingxing")
            star2.image = UIImage.init(named: "xingxing")
            star3.image = UIImage.init(named: "xingxing")
        default:
            star1.image = UIImage.init(named: "xingxing2")
            star2.image = UIImage.init(named: "xingxing2")
            star3.image = UIImage.init(named: "xingxing2")
            self.mainLabel.text = "失败了！"
        }

    }

    //MARK: - click and action
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.back()
    }
    @IBAction func clickAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.again()
    }
    


}

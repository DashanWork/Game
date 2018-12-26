//
//  Game1ResultViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/14.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

protocol Game1ResultDelegate: NSObjectProtocol {
    func back()
    func again()
}

class Game1ResultViewController: UIViewController {
    
    var type : Int? //0,1,2,3
    weak var delegate: Game1ResultDelegate?
    
    class func presentGame1Result(rootVC : UIViewController, type: Int){
        let vc = UIStoryboard.init(name: "Game1", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game1ResultViewControllerID") as! Game1ResultViewController
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.type = type
        vc.delegate = rootVC as? Game1ResultDelegate
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
            star1.image = UIImage.init(named: "xing_2")
            star2.image = UIImage.init(named: "xing_2")
            star3.image = UIImage.init(named: "xing_2")
        case 1:
            star1.image = UIImage.init(named: "xing_1")
            star2.image = UIImage.init(named: "xing_2")
            star3.image = UIImage.init(named: "xing_2")
        case 2:
            star1.image = UIImage.init(named: "xing_1")
            star2.image = UIImage.init(named: "xing_1")
            star3.image = UIImage.init(named: "xing_2")
        case 3:
            star1.image = UIImage.init(named: "xing_1")
            star2.image = UIImage.init(named: "xing_1")
            star3.image = UIImage.init(named: "xing_1")
        default:
            star1.image = UIImage.init(named: "xing_2")
            star2.image = UIImage.init(named: "xing_2")
            star3.image = UIImage.init(named: "xing_2")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - click and action
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true) {
            //退出
            self.delegate?.back()
        }
    }
    @IBAction func clickAgain(_ sender: Any) {
        self.dismiss(animated: true) {
            //重置
            self.delegate?.again()
        }
    }
    


}

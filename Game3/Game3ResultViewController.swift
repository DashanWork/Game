//
//  Game3ResultViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/21.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

protocol Game3ResultDelegate: NSObjectProtocol {
    func again()
    func back()
}

class Game3ResultViewController: UIViewController {
    
    var type: Int? //0成功  1失败
    weak var delegate: Game3ResultDelegate?
    
    class func presentGame3Result(type: Int, rootVC: UIViewController){
        let vc = UIStoryboard.init(name: "Game3", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game3ResultViewControllerID") as! Game3ResultViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        vc.type = type
        vc.delegate = rootVC as? Game3ResultDelegate
        rootVC.present(vc, animated: true, completion: nil)
    }
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var labelImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    func setUp(){
        if self.type == 0{
            //成功
            self.bgImage.image = UIImage.init(named: "db-chengong")
            self.starImage.image = UIImage.init(named: "cg-xinxin")
            self.labelImage.image = UIImage.init(named: "chengongl")
        }else if self.type == 1{
            //失败
            self.bgImage.image = UIImage.init(named: "db-shibai")
            self.starImage.image = UIImage.init(named: "sb-xinxin")
            self.labelImage.image = UIImage.init(named: "shibail")
        }
    }
    
    //MARK: click and action
    @IBAction func clickAgain(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.again()
        }
    }
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.back()
        }
    }
    
    
    

}

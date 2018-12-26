//
//  Game1RuleViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/14.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game1RuleViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    class func presentGame1Rule(rootVC: UIViewController){
        let vc = UIStoryboard.init(name: "Game1", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game1RuleViewControllerID") as! Game1RuleViewController
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        rootVC.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.layer.cornerRadius = 30

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - click and action
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    


}

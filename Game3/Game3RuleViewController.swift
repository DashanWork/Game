//
//  Game3RuleViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/21.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game3RuleViewController: UIViewController {
    
    class func presentGame3Rule(rootVC: UIViewController){
        let vc = UIStoryboard.init(name: "Game3", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game3RuleViewControllerID") as! Game3RuleViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        rootVC.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

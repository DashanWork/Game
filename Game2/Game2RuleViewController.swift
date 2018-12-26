//
//  Game2RuleViewController.swift
//  kynative
//
//  Created by JACK on 2018/11/16.
//  Copyright © 2018年 mhy. All rights reserved.
//

import UIKit

class Game2RuleViewController: UIViewController {
    
    class func presentGame2Rule(rootVC : UIViewController){
        let vc = UIStoryboard.init(name: "Game2", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game2RuleViewControllerID") as! Game2RuleViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        rootVC.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - click and action
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

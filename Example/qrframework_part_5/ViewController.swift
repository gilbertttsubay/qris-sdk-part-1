//
//  ViewController.swift
//  qrframework_part_5
//
//  Created by gilbertttsubay on 03/22/2022.
//  Copyright (c) 2022 gilbertttsubay. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var toQrisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toQrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController{
    @objc func buttonAction(){
        func navigateToQR(){
            guard let vcQR = UIStoryboard(name:QRConstant.qrStoryBoardName, bundle:nil).instantiateViewController(withIdentifier: QRConstant.qrViewControllerIdentifier) as? QRViewController else {
                print("gagal")
                return
            }

            self.navigationController?.popToViewController(vcQR, animated: true)
        }
    }
}

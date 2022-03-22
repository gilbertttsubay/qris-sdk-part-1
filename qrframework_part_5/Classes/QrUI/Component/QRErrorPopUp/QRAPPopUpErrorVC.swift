//
//  APPopUpErrorVC.swift
//  astrapay
//
//  Created by Nur Irfan Pangestu on 01/04/20.
//  Copyright © 2020 Tirta Rivaldi. All rights reserved.
//  

import UIKit


extension QRAPPopUpErrorVC {
    private enum State {
        case full
        case close
    }
    
    private enum Constant {
        //340
        static var fullViewYPosition: CGFloat { UIScreen.main.bounds.height - 360 }
        static var closeViewYPosition: CGFloat { UIScreen.main.bounds.height - 0 }
    }
}


class QRAPPopUpErrorVC: UIViewController {
    
    var onDismissTapped: ((Bool, String) -> Void)?
    var onRemoveView: ((Bool) -> Void)?

    @IBOutlet weak var vwSuperContainer: UIView!
    
    @IBOutlet weak var vwSwipe: UIView!
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var coreImage: UIImageView!
    @IBOutlet weak var coreTitle: QRUILabelInterRegular!
    @IBOutlet weak var coreButton: QRAPButtonAtom!
    @IBOutlet weak var consHeightViewContainer: NSLayoutConstraint!
    
    var message: String = ""
    var codeError: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUIs()
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureAct))
        self.vwSuperContainer.addGestureRecognizer(gesture)
        
        
        self.setActions()
        self.setHeightViewContainer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
        self.moveView(state: .full)
       }
    
    override func viewDidLayoutSubviews() {
        self.vwSwipe.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
    
    private func setUIs() {
        self.coreButton.setAtomic(type: .filled, title: "OK")
        self.coreTitle.text = self.message
        
        
        
        if self.codeError == "05" {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = "Nomor akun salah. Silakan cek ulang dan ralat nomor tujuan transfer kamu ya"
        }
        if self.codeError == "46" {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = "Jumlah Transfer ke akun tujuan melebihi limit balance."
        }
        if self.codeError == QRCodeResp.internalServerError {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.SUSPECT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.FAILED {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.errorFromBank {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.TRX_REJECT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.TRX_TIMEOUT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.errorTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.INVALID_ACCOUNT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.notFoundAccountNumber.rawValue
        }
        if self.codeError == QRCodeResp.INVALID_TRX_AMOUNT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.transactionTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.BANK_NOT_RESPONDING {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.transactionTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.NOT_OPERATING_HOUR {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.transactionTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.INVALID_TRX {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.transactionTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.BANK_NOT_SUPPORT {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.bankNotFound.rawValue
        }
        if self.codeError == QRCodeResp.TRX_NOT_ALLOWED {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.transactionTryAgain.rawValue
        }
        if self.codeError == QRCodeResp.BANK_ACC_NOT_FOUND {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.notFoundAccountNumber.rawValue
        }
        if self.codeError == QRCodeResp.BANK_NOT_FOUND {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.bankNotFound.rawValue
        }
        if self.codeError == QRCodeResp.accountLocked {
            self.coreImage.image = UIImage(named: "illustration_rejected")
            self.coreTitle.text = QRAlertInfo.accountLocked.rawValue
        } else {
            self.coreImage.image = UIImage(named: "illustration_rejected")
        }
        
//        if self.codeError == "91"{
//            self.coreImage.image = UIImage(named: "img_meme")
//            self.coreImage.contentMode = .scaleAspectFit
//            self.coreTitle.text =  "Developer on Vacation"
//        }

    }
    
    private func setHeightViewContainer() {
        
    }
    
    private func setActions() {
        self.coreButton.coreButton.addTapGestureRecognizerQR {
            self.onDismissTapped?(false, "")
        }
    }

}


//Pan Gesture Controller
extension QRAPPopUpErrorVC {
    private func moveView(state: State) {
           let yPosition = state == .full ? Constant.fullViewYPosition : Constant.closeViewYPosition
           view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
        
            if state == .full {
                 self.dismiss(animated: true, completion: nil)
            }
       }
       
       private func moveView(panGestureRecognizer recognizer: UIPanGestureRecognizer) {
           let translation = recognizer.translation(in: view)
           let minY = view.frame.minY
           
           if (minY + translation.y > Constant.fullViewYPosition) {
               view.frame = CGRect(x: 0, y: minY + translation.y, width: view.frame.width, height: view.frame.height)
               recognizer.setTranslation(CGPoint.zero, in: view)
           }
       }
       
       @objc private func panGestureAct(_ recognizer: UIPanGestureRecognizer) {
           moveView(panGestureRecognizer: recognizer)
           
           let minY = view.frame.minY
           
           if recognizer.state == .ended {
               if minY >= 555 {
                   UIView.animate(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction], animations: {
                    self.view.endEditing(true)
                    self.moveView(state: .close)
                    self.onRemoveView?(true)
                   }, completion: nil)
               } else {
                   UIView.animate(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction], animations: {
                       self.moveView(state: .full)
                       
                   }, completion: nil)
               }
           }
       }
    
}

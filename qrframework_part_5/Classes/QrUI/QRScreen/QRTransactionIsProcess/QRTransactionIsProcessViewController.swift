//
//  ReskinAPResultPaymentVC.swift
//  astrapay
//
//  Created by Sandy Chandra on 20/06/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import UIKit
import Lottie


struct QRTransactionIsProcessPayload {
    var titleLabelText: String?
    var subtitleLabelText: String?
    var imageName: String?
    var titleTopButton: String?
    var titleBottomButtom: String?
    
    
}

class QRTransactionIsProcessViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var topButton: QRAPButtonAtom!
    @IBOutlet weak var bottomButton: QRAPButtonAtom!
    @IBOutlet weak var additionalInfoView: UIView!
    @IBOutlet weak var additionalTitle: UILabel!
    @IBOutlet weak var additionalMerchant: UILabel!
    @IBOutlet weak var additionalDate: UILabel!
    
    @IBOutlet weak var lottieAnimationView: QRLottieAnimationView!
    


    var delegateSdk: QRProtocolSdk?
    var qrNewRouter: QRNewRouter?

    var qrTransactionIsProcessPayload: QRTransactionIsProcessPayload?

    var viewModel: QRTransactionIsProcessViewModel = QRTransactionIsProcessViewModel()

    init(qrTransactionIsProcessPayload: QRTransactionIsProcessPayload?) {
        self.qrTransactionIsProcessPayload = qrTransactionIsProcessPayload
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.setupQRRouter()
        self.setUI()
        self.setupActionButtom()
        self.setupProtocol()
    }

    func setupQRRouter(){
        self.qrNewRouter = QRNewRouter(viewController: self)
    }

    func setupProtocol(){
        self.viewModel.delegate = self
    }


    
    public func setUI() {
        self.lottieAnimationView.setupAnimation(animation: .accountInProgress)
        self.titleLabel.text = self.qrTransactionIsProcessPayload?.titleLabelText ?? "-"
        self.titleLabel.font = UIFont.setupFont(size: 24, fontType: .interSemiBold)
        self.titleLabel.textColor = QRBaseColor.QRProperties.baseColor
        self.subTitleLabel.text = self.qrTransactionIsProcessPayload?.subtitleLabelText ?? "-"
        self.imageView.image = UIImage(named: self.qrTransactionIsProcessPayload?.imageName ?? "-")
        self.topButton.setAtomic(type: .filled, title: self.qrTransactionIsProcessPayload?.titleTopButton ?? "-")
        self.bottomButton.setAtomic(type: .nude, title: self.qrTransactionIsProcessPayload?.titleBottomButtom ?? "-")
        self.additionalInfoView.isHidden = true
    }
}


//MARK: implement Setup button
extension QRTransactionIsProcessViewController {


    func setupActionButtom(){
        //Kembali ke beranda
        self.topButton.coreButton.addTapGestureRecognizerQR {


            //MARK: perlu dibikin delegate
            //MARK: Delegate
            self.delegateSdk?.didGoBackToHome(viewController: self)
//            AppState.switchToHome(completion: nil)
        }


        //Lihat riwayat
        self.bottomButton.coreButton.addTapGestureRecognizerQR {


            //ini harusnya ke riwayat history by delegate maupun secara langsung
            //MARK: Delegate
            self.delegateSdk?.didGoToHistoryList(viewController: self)
//            self.viewModel.navigateToHistoryListPage()
        }

    }
    func buttonSetupForTransactionFailed(){
        self.topButton.coreButton.addTapGestureRecognizerQR {
            DispatchQueue.main.async {
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: QRViewController.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
            }
        }
        self.bottomButton.coreButton.addTapGestureRecognizerQR {

            //MARK: Perlu dibikin delegate
            //MARK: Delegate
            self.delegateSdk?.didGoBackToHome(viewController: self)
//            AppState.switchToHome(completion: nil)
        }
    }
}

extension QRTransactionIsProcessViewController: QRTransactionIsProcessViewModelProtocol {

// this of 2 function were not functioning in SDK (only for test)
    func goToHome(){

        //ini delegate
//        self.delegateSdk?.didGoBackToHome()
//        DispatchQueue.main.async {
//            for controller in self.navigationController!.viewControllers as Array {
//                if controller.isKind(of: MainHomeVC.self) {
//                    self.navigationController!.popToViewController(controller, animated: true)
//                    break
//                }
//            }
//        }
    }

    func goToHistoryPage(){
//        self.delegateSdk?.didGoToHistoryList()
//        self.qrNewRouter?.navigateToHistoryPage()

    }
}


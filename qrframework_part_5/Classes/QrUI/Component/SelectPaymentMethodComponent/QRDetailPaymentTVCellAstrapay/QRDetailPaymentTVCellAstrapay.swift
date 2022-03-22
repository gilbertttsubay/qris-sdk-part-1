//
//  QRPLMCDetailPaymentTVCell.swift
//  astrapay
//
//  Created by Antonius on 05/03/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import UIKit
import SkeletonView

protocol QRDetailPaymentTVCellAstrapayProtocolSDK{
    func getUserBalance() -> String

}

protocol QRDetailPaymentTVCellAstrapayProtocol {
    func didAstrapayCellReloaded(userBalance: Int)
//    func didAstrapayBalanceIsNotEnough()
}


class QRDetailPaymentTVCellAstrapay: UITableViewCell {

    let paymentImageName = "main_icon_small"
    let paymentName = "AstraPay"


    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var paymentNameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var selectedPaymentImage: UIImageView!
    
    static let nibName = "QRDetailPaymentTVCellAstrapay"
    static let identifier = "QRDetailPaymentTVCellAstrapayIdentifier"
    
    let nameSelectedImage: String = "ic_check"
    var delegate: QRDetailPaymentTVCellAstrapayProtocol?
    var delegateSDK: QRDetailPaymentTVCellAstrapayProtocolSDK?
    var viewModel: QRDetailPaymentTVCellAstrapayViewModel = QRDetailPaymentTVCellAstrapayViewModel()


    func setupView(content: QRSelectPaymentViewPayload) {
        self.viewModel.initVM(content: content)
//        self.isHidden = true

    self.isUserInteractionEnabled = false
        self.setupActivationSkeleton()
        self.setupSkeletonView()


        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
            self.viewModel.setupViewLogic()
        })

        self.paymentImage.image = UIImage(named: self.paymentImageName)
        self.paymentNameLabel.text = self.paymentName
//        shimmerView.contentView = self.paymentImage.image


    //ini belum tau delegatenya bener apa ga?
//        self.balanceLabel.text = Prefs.getUser()?.balance?.toIDRQR() ?? "Rp 0"
        self.informationLabel.text = content.information
        self.informationLabel.isHidden = true
        self.selectedPaymentImage.image = UIImage(named: self.nameSelectedImage)
//        self.selectedPaymentImage.isHidden = true

        self.paymentNameLabel.font = UIFont.setupFont(size: 14)
        self.balanceLabel.font = UIFont.setupFont(size: 14)
        self.informationLabel.font = UIFont.setupFont(size: 12)
        self.informationLabel.textColor = QRBaseColor.QRProperties.baseColor

//        self.selectedPaymentImage.isHidden = false
        self.containerView.roundCorners(value: 10)
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = QRBaseColor.QRProperties.baseDisabledColor.cgColor
        self.selectionStyle = .none


        //MARK: Perlu delegate ke luar
//        var userBalance: Int = Int(Prefs.getUser()?.balance ?? 0)
//        var userBalance: Int = Int(self.delegateSDK?.getUserBalance() ?? "0") ?? 0



    }
    func setupProtocol(){
        self.viewModel.delegate = self
    }

    func setupActivationSkeleton(){
        self.paymentImage.isSkeletonable = true
        self.paymentNameLabel.isSkeletonable = true
        self.balanceLabel.isSkeletonable = true
        self.selectedPaymentImage.isSkeletonable = true
    }

    func disableSkelecton(){
        self.paymentImage.hideSkeleton()
        self.paymentNameLabel.hideSkeleton()
        self.balanceLabel.hideSkeleton()
        self.selectedPaymentImage.hideSkeleton()
    }

    func setupSkeletonView(){
        self.paymentImage.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))
        self.paymentNameLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -100)
        self.paymentNameLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))

        self.balanceLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -100)
        self.balanceLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))
        self.selectedPaymentImage.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))
    }
    //MARK: 2 fungsi ini dipake di QRPLMCDetailPaymentView, bukan disini
    func showSeletedPaymentImage() {
        self.selectedPaymentImage.isHidden = false
    }

    func hiddenSelectedPaymentImage() {
        self.selectedPaymentImage.isHidden = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupProtocol()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension QRDetailPaymentTVCellAstrapay: QRDetailPaymentTVCellAstrapayViewModelProtocol {
    func didUserBalanceIsNotEnoughCompareToAmount(userBalance: Int){
        DispatchQueue.main.async(execute: {
            self.balanceLabel.text = userBalance.toIDRQR()
            self.informationLabel.text = "Saldo tidak cukup"
            self.informationLabel.textColor = QRBaseColor.red
            self.informationLabel.isHidden = false
            self.selectedPaymentImage.isHidden = true
            self.isUserInteractionEnabled = false
//            self,delegate?.didAstrapayBalanceIsNotEnough()
        self.isHidden = false
            self.disableSkelecton()
        })

    }
    func didUserBalanceIsEnoughCompareToAmount(userBalance: Int){
        DispatchQueue.main.async {
            self.balanceLabel.text = userBalance.toIDRQR()
            self.informationLabel.isHidden = true
            self.selectedPaymentImage.isHidden = true
            self.isUserInteractionEnabled = true
            self.isHidden = false
            self.delegate?.didAstrapayCellReloaded(userBalance: userBalance)
            self.disableSkelecton()
        }
    }

    func didUserBalanceGetTimeOut(){
        DispatchQueue.main.async(execute: {
            self.balanceLabel.isHidden = true
            self.informationLabel.text = "Maaf terjadi gangguan"
            self.informationLabel.textColor = QRBaseColor.black
            self.informationLabel.isHidden = false
            self.selectedPaymentImage.isHidden = true
            self.isUserInteractionEnabled = false
//            self,delegate?.didAstrapayBalanceIsNotEnough()
            self.isHidden = false
            self.disableSkelecton()
        })

    }
}


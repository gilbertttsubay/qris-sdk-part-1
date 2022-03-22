//
//  QRPLMCDetailPaymentTVCell.swift
//  astrapay
//
//  Created by Antonius on 05/03/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import UIKit

class QRDetailPaymentTVCellPLMC: UITableViewCell {
    let paymentImageName = "ic_maucash_square"
    let paymentName = "Maupaylater"
    let information = "Powered by MAUCASH"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var paymentNameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var limitAmountLabel: UILabel!
    @IBOutlet weak var selectedPaymentImage: UIImageView!
    
    static let nibName = "QRPLMCDetailPaymentTVCell"
    static let identifier = "QRPLMCDetailPaymentTVCellIdentifier"
    
    let nameSelectedImage: String = "ic_check"


    var vm: QRPLMCDetailPaymentTVCellViewModel = QRPLMCDetailPaymentTVCellViewModel()



    func setupView(content: QRSelectPaymentViewPayload) {
        self.setupActivationSkeleton()
        self.setupSkeletonView()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
            self.vm.getInquiryPaylater(content: content)
        })


        self.isUserInteractionEnabled = false
        self.paymentImage.image = UIImage(named: self.paymentImageName)
        self.paymentNameLabel.text = self.paymentName

        //ini hit api
        self.informationLabel.text = self.information
        self.selectedPaymentImage.image = UIImage(named: self.nameSelectedImage)

        
        self.paymentNameLabel.font = UIFont.setupFont(size: 14, fontType: .interSemiBold)
        self.balanceLabel.font = UIFont.setupFont(size: 14, fontType: .interRegular)
        self.informationLabel.font = UIFont.setupFont(size: 12, fontType: .interRegular)
        self.informationLabel.textColor = QRBaseColor.QRProperties.baseColor
        
//        self.selectedPaymentImage.isHidden = true

        self.containerView.roundCorners(value: 10)
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = QRBaseColor.QRProperties.baseDisabledColor.cgColor
        self.selectionStyle = .none


        if selectedPaymentImage.isHidden == false {
            selectedPaymentImage.isHidden = false
        }
    }
    
    func showSeletedPaymentImage() {
        self.selectedPaymentImage.isHidden = !self.selectedPaymentImage.isHidden
    }
    func hiddenSelectedPaymentImage() {
        self.selectedPaymentImage.isHidden = true
    }
    func setupProtocol(){
        self.vm.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupProtocol()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupActivationSkeleton(){
        self.paymentImage.isSkeletonable = true
        self.paymentNameLabel.isSkeletonable = true
        self.balanceLabel.isSkeletonable = true
        self.informationLabel.isSkeletonable = true
        self.selectedPaymentImage.isSkeletonable = true
        self.limitAmountLabel.isSkeletonable = true
    }

    func disableSkelecton(){
        self.paymentImage.hideSkeleton()
        self.paymentNameLabel.hideSkeleton()
        self.balanceLabel.hideSkeleton()
        self.selectedPaymentImage.hideSkeleton()
        self.informationLabel.hideSkeleton()
        self.limitAmountLabel.hideSkeleton()
    }

    func setupSkeletonView(){
        self.paymentImage.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))

        self.paymentNameLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -30)
        self.paymentNameLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))

        self.balanceLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -30)
        self.balanceLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))

        self.informationLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -30)
        self.informationLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))

        self.limitAmountLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0,left: 0, bottom: 0, right: -30)
        self.limitAmountLabel.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))


        self.selectedPaymentImage.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: QRBaseColor.QRProperties.baseDisabledColor))
    }
}

//MARK: impelement QRPLMCDetailPaymentTVCellViewModel
extension QRDetailPaymentTVCellPLMC: QRPLMCDetailPaymentTVCellViewModelProtocol {
    func didFailedGetInquiryResponse(){
        DispatchQueue.main.async {
            self.removeFromSuperview()
            self.reloadInputViews()
        }
    }
    func didSuccessGetInquiryResponseEmptyList(){
        DispatchQueue.main.async {
            self.removeFromSuperview()
            self.reloadInputViews()
        }
    }
    func didSuccessGetInquiryResponseWithList(listPaylater: [Content]){
       DispatchQueue.main.async {
           self.isHidden = false
           self.balanceLabel.text = Int(listPaylater[0].limit ?? 0).toIDRQR()
           self.limitAmountLabel.isHidden = true
           self.selectedPaymentImage.isHidden = true
           self.isUserInteractionEnabled = true
           self.disableSkelecton()
       }
    }

    func didSuccessGetInquiryButAmountIsNotEnough(limit: Int){
        DispatchQueue.main.async {
            self.isHidden = false
            self.balanceLabel.text = limit.toIDRQR()
            self.limitAmountLabel.isHidden = false
            self.limitAmountLabel.textColor = QRBaseColor.red
            self.selectedPaymentImage.isHidden = true
            self.isUserInteractionEnabled = false
            self.disableSkelecton()
        }
    }

    func didFailedGetInquiryResponseBecauseOfTimeOut(){
        DispatchQueue.main.async {
            self.balanceLabel.text = "-"
            self.limitAmountLabel.isHidden = false
            self.limitAmountLabel.textColor = QRBaseColor.red
            self.limitAmountLabel.text = "Maaf terjadi gangguan"
            self.selectedPaymentImage.isHidden = true
            self.isUserInteractionEnabled = false
            self.alpha = 0.6
            self.disableSkelecton()
        }
    }

}

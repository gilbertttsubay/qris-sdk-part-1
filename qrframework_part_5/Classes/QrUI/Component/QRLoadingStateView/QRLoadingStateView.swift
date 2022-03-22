//
//  LoadingStateView.swift
//  astrapay
//
//  Created by Sandy Chandra on 23/07/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import UIKit

class QRLoadingStateView: UIView {
    @IBOutlet weak var lottieAnimationView: QRLottieAnimationView!
    
    static let nibName = "QRLoadingStateView"
    static let identifier = "QRLoadingStateViewIdentifier"
    
    func setupView() {
        self.lottieAnimationView.setupAnimation(animation: .loadingState, animationSpeed: 1)
        self.lottieAnimationView.roundCorners(value: 15)
        self.roundCorners(value: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetupQR(nibName: QRLoadingStateView.nibName)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetupQR(nibName: QRLoadingStateView.nibName)
    }

    override func awakeFromNib() {
        xibSetupQR(nibName: QRLoadingStateView.nibName)
    }
}

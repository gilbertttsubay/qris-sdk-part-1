//
//  QRTrxDetailItemTVCell.swift
//  astrapay
//
//  Created by Guntur Budi on 23/02/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import UIKit




struct QRTrxDetailItemTVCellPayload {
    var title: String = ""
    var content: String = ""
}

class QRTrxDetailItemTVCell: UITableViewCell {

    @IBOutlet weak var titleLabel: QRUILabelInterRegular!
    @IBOutlet weak var contentLabel: QRUILabelInterSemiBold!
    
    static let identifier = "QRTrxDetailItemTVCellIdentifier"
    static let nibName = "QRTrxDetailItemTVCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(payload: QRTrxDetailItemTVCellPayload) {
        self.titleLabel.text = payload.title
        self.contentLabel.text = payload.content
        self.selectionStyle = .none
        self.titleLabel.font = UIFont.setupFont(size: 16, fontType: .interRegular)
        self.titleLabel.textColor = QRBaseColor.QRProperties.blackColor
        self.contentLabel.font = UIFont.setupFont(size: 16)
        self.contentLabel.textColor = QRBaseColor.QRProperties.blackColor
        self.contentLabel.lineBreakMode = .byWordWrapping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  QRTransactionDetailTopTVCell.swift
//  astrapay
//
//  Created by Nivedita Gupta on 20/01/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//


import UIKit

protocol QRTransactionDetailTopTVCellPayloadProtocol {
    var qrTrxDetailTopTVCell: QRTransactionDetailTopTVCellPayload { get }
}


protocol QRTransactionDetailTopTVCellProtocol {
    func editTransaction()
}

struct QRTransactionDetailTopTVCellPayload {
    var title   : String = ""
    var amount  : String = ""
    var date    : String = ""
    var status  : String = ""
}

class QRTransactionDetailTopTVCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    var delegate:QRTransactionDetailTopTVCellProtocol?
    
    static let identifier = "QRTransactionDetailTopTVCellIdentifier"
    static let nibName = "QRTransactionDetailTopTVCell"
    
    func setupCell(payload : QRTransactionDetailTopTVCellPayload){
        self.labelTitle.text = payload.title
        self.labelAmount.text = "\(payload.amount)"
        self.labelDate.text = payload.date
        
        switch payload.status {
        case "APP":
            self.labelStatus.text = "Berhasil"
            self.labelStatus.textColor = QRBaseColor.greenCorrect
        case "SUB":
            self.labelStatus.text = "Dalam Proses"
            self.labelStatus.textColor = QRBaseColor.orangeInProgress
        case "REJ":
            self.labelStatus.text = "Ditolak"
            self.labelStatus.textColor = QRBaseColor.baseRedColor
        case "CAN":
            self.labelStatus.text = "Dibatalkan"
            self.labelStatus.textColor = QRBaseColor.baseRedColor
        case "EXP":
            self.labelStatus.text = "Expired"
            self.labelStatus.textColor = QRBaseColor.baseRedColor
        case "PND":
            self.labelStatus.text = "Dalam Proses"
            self.labelStatus.textColor = QRBaseColor.orangeInProgress
        case "RFN" :
            self.labelStatus.text = "Dikembalikan"
            self.labelStatus.textColor = QRBaseColor.greenCorrect
        case "APR1" :
            self.labelStatus.text = "Dalam Proses"
            self.labelStatus.textColor = QRBaseColor.orangeInProgress
        case "APR2" :
            self.labelStatus.text = "Dalam Proses"
            self.labelStatus.textColor = QRBaseColor.orangeInProgress
        case "Berhasil" :
            self.labelStatus.text = "Berhasil"
            self.labelStatus.textColor = QRBaseColor.greenCorrect
        case "Dalam Proses" :
            self.labelStatus.text = "Dalam Proses"
            self.labelStatus.textColor = QRBaseColor.orangeInProgress
        default:
            self.labelStatus.text = ""
        }
    }
}

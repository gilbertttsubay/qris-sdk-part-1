//
// Created by Gilbert on 04/01/22.
// Copyright (c) 2022 Astra Digital Arta. All rights reserved.
//

import Foundation

protocol QRDetailPaymentTVCellAstrapayViewModelProtocol{
    func didUserBalanceIsNotEnoughCompareToAmount(userBalance: Int)
    func didUserBalanceIsEnoughCompareToAmount(userBalance: Int)

    func didUserBalanceGetTimeOut()

}

class QRDetailPaymentTVCellAstrapayViewModel{

    var content = QRSelectPaymentViewPayload()
    var userBalance = 0

    private var qrTransactionClient = QRTransactionClient()


    var delegate: QRDetailPaymentTVCellAstrapayViewModelProtocol?

    func initVM(content: QRSelectPaymentViewPayload){
        self.content = content

    }


}

//MARK: Setup view logic
extension QRDetailPaymentTVCellAstrapayViewModel{

    /*Logicnya ada 3 yaitu
     1. jika user balance cukup
      2. jika user balance ga cukup
       3. jika loading terlalu lama*/
    func setupViewLogic(){

            self.qrTransactionClient.getTransactionBalance(completion: {
                (result) in
                guard let basicPrice = self.content.basicPrice else {
                    return
                }
                guard let amountTransaction = self.content.amountTransaction else {
                    return
                }

                switch result.status {
                case true:
                    self.userBalance = Int(result.data?.balance ?? 0)
                    if self.userBalance < basicPrice || self.userBalance < amountTransaction {
                        self.delegate?.didUserBalanceIsNotEnoughCompareToAmount(userBalance: self.userBalance)
                        return
                    }
                    self.delegate?.didUserBalanceIsEnoughCompareToAmount(userBalance: self.userBalance)
                    return

                case false:
                    if let isTimeOut = result.isTimeOut{
                        if isTimeOut{
                            self.delegate?.didUserBalanceGetTimeOut()
                            return

                        }
                    }
                }


            })
    }
}
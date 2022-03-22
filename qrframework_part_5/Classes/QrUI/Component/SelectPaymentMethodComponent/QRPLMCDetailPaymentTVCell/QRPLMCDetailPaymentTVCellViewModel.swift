//
// Created by Gilbert on 01/01/22.
// Copyright (c) 2022 Astra Digital Arta. All rights reserved.
//

import Foundation

protocol QRPLMCDetailPaymentTVCellViewModelProtocol {

    //error casuel
    func didFailedGetInquiryResponse()

    //error timeout
    func didFailedGetInquiryResponseBecauseOfTimeOut()


    func didSuccessGetInquiryResponseEmptyList()
    func didSuccessGetInquiryResponseWithList(listPaylater: [Content])

    func didSuccessGetInquiryButAmountIsNotEnough(limit: Int)


}


class QRPLMCDetailPaymentTVCellViewModel {

    static let FIRST_INDEX = 0

    var delegate: QRPLMCDetailPaymentTVCellViewModelProtocol?

    private var qrPaylaterClient = QRPaylaterClient()


    func getInquiryPaylater(content: QRSelectPaymentViewPayload){
        // connect to
        self.getInquiryPaylaterClient(content: content)

    }

    func getInquiryPaylaterClient(content: QRSelectPaymentViewPayload){
        self.qrPaylaterClient.getInquiryPaylater(requestTransactionToken: content.qrInquiryDtoViewData?.transactionToken ?? "-", requestBasicAmount: String(content.basicPrice ?? 0)) { result in
            switch result.status{
            case false:
                if let isTimeOut = result.isTimeOut {
                    if isTimeOut {
                        self.delegate?.didFailedGetInquiryResponseBecauseOfTimeOut()
                        return
                    }
                }
                self.delegate?.didFailedGetInquiryResponse()
            case true:
                guard let listPaylater = result.data?.content else {
                    self.delegate?.didSuccessGetInquiryResponseEmptyList()
                    return
                }
                if listPaylater.count == QRPLMCDetailPaymentTVCellViewModel.FIRST_INDEX {
                    self.delegate?.didSuccessGetInquiryResponseEmptyList()
                    return
                }

                var mauCash = listPaylater[QRPLMCDetailPaymentTVCellViewModel.FIRST_INDEX]

                if mauCash.limit ?? 0 < content.basicPrice ?? 0 || mauCash.limit ?? 0 < content.amountTransaction ?? 0 {
                    self.delegate?.didSuccessGetInquiryButAmountIsNotEnough(limit: mauCash.limit ?? 0)
                    return
                }

                self.delegate?.didSuccessGetInquiryResponseWithList(listPaylater: listPaylater)

            }

        }
    }
}


//MARK: Helper function
extension QRPLMCDetailPaymentTVCellViewModel {
    //MARK: ini masih belum tau comparenya gimana
    func compareLimitAmount(){

    }
}
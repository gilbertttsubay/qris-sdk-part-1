//
// Created by Gilbert on 01/01/22.
// Copyright (c) 2022 Astra Digital Arta. All rights reserved.
//

import Foundation
import Alamofire



public struct QRPaylaterClient {
    var delegateSdk: ClientProtocol?

    //baseUrlMobileGatewayQr kalo sudah siap gateway sementara pake biasa aja dulu

//    let urlBaseQrisService = "https://qris-sit-api.astrapay.com/qris-service"
    var urlBaseQrisService = QRConstant.QRIS_SIT_API


    init(){
    }

    struct ClientProperty{
        static let AUTH_TOKEN = QRConstant.AUTH_TOKEN_FOR_TEST
    }

    var urlTenorTrxQrisTPLMC : String = "\(QRConstant.baseUrlMobileGatewaySIT)/paylater-service/partners/maucash/tenor?merchantCode="


    public func constructHeaderGeneral() -> HTTPHeaders {
        let header: HTTPHeaders = [
//            QRConstant.HEADER_X_APPLICATION_TOKEN: "\(Prefs.getUser()!.accessToken)", //hardcode aja dulu nanti
//            "Authorization": "Bearer \(self.delegateSdk?.getAuthToken())",
            "Authorization": "Bearer \(ClientProperty.AUTH_TOKEN)",
            "Content-Type": "application/json"
        ]
        return header
    }

    public mutating func determineBuildMode(){
        var buildMode: BuildMode = self.delegateSdk?.getBuildMode() ?? .sit
        switch (buildMode){
        case .sit:
            urlBaseQrisService = QRConstant.QRIS_SIT_API
            return
        case .uat:
            urlBaseQrisService = QRConstant.QRIS_UAT_API
            return
        case .prod:
            urlBaseQrisService = QRConstant.QRIS_PROD_API
            return

        }
    }
}
extension QRPaylaterClient{
    mutating func getInquiryPaylater(requestTransactionToken: String, requestBasicAmount: String, completion: @escaping(_:QRResponse<QRPaylaterResponseDto>) -> Void) -> DataRequest {
        determineBuildMode()
        let getInquiryPaylaterUrl: String = "\(urlBaseQrisService)/inquiries/\(requestTransactionToken)/paymentMethods/payLater?amount=\(requestBasicAmount)"
        var header = self.constructHeaderGeneral()

        let request = AF.request(getInquiryPaylaterUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header){$0.timeoutInterval = 60}
                .responseJSON(completionHandler: {
                    response in

                    debugPrint(response)

                    debugPrint(response)

                    switch response.result{
                    case .success(let value):

                        var responseResult = try? response.result.get()
                        var resultDictionary = responseResult as! Dictionary<String, Any>
                        print(resultDictionary.jsonStringRepresentation)
                        var dictString = resultDictionary.jsonStringRepresentation

                        if let dictString = dictString{
                            var responseJson = dictString.data(using: .utf8)
                            let responseSuccessGetBalance = try? JSONDecoder().decode(QRPaylaterResponseDto.self, from: responseJson!)
                            if let responseSuccessGetBalance = responseSuccessGetBalance{
                                completion(QRResponse(status: true, message: "OK", data:responseSuccessGetBalance, errorData: nil))
                                print("success get inquiry paylater: \(responseSuccessGetBalance)")
                            }
                            let responseErrorGetBalance = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                            print("error get inquiry paylater: \(responseErrorGetBalance)")
                            if let responseErrorGetBalance = responseErrorGetBalance{
                                completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: responseErrorGetBalance))
                            }
                        }


                    case .failure(let error):
                        var errorCode = error._code
                        if errorCode == QRErrorConstant.TIMEOUT_ERROR_CODE {
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data: nil, errorData: nil, isTimeOut: true))
                            break
                        }

                        switch response.response?.statusCode {
                        case 401:
                            completion(QRResponse(status: false, message: response.error?.errorDescription ?? "-", data:nil, errorData: nil, isTimeOut: false,responseCode: response.response?.statusCode))
                            break
                        case .none:
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        case .some(_):
                            completion(QRResponse(status: false, message: "-", data: nil, isTimeOut: false, responseCode: nil))
                            break
                        }
                    }
                })
        return request
    }
}

extension QRPaylaterClient{
    mutating func getQrisTenorTrxPLMC(merchantCode: String,goodsCode: String,mobile: String,amount:String,transType:String, completion:@escaping(_:QRResponse<QRTenorQrisTrxPLMCResp>) -> Void) -> DataRequest {
        determineBuildMode()
        let goodsCodeUrl : String = "&goodsCode=" + goodsCode
        let mobileUrl : String = "&mobile=" + mobile
        let amountUrl : String = "&amount=" + amount
        let transTypeUrl : String = "&transType=" + transType

        var urlRequest = urlTenorTrxQrisTPLMC + merchantCode + goodsCodeUrl + mobileUrl + amountUrl + transTypeUrl
        let request = AF.request(urlRequest, method: .get, parameters: nil, encoding: URLEncoding.default, headers: self.constructHeaderGeneral())
        {$0.timeoutInterval = 60}.responseDecodable(of: QRTenorQrisTrxPLMCResp.self) {
            response in

            debugPrint(response)

            switch response.result {
            case .failure(let error):
                switch error._code{
                case QRErrorConstant.TIMEOUT_ERROR_CODE:
                    completion(QRResponse(status: false, message: error.localizedDescription, data: nil, errorData: nil, isTimeOut: true, responseCode: response.response?.statusCode))
                    break
                default:
                    completion(QRResponse(status: false, message: error.localizedDescription, data: nil, errorData: nil, isTimeOut: false, responseCode: response.response?.statusCode))
                    break

                }
            case .success(let data):
                completion(QRResponse(status: true, message: "OK", data: data))
            }
        }
        return request
    }
}




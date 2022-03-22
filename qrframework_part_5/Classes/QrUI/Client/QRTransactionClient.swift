//
// Created by Gilbert on 3/18/22.
//

import Foundation
import Alamofire


public struct QRTransactionClient{


    var urlBaseTransactionService = QRConstant.TRANSACTION_SIT_API


    struct ClientProperty{
        static let AUTH_TOKEN = QRConstant.AUTH_TOKEN_FOR_TEST
    }


    public func constructHeaderGeneral() -> HTTPHeaders {
        let header: HTTPHeaders = [
//            QRConstant.HEADER_X_APPLICATION_TOKEN: "\(Prefs.getUser()!.accessToken)", //hardcode aja dulu nanti
//            "Authorization": "Bearer \(self.delegateSdk?.getAuthToken())",
            "Authorization": "Bearer \(ClientProperty.AUTH_TOKEN)",
            "Content-Type": "application/json"
        ]
        return header
    }


    public func getTransactionBalance(completion: @escaping(_:QRResponse<QRBalance>) -> Void) -> DataRequest{

        var header = self.constructHeaderGeneral()

        let urlRequest = "\(urlBaseTransactionService)/organization-members/balances"

        let request = AF.request(urlRequest, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header){$0.timeoutInterval = 60}
        .responseJSON(completionHandler: {
            response in

            debugPrint(response)

            switch response.result{
                case .success(let value):

                    var responseResult = try? response.result.get()
                    var resultDictionary = responseResult as! Dictionary<String, Any>
                    print(resultDictionary.jsonStringRepresentation)
                    var dictString = resultDictionary.jsonStringRepresentation

                    if let dictString = dictString{
                        var responseJson = dictString.data(using: .utf8)
                        let responseSuccessGetBalance = try? JSONDecoder().decode(QRBalance.self, from: responseJson!)
                        if let responseSuccessGetBalance = responseSuccessGetBalance{
                                completion(QRResponse(status: true, message: "OK", data:responseSuccessGetBalance, errorData: nil))
                                print("success post to transaction otp: \(responseSuccessGetBalance)")
                        }
                        let responseErrorGetBalance = try? JSONDecoder().decode(AstrapayErrorResponse.self, from: responseJson!)
                        print("Error post to transaction otp: \(responseErrorGetBalance)")
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
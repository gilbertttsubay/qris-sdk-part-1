//
// Created by Gilbert on 3/16/22.
//

import Foundation
struct QREligibleCheckResp: Decodable {
    var message: String?
    var sort: String?
    var tenor: String?
    var maxLimit : Int?
    var repaymentDetail: [QRRepaymentDetailData]
}

struct QRRepaymentDetailData: Decodable {
    var dueIndex: Int?
    var dueDate: String?
    var dueType: String?
    var amount: Int?
}
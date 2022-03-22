//
// Created by Gilbert on 3/16/22.
//

import Foundation

struct QRCodeResp {
    static let productNotAvailable2 = "fif.getProductDenum"
    static let productNotAvailable = "64"
    static let accountNotFound = "02"
    static let invalidDestination = "05"
    static let sameDestination = "06"
    static let wrongPin = "07"
    static let invalidPin = "103"
    static let invalidPinQRDynamic = "79"
    static let wrongOtp = "59"
    static let accountDuplicate = "21"
    static let accountLocked = "25"
    static let invalidAccountPrefix = "27"
    static let insufficientBalance = "42"
    static let maximalBalance = "46"
    static let insufficientBalance2 = "52"
    static let invalidOtp = "59"
    static let notFoundPayment = "65"
    static let invalidToken = "98"
    static let limitBalanceDestination = "99"
    static let accountBeforeLocked = "100"
    static let waitingForClose = "102"
    static let requestFailed = "201"
    static let paymentFailed = "400"
    static let paymentnotFound = "404"
    static let bankAlreadyExist = "Bank Already Exist"
    static let idCardDuplicate = "108"
    static let paymentFailedVA = "301"
    static let duplicateEmail = "36"

    //MARK: NEED TO DISCUSS TAF -Sandy
    static let vaTafNotFound = "94"
    static let tidakTersediaTAF = "91"
    static let tagihanLunasTAF = "95"
    static let expiredTAF = "96"
    static let jatuhTempoTAF = "97"
    static let intermittentTAF = "OPTAFNULL"
    //RC 98
    static let angsuranTerakhirTAF = ""

    static let internalServerError = "901"
    static let SUSPECT = "902"
    static let FAILED = "903"
    static let errorFromBank = "904"
    static let TRX_REJECT = "905"
    static let TRX_TIMEOUT = "906"
    static let INVALID_ACCOUNT = "907"
    static let INVALID_TRX_AMOUNT = "908"
    static let BANK_NOT_RESPONDING = "909"
    static let NOT_OPERATING_HOUR = "910"
    static let INVALID_TRX = "911"
    static let BANK_NOT_SUPPORT = "912"
    static let TRX_NOT_ALLOWED = "913"
    static let BANK_ACC_NOT_FOUND = "914"
    static let BANK_NOT_FOUND = "915"

    static let QRIS_ERROR = "10"
    static let QRIS_REJECTED_BY_BANK = "93"
    static let QRIS_FAILED = "92"

    static let CashoutServerError = "CashoutServerError"
}
//
//  QRConstant.swift
//  astrapay
//
//  Created by Gilbert on 01/11/21.
//  Copyright © 2021 Astra Digital Arta. All rights reserved.
//

import Foundation

struct QRConstant {
    static let qrStoryBoardName = "QRStoryboard"
    static let qrViewControllerIdentifier = "QRViewControllerIdentifier"

    static let qrPaymentRoute = "QRPayment"
    static let navigationTitle: String = "Scan"

    static let baseUrlMobileGatewaySIT = "https://frontend-sit.astrapay.com"
    static let QRIS_SIT_API = "https://frontend-sit.astrapay.com/qris-service"
    static let QRIS_UAT_API = "https://frontend-uat.astrapay.com/qris-service"
    static let QRIS_PROD_API = "https://frontend-.astrapay.com/qris-service"

    static let TRANSACTION_SIT_API = "https://frontend-sit.astrapay.com/transaction-service"

    //header
    static let HEADER_X_TRANSACTION_TOKEN = "X-Transaction-Token"
    static let HEADER_X_SDK_TOKEN = "X-SDK-Token"
    static let HEADER_USER_ID = "x-user-id"
    static let HEADER_X_APPLICATION_TOKEN = "X-Application-Token"

    static let XTOKEN = "XTOKEN"

    static let AUTH_TOKEN_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk5LCJkZXZpY2VJZCI6IjEyMyIsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJuYmYiOjE2NDc4NDU1NzYsImV4cCI6MTY0Nzg0OTE3NiwiaWF0IjoxNjQ3ODQ1NTc2LCJqdGkiOiIwOTEwZjk4NC0xYTZkLTQ4ZTMtYmFkYy0xNzY4NWQ3ZjQyMDAiLCJlbWFpbCI6WyJnaWxiZXJ0QGcyYWNhZGVteS5jbyJdfQ.TtaH_w3JRzENc4R_UQ_Z29ejuOWlZAjTIpH3i3QeztKQ9v4Jeo8iBezJq1vyj9ecjKgLgXTjaBWsyPkDjpE9obymtIkUVPVMiOT2glFGB-kGcHs7lJPopYvozOoSiyjrrEyE-j6vDPH6VD0xoXvtiEa_FfoSvGCw7A6SMpmcNVTPDrXQeYb7zjKT1x77yTAj6Zys6WLU7miw5Qi0IfNwgRuyttUD-JjQXI5McOv3mOEBY17EAwwZgCWB1rTJWCYZmyvFNzF-_dk62_qeHm3MaN8W-YjKJ-UZJpv2-UDvMFZMAencpo2DtVpvfjhjTtOQAGUld8yJDoXiW-bg53mJkw"
}
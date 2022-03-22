//
// Created by Gilbert on 3/19/22.
//

import Foundation

import UIKit
protocol QRProtocolSdk{
    func didUnAuthorized(viewControler: UIViewController)
    func didGoBackToHome(viewController: UIViewController)
    func didGoToHistoryList(viewController: UIViewController)
}
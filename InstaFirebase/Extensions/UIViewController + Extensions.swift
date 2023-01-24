//
//  UIViewController + Extensions.swift
//  InstaFirebase
//
//  Created by Hakan Adanur on 24.01.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}

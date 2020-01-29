//
//  Alert.swift
//  FlickerDraft
//
//  Created by Chuck.Zhou on 1/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit

class Alert: UIViewController {
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}



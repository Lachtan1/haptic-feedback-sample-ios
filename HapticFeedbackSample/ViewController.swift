//
//  ViewController.swift
//  HapticFeedbackSample
//
//  Created by Adam Leitgeb on 30/07/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum HapticFeedback: Int {
        case notificationError
        case notificationSuccess
        case notificationWarning
        case light
        case medium
        case heavy

        static let all = Array(0...HapticFeedback.heavy.rawValue).compactMap { HapticFeedback(rawValue: $0) }
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HapticFeedback.all.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HapticFeedback.all[row].description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        HapticFeedback.all[row].playFeedback()
    }
}

extension ViewController.HapticFeedback {
    func playFeedback() {
        switch self {
        case .notificationError:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        case .notificationSuccess:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        case .notificationWarning:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
    }

    var description: String {
        switch self {
        case .notificationError:
            return "Notification error"
        case .notificationSuccess:
            return "Notification success"
        case .notificationWarning:
            return "Notification warning"
        case .light:
            return "Impact light"
        case .medium:
            return "Impact medium"
        case .heavy:
            return "Impact hevy"
        }
    }
}

//
//  ViewController.swift
//  AuthPhone -Firebase
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import UIKit


class PhoneVC: UIViewController ,UITextFieldDelegate {
    
    private let phoneTF: UITextField = {
        let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.placeholder = "Phone Number"
        field.returnKeyType = .continue
        field.textAlignment = .center
        return field
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(phoneTF)
        phoneTF.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        phoneTF.center = view.center
        phoneTF.delegate = self
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text, !text.isEmpty {
            let number = "+970\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let vc = SMSCodeVC()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        return true
    }
}


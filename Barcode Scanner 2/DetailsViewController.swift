//
//  DetailsViewController.swift
//  Barcode Scanner 2
//
//  Created by Sonia Purohit on 5/2/18.
//  Copyright © 2018 Sonia Purohit. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var scannedCode:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        print(scannedCode!)
        
        
        // Setup label and button layout
        view.addSubview(codeLabel)
        codeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        codeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if let scannedCode = scannedCode {
            codeLabel.text = "Barcode Number is " + scannedCode
        }
        
        view.addSubview(scanButton)
        scanButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scanButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scanButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let codeLabel:UILabel = {
        let codeLabel = UILabel()
        codeLabel.textAlignment = .center
        codeLabel.backgroundColor = .white
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        return codeLabel
    }()
    
    lazy var scanButton:UIButton = {
        let scanButton = UIButton(type: .system)
        scanButton.setTitle("Scan", for: .normal)
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        scanButton.backgroundColor = .green
        scanButton.layer.cornerRadius = 25
        scanButton.addTarget(self, action: #selector(displayOrigViewController), for: .touchUpInside)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        
        return scanButton
    }()
    
    @objc func displayOrigViewController() {
        print("going back")
        let origViewController = ViewController()
        present(origViewController, animated: true, completion: nil)
    }

}

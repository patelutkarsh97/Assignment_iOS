//
//  LogInView.swift
//  EndGame
//
//  Created by Utkarsh Patel on 27/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LogInView: UIView, UITextFieldDelegate {

    @IBOutlet weak var emailDisplayButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validationImage: UIImageView!
    @IBOutlet weak var reTypePasswordTextField: UITextField!
    
    @IBOutlet weak var onClickEmailDisplayButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerNib()
    }
    
    private func registerNib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LogInView", bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            self.addSubview(view)
        }
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        validationImage.image = nil
    }
}


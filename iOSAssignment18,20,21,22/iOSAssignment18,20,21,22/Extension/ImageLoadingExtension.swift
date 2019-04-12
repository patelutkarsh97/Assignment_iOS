//
//  File.swift
//  iOSAssignment18,20,21,22
//
//  Created by Utkarsh Patel on 12/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    public static func lodingImage(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}


//
//  LocalizationVC.swift
//  iOSAssignment24-Localization,Mapkit,CoreLocation
//
//  Created by Utkarsh Patel on 13/04/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class LocalizationVC: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var userStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var userCountryLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var userDOBLabel: UILabel!
    @IBOutlet weak var lotteryWonLabel: UILabel!
    @IBOutlet weak var userLotteryWonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    @IBAction func onClickSegment(_ sender: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            // English
            nameLabel.text = "nameLabel".localizableString(location: "en")
            userInfoLabel.text = "userInfoLabel".localizableString(location: "en")
            stateLabel.text = "stateLabel".localizableString(location: "en")
            countryLabel.text = "countryLabel".localizableString(location: "en")
            dobLabel.text = "dobLabel".localizableString(location: "en")
            lotteryWonLabel.text = "lotteryWonLabel".localizableString(location: "en")
            userDOBLabel.text = "userDOBLabel".localizableString(location: "en")
            userLotteryWonLabel.text = "userLotteryWonLabel".localizableString(location: "en")
        }
        else if segment.selectedSegmentIndex == 1 {
            // German
            nameLabel.text = "nameLabel".localizableString(location: "de")
            userInfoLabel.text = "userInfoLabel".localizableString(location: "de")
            stateLabel.text = "stateLabel".localizableString(location: "de")
            countryLabel.text = "countryLabel".localizableString(location: "de")
            dobLabel.text = "dobLabel".localizableString(location: "de")
            lotteryWonLabel.text = "lotteryWonLabel".localizableString(location: "de")
            userDOBLabel.text = "userDOBLabel".localizableString(location: "de")
            userLotteryWonLabel.text = "userLotteryWonLabel".localizableString(location: "de")
        }
        else {
            // Spanish
            nameLabel.text = "nameLabel".localizableString(location: "es")
            userInfoLabel.text = "userInfoLabel".localizableString(location: "es")
            stateLabel.text = "stateLabel".localizableString(location: "es")
            countryLabel.text = "countryLabel".localizableString(location: "es")
            dobLabel.text = "dobLabel".localizableString(location: "es")
            lotteryWonLabel.text = "lotteryWonLabel".localizableString(location: "es")
            userDOBLabel.text = "userDOBLabel".localizableString(location: "es")
            userLotteryWonLabel.text = "userLotteryWonLabel".localizableString(location: "es")
        }
    }
    

}

extension String {
    func localizableString(location: String) -> String {
        let path = Bundle.main.path(forResource: location, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

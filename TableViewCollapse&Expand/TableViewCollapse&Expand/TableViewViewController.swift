//
//  TableViewViewController.swift
//  TableViewCollapse&Expand
//
//  Created by Utkarsh Patel on 26/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation
import UIKit

class TableViewViewController: UIViewController {
    var sections = sectionData
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nibRegister()
        
        
    }
}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(section)")
        let sectionModel = sections[section]
        if sections[section].items == nil {
            return 0
        }else {
            if let sectionItem = sections[section].items {
              return  sectionModel.isExpandable ? sectionItem.count : 0
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let itemModel = sections[indexPath.section].items?[indexPath.row] {
            switch itemModel.cellType {
                
            case .labelCell:
               if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell") as? LabelCell {
                cell.configureCell(itemModel: (sections[indexPath.section].items?[indexPath.row])!)
                return cell
               }
                
            case .radioCell:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell") as? RadioCell {
                    cell.configureCell(itemModel: (sections[indexPath.section].items?[indexPath.row])!)
                    return cell
                }
            case .subTitleCell:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "SubTitleCell") as? SubTitleCell {
                    cell.configureCell(itemModel: (sections[indexPath.section].items?[indexPath.row])!)
                    return cell
                }
                
            case .switchCell:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell") as? SwitchCell {
                    cell.configureCell(itemModel: (sections[indexPath.section].items?[indexPath.row])!)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let itemModel = sections[indexPath.section].items?[indexPath.row] {
            switch itemModel.cellType {
                
            case .labelCell:
               print("")
                
            case .radioCell:
                print("")
                for (index,_) in (sections[indexPath.section].items?.enumerated())! {
                    sections[indexPath.section].items![index].isSelected = false
                }
                sections[indexPath.section].items![indexPath.row].isSelected = true
                tableView.reloadData()
                
            case .subTitleCell:
                 print("")
               
                
            case .switchCell:
                 print("")
               
            }
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: SectionView = UIView.fromNib()
        let sectionModel = sectionData[section]
        headerView.sectionLabel.text = sectionModel.name
        headerView.sectionButton.tag = section
        headerView.delegate = self
        
        if section == 0 {
            headerView.topSeparationLine.isHidden = true
            headerView.arrowImage.isHidden = true
        } else if section == 1 || section == 6 || section == 7 || section == 8 {
            headerView.arrowImage.isHidden = true
        }
       
        return headerView
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}


extension TableViewViewController {
    func nibRegister() {
        let customNib = UINib(nibName: "RadioCell", bundle: nil)
        tableView.register(customNib, forCellReuseIdentifier: "RadioCell")
        let subTitleNib = UINib(nibName: "SubTitleCell", bundle: nil)
        tableView.register(subTitleNib, forCellReuseIdentifier: "SubTitleCell")
        let switchNib = UINib(nibName: "SwitchCell", bundle: nil)
        tableView.register(switchNib, forCellReuseIdentifier: "SwitchCell")
        let labelCellNib = UINib(nibName: "LabelCell", bundle: nil)
        tableView.register(labelCellNib, forCellReuseIdentifier: "LabelCell")
    }
}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: T.self, options: nil)![0] as! T
    }
}

extension TableViewViewController: CollapsibleSectionDelegate {
    func toggleSection(section: Int) {
        let headerView: SectionView = UIView.fromNib()
        sections[section].isExpandable = !sections[section].isExpandable
        tableView.reloadSections(IndexSet(integer: section), with: .fade)
        if sections[section].isExpandable {
            // MARK: Animation for Rotation
            
            headerView.rotate360()
//            UIView.animate(withDuration: 0.4, animations: {
//                headerView.arrowImage.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
//            })
//         headerView.arrowImage.rotate360Degrees()

        } else {
            headerView.rotate180()
//            UIView.animate(withDuration: 0.4, animations: {
//                headerView.arrowImage.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
//            })
//            headerView.arrowImage.rotate360Degrees()
        }
    }
}

extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 1) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        layer.add(rotateAnimation, forKey: nil)
    }
    
    func stopRotation () {
        layer.removeAllAnimations()
    }
    
}

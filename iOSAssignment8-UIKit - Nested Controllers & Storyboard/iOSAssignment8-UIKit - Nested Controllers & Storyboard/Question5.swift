//
//  Question5.swift
//  iOSAssignment8-UIKit - Nested Controllers & Storyboard
//
//  Created by Utkarsh Patel on 09/03/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import UIKit

class Question5: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let orangeViewController = storyboard.instantiateViewController(withIdentifier: "orange")
        let lightGreenViewController = storyboard.instantiateViewController(withIdentifier: "green")
        let greenViewController = storyboard.instantiateViewController(withIdentifier: "lightGreen")
        
        return [orangeViewController,lightGreenViewController,greenViewController]
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question 5"

        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
        }
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let indexOfViewController = viewControllerList.firstIndex(of: viewController)
            else { return nil }
        
        let previousIndex = indexOfViewController - 1
        
        guard previousIndex >= 0  else {
            return nil
            
            guard viewControllerList.count > previousIndex  else {
                return nil
            }
        }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let indexOfViewController = viewControllerList.firstIndex(of: viewController)
            else { return nil }
        
        let nextIndex = indexOfViewController + 1
        
        guard nextIndex != 0  else {
            return nil
            
            guard viewControllerList.count > nextIndex  else {
                return nil
            }
        }
        
        return viewControllerList[nextIndex]
        
    }

}

//
//  MenuViewController.swift
//  realms
//
//  Created by Mean Reaksmey on 11/1/16.
//  Copyright © 2016 Mean Reaksmey. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBAction func btnDisplay(_ sender: AnyObject) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "InsertViewController") as! InsertViewController
        
        // Creating a navigation controller with viewController at the root of the navigation stack.
        let navController = UINavigationController(rootViewController: viewController)
        self.showDetailViewController(navController, sender: nil)
    } 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

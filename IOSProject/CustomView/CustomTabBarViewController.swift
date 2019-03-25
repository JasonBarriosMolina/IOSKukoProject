//
//  CustomTabBarViewController.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/24/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    public var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let invoice = R.storyboard.login().instantiateInitialViewController() as? InvoiceViewController
        invoice?.router?.dataStore?.username = username
        
        let customer = R.storyboard.login().instantiateInitialViewController() as? CustomerViewController
        customer?.router?.dataStore?.username = username
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

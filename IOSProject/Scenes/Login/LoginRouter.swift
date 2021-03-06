//
//  LoginRouter.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/21/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func goToNextView(username: String, name:String)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  
  // MARK: Routing
  
    func goToNextView(username: String, name:String)
    {

//        if let invoiceViewController = R.storyboard.login().instantiateInitialViewController() as? InvoiceViewController {
//            invoiceViewController.router?.dataStore?.username = username
//            invoiceViewController.router?.dataStore?.name = name
//        }
//
//        if let customerViewController = R.storyboard.login().instantiateInitialViewController() as? CustomerViewController {
//            customerViewController.router?.dataStore?.username = username
//        }

//        let customTabViewController =  R.storyboard.login().instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        
//        customTabViewController.username = username
        
//        let invoice = customTabViewController.navigationController?.viewControllers[0] as? InvoiceViewController;
//        invoice?.router?.dataStore?.username = username
//
//        let customer = customTabViewController.navigationController?.viewControllers[1] as? CustomerViewController;
//        customer?.router?.dataStore?.username = username
        
//        changeRootViewController(viewController: customTabViewController)
        
//        let tabBarController = R.storyboard.login().instantiateInitialViewController() as? CustomTabBarViewController
//        tabBarController?.username = username
        
        
//        changeRootViewController(viewController: customTabViewController)
        
        let tabBarController : CustomTabBarViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        tabBarController.username = username
        
        //self.present(displayVC, animated: true, completion: nil)
        
        changeRootViewController(viewController: tabBarController)
        
    }
    
    func changeRootViewController(viewController: UIViewController) {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let snapshot:UIView = (appDelegate.window!.snapshotView(afterScreenUpdates: true))!
        viewController.view.addSubview(snapshot)
        appDelegate.window!.rootViewController = viewController
        UIView.animate(withDuration: 0.3, animations: {() in
            snapshot.layer.opacity = 0;
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
        });
    }
}

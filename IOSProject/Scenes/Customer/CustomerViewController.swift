//
//  CustomerViewController.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/20/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import JGProgressHUD

protocol CustomerDisplayLogic: class
{
  func displayDataSource(viewModel: Customer.DataSource.ViewModel)
}

class CustomerViewController: UIViewController, CustomerDisplayLogic {
    
    var interactor: CustomerBusinessLogic?
    var router: (NSObjectProtocol & CustomerRoutingLogic & CustomerDataPassing)?
    //private let customCellIdentifier = "CustomInvoiceTableViewCell"
    
    
    // MARK: IBOutlets
    var dataSource = [Customer.DataSource.ViewModel.DisplayedItem]()
    @IBOutlet weak var tableView: UITableView!
    var activityIndicator = JGProgressHUD(style: .dark)
    public var username: String?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CustomerInteractor()
        let presenter = CustomerPresenter()
        let router = CustomerRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        activityIndicator.textLabel.text = "Loading..."
        
        print("Customer \(String(describing: self.username))")
        
        requestDataSource(username: username ?? "")
    }
    
    // MARK: Request logic
    func requestDataSource(username:String) {
        activityIndicator.show(in: view)
        interactor?.requestDataSource(username: username)
    }
    
    
    // MARK: Display logic
    func displayDataSource(viewModel: Customer.DataSource.ViewModel) {
        dataSource = viewModel.displayedItems
        tableView.reloadData()
        activityIndicator.dismiss()
    }
}


extension CustomerViewController: UITableViewDataSource, UITableViewDelegate {
    func registerCustomCell() {
        tableView.register(UINib(resource: R.nib.customCustomerTableViewCell), forCellReuseIdentifier: R.nib.customCustomerTableViewCell.name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.customCustomerTableViewCell.name) as? CustomCustomerTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(item: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToNextView(indexPath: indexPath)
    }
}
//
//  InvoiceDetailPresenter.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/23/19.
//  Copyright (c) 2019 Jason Barrios. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol InvoiceDetailPresentationLogic
{
  func presentUIInformation(response: InvoiceDetail.UIInformation.Response)
}

class InvoiceDetailPresenter: InvoiceDetailPresentationLogic
{
  weak var viewController: InvoiceDetailDisplayLogic?
  
  // MARK: Do something
  
    func presentUIInformation(response: InvoiceDetail.UIInformation.Response) {
        
        let invoice = InvoiceDetail.UIInformation.ViewModel.DisplayedItem.init(invoicenumber: response.item?.InvoiceNumber, invoicecodemh: response.item?.InvoiceCodeMH, grossprice: response.item?.GrossPrice, netprice: response.item?.NetPrice, createdate: response.item?.CreateDate ?? "", id: response.item?.Id)
        
        viewController?.displayUIInformation(viewModel: InvoiceDetail.UIInformation.ViewModel.init(displayedItem: invoice))
    }
}

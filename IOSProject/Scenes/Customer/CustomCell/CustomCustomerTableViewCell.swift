//
//  CustomCustomerTableViewCell.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/20/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import UIKit

class CustomCustomerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupCell(item: Customer.DataSource.ViewModel.DisplayedItem) {
//        lblInvoiceNumber.text = item.invoicenumber
//        lblCreateDate.text = item.invoicecodemh
//        lblNetPrice.text = "\(String(describing: item.netprice))"
//        imgIcon.image = R.image.invoice()
    }
}

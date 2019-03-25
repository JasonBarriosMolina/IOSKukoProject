//
//  CustomInvoiceTableViewCell.swift
//  IOSProject
//
//  Created by Jason Barrios on 3/19/19.
//  Copyright © 2019 Jason Barrios. All rights reserved.
//

import UIKit

class CustomInvoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblInvoiceNumber: UILabel!
    @IBOutlet weak var lblNetPrice: UILabel!
    @IBOutlet weak var lblCreateDate: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupCell(item: Invoice.DataSource.ViewModel.DisplayedItem) {
        lblInvoiceNumber.text = item.invoicenumber
        lblCreateDate.text = item.invoicecodemh
        lblNetPrice.text = "\(String(describing: item.netprice))"
        imgIcon.image = R.image.invoice()
    }
}

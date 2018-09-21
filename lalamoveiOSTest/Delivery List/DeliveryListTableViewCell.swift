//
//  DeliveryListTableViewCell.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 17/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import UIKit
import Kingfisher

class DeliveryListTableViewCell: UITableViewCell {
    private let detailImage: UIImageView = UIImageView()
    private let lblDetails: UILabel = UILabel()
    private let superBackView: UIView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        lblDetails.translatesAutoresizingMaskIntoConstraints = false
        superBackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(superBackView)
        self.selectionStyle = .none
        superBackView.addSubview(detailImage)
        superBackView.addSubview(lblDetails)
        superBackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        superBackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        superBackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        superBackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        superBackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: superBackView.leadingAnchor).isActive = true
        detailImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        detailImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        detailImage.centerYAnchor.constraint(equalTo: superBackView.centerYAnchor).isActive = true
        lblDetails.topAnchor.constraint(equalTo: superBackView.topAnchor, constant: 2).isActive = true
        lblDetails.bottomAnchor.constraint(equalTo: superBackView.bottomAnchor, constant: 2).isActive = true
        lblDetails.leadingAnchor.constraint(equalTo: detailImage.trailingAnchor, constant: 10).isActive = true
        lblDetails.trailingAnchor.constraint(equalTo: superBackView.trailingAnchor, constant: 2).isActive = true
        superBackView.backgroundColor = .clear
        superBackView.layer.borderColor = UIColor.black.cgColor
        superBackView.layer.borderWidth = 1
        lblDetails.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension DeliveryListTableViewCell{
    func setUpCellWith(data response: DeliveryListData?){
        
        guard let responseVal = response else {
            detailImage.image = nil
            lblDetails.text = "No delivery address found!"
            return
        }
        
        if let imageUrl = responseVal.imageUrl, !imageUrl.isEmpty{
            detailImage.kf.setImage(with: URL(string: imageUrl))
        } else {
            detailImage.image = nil
        }
        
        if let description = responseVal.description, !description.isEmpty,
            let address = responseVal.location?.address, !address.isEmpty{
            lblDetails.text = "\(description) at \(address)"
        } else {
            lblDetails.text = "No delivery address found!"
        }
        
    }
}

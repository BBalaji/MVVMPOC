//
//  MVVMInfoTableViewCell.swift
//  BalajiMVVMPoc
//
//  Created by Besta, Balaji (623-Extern) on 11/12/20.
//

import Foundation
import UIKit
class MVVMInfoTableViewCell: UITableViewCell {
    static let identifier = "MVVMInfoTableViewCell"
    
    var contactViewModel:MVVMViewModel? {
        didSet {
            guard let rowItem = contactViewModel else {return}
            if let name = rowItem.title {
                titleLabel.text = name
            }
            if let description = rowItem.description {
                descriptionLabel.text = " \(description) "
            }
            if let imagetitle = rowItem.image {
                self.photoView.image = UIImage.init(named: imagetitle)
            }
            
        }
    }
    
    var rowViewModel:RowModel? {
        didSet {
            guard let rowItem = rowViewModel else {return}
            if let name = rowItem.title {
                titleLabel.text = name
            }
            if let description = rowItem.rowDescription {
                descriptionLabel.text = " \(description) "
            }
            if let imagetitle = rowItem.imageHref {
                self.photoView.image = UIImage.init(named: imagetitle)
            }
            
        }
    }
    // MARK: - Image
    let photoView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 25
        img.clipsToBounds = true
        return img
    }()

    // MARK: - Title
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Description
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(photoView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        
        let views = [
            "image" : photoView,
            "title"  : titleLabel,
            "description" : descriptionLabel,
            ]
        
        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(50)]", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-[description]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(50)]-[title]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image]-[description]-|", options: [], metrics: nil, views: views)
        
         NSLayoutConstraint.activate(allConstraints)
        
    }
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
}

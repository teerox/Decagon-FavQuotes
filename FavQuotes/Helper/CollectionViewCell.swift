//
//  CollectionViewCell.swift
//  FavQuotes
//
//  Created by Anthony Odu on 29/04/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryName: UILabel!
    class var reuseIdentifier: String {
        return "CollectionViewCellReuseIdentifier"
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

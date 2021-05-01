//
//  TableViewCell.swift
//  FavQuotes
//
//  Created by Anthony Odu on 29/04/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var tiltleLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    class var reuseIdentifier: String {
        return "TableViewCellReuseIdentifier"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

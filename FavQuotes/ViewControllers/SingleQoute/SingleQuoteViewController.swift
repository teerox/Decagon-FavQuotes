//
//  SingleQuoteViewController.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import UIKit

class SingleQuoteViewController: UIViewController {

    @IBOutlet weak var singleQuoteImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var tyoelabel: UILabel!
    var eachSingleQoute: EachCategory?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = eachSingleQoute?.title
        loadData(data: eachSingleQoute)
    }
    func loadData(data: EachCategory?) {
        if let result = data {
            singleQuoteImage.downloaded(from: result.media)
            authorLabel.text = data?.author
            tyoelabel.text = data?.title
        }
    }
}

//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Mr. Naveen Kumar on 15/12/20.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    let cellIdentifier = "MyCollectionViewCell"
    let nibName = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(model: Model) {
        imgView.image = model.imgName
        lbl.text = model.lblName
    }
    
    
    func nib() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
}

//
//  CellExampleCollectionViewCell.swift
//  ShimmeringExample
//
//  Created by eduardo.silva on 05/02/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

class CellExampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentViewMain: UIView!
    @IBOutlet weak var contentView1: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentViewMain.backgroundColor = .clear
        self.contentView1.backgroundColor = .gray
    }

}

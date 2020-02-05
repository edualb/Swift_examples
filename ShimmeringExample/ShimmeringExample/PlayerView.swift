//
//  PlayerView.swift
//  ShimmeringExample
//
//  Created by eduardo.silva on 05/02/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

class PlayerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var playImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)
        addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.playImage.image = UIImage(named: "play")
        self.playImage.image = self.playImage.image?.withRenderingMode(.alwaysTemplate)
        self.playImage.tintColor = .gray
        self.playImage.contentMode = .scaleToFill
    }
    
}

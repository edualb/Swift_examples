//
//  ShimmeringViewController.swift
//  shimmeringTest
//
//  Created by eduardo.silva on 31/01/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

class ShimmeringViewController: UIViewController {

    let cellId = "cellId"
    
    let newCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .green
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    let viewExample: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCollectionView.delegate = self
        newCollectionView.dataSource = self
        newCollectionView.register(ShimmeringCell.self, forCellWithReuseIdentifier: cellId)
        self.view.addSubview(self.newCollectionView)
        setupCollection()
        
        self.viewExample.alpha = 0.6
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.viewExample.alpha = 0
        }, completion: nil)
    }
    

    private func setupCollection() {
        self.newCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.newCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.newCollectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        self.newCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        self.view.addSubview(self.viewExample)
        setupViewExample()
    }
    
    private func setupViewExample() {
        self.viewExample.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.viewExample.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.viewExample.heightAnchor.constraint(equalToConstant: 400).isActive = true
        self.viewExample.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }

}


extension ShimmeringViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.newCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
}

class CustomCell: UICollectionViewCell {
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I'm not Shimmering"
        label.font = UIFont(name: "MarkerFelt-Thin", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .red
        self.addSubview(firstLabel)
        
        firstLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
}

class ShimmeringCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

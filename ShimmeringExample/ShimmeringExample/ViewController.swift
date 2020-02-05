//
//  ViewController.swift
//  ShimmeringExample
//
//  Created by eduardo.silva on 05/02/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    let viewExample: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewExample2: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let nibCell = UINib(nibName: "CellExampleCollectionViewCell", bundle: nil)
        self.collectionView.register(nibCell, forCellWithReuseIdentifier: cellId)
        self.view.addSubview(self.collectionView)
        self.setupCollectionView()
        self.setupPlayerView()
        
        self.viewExample.alpha = 1.0
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.viewExample.alpha = 0.1
        }, completion: nil)
        
        self.viewExample2.alpha = 1.0
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.viewExample2.alpha = 0.1
        }, completion: nil)
    }
    
    private func setupPlayerView() {
        self.view.addSubview(self.viewExample2)
        self.viewExample2.topAnchor.constraint(equalTo: self.playerView.topAnchor).isActive = true
        self.viewExample2.bottomAnchor.constraint(equalTo: self.playerView.bottomAnchor).isActive = true
        self.viewExample2.leadingAnchor.constraint(equalTo: self.playerView.leadingAnchor).isActive = true
        self.viewExample2.trailingAnchor.constraint(equalTo: self.playerView.trailingAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        self.collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.playerView.bottomAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.view.addSubview(self.viewExample)
        self.viewExample.topAnchor.constraint(equalTo: self.collectionView.topAnchor).isActive = true
        self.viewExample.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor).isActive = true
        self.viewExample.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor).isActive = true
        self.viewExample.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor).isActive = true
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0)
    }
    
}

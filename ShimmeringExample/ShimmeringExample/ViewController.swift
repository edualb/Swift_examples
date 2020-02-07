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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let nibCell = UINib(nibName: "CellExampleCollectionViewCell", bundle: nil)
        self.collectionView.register(nibCell, forCellWithReuseIdentifier: cellId)
        self.view.addSubview(self.collectionView)
        self.setupCollectionView()
        
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (_) in
//            self.view.startShimmering(at: self.collectionView, backgroundColor: .darkGray, )
//            self.view.startShimmering(at: self.playerView, backgroundColor: .darkGray, )
//            self.view.startShimmering(at: [self.playerView, self.collectionView], backgroundColor: .darkGray)
            self.view.startShimmeringAll(backgroundColor: .darkGray)
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (_) in
//                self.view.stopShimmering(at: self.playerView)
//                self.view.stopShimmering(at: self.collectionView)
//                self.view.stopShimmering(at: [self.playerView, self.collectionView])
                self.view.stopShimmeringAll()
            }
        }

    }
    
    private func setupCollectionView() {
        self.collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.playerView.bottomAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
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

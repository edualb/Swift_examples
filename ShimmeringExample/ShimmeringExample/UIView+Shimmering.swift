//
//  UIView+Shimmering.swift
//  ShimmeringExample
//
//  Created by eduardo.silva on 06/02/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

fileprivate let tagNumber: Int = 6501

extension UIView {
    
    func startShimmering(backgroundColor: UIColor, at view: UIView, allowUserInteraction: Bool? = false) {
        if let allowInteraction = allowUserInteraction {
            let shimmeringView = getShimmeringView(backgroundColor)
            self.addSubview(shimmeringView)
            self.buildShimmeringContraints(viewMain: shimmeringView, viewBased: view)
            self.loopShimmering(allowUserInteraction: allowInteraction, view: shimmeringView)
        }
    }
    
    func startShimmering(backgroundColor: UIColor, at views: [UIView], allowUserInteraction: Bool? = false) {
        if let allowInteraction = allowUserInteraction {
            for view in views {
                let shimmeringView = getShimmeringView(backgroundColor)
                self.addSubview(shimmeringView)
                self.buildShimmeringContraints(viewMain: shimmeringView, viewBased: view)
                self.loopShimmering(allowUserInteraction: allowInteraction, view: shimmeringView)
            }
        }
    }
    
    func stopShimmering(at view: UIView) {
        for subview in self.subviews {
            if subview.tag == tagNumber && subview.frame.intersects(view.frame) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func stopShimmering(at views: [UIView]) {
        for view in views {
            for subview in self.subviews {
                if subview.tag == tagNumber && subview.frame.intersects(view.frame) {
                    subview.removeFromSuperview()
                }
            }
        }
    }
}

private extension UIView {
    
    func buildShimmeringContraints(viewMain: UIView, viewBased: UIView) {
        viewMain.topAnchor.constraint(equalTo: viewBased.topAnchor).isActive = true
        viewMain.bottomAnchor.constraint(equalTo: viewBased.bottomAnchor).isActive = true
        viewMain.leadingAnchor.constraint(equalTo: viewBased.leadingAnchor).isActive = true
        viewMain.trailingAnchor.constraint(equalTo: viewBased.trailingAnchor).isActive = true
    }
    
    func loopShimmering(allowUserInteraction: Bool, view: UIView) {
        
        let options: AnimationOptions = allowUserInteraction ? [.repeat, .autoreverse, .allowUserInteraction] : [.repeat, .autoreverse]
        
        view.alpha = 1.0
        UIView.animate(withDuration: 1.0, delay: 0, options: options, animations: {
            view.alpha = allowUserInteraction ? 0 : 0.01
        }, completion: nil)
    }
    
    func getShimmeringView(_ backgroundColor: UIColor) -> UIView {
        let shimmeringView = UIView()
        shimmeringView.backgroundColor = backgroundColor
        shimmeringView.translatesAutoresizingMaskIntoConstraints = false
        shimmeringView.tag = tagNumber
        return shimmeringView
    }
}

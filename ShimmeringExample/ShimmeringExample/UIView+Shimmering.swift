//
//  UIView+Shimmering.swift
//  ShimmeringExample
//
//  Created by eduardo.silva on 06/02/20.
//  Copyright © 2020 eduardo.silva. All rights reserved.
//

import UIKit

// MARK: Extension UIView

extension UIView {
    
    // MARK: StartShimmering
    
    func startShimmering(at view: UIView, backgroundColor: UIColor, allowUserInteraction: Bool? = false) {
        if let allowInteraction = allowUserInteraction {
            let shimmeringView = self.getShimmeringView(backgroundColor)
            self.addSubview(shimmeringView)
            shimmeringView.buildConstraints(view: view)
            shimmeringView.startAnimation(allowUserInteraction: allowInteraction)
        }
    }
    
    func startShimmering(at views: [UIView], backgroundColor: UIColor, allowUserInteraction: Bool? = false) {
        if let allowInteraction = allowUserInteraction {
            for view in views {
                let shimmeringView = self.getShimmeringView(backgroundColor)
                self.addSubview(shimmeringView)
                shimmeringView.buildConstraints(view: view)
                shimmeringView.startAnimation(allowUserInteraction: allowInteraction)
            }
        }
    }
    
    func startShimmeringAll(backgroundColor: UIColor, allowUserInteraction: Bool? = false) {
        if let allowInteraction = allowUserInteraction {
            let shimmeringView = self.getShimmeringView(backgroundColor)
            self.addSubview(shimmeringView)
            shimmeringView.buildConstraints(view: self)
            shimmeringView.startAnimation(allowUserInteraction: allowInteraction)
        }
    }
    
    // MARK: StopShimmering
    
    func stopShimmering(at view: UIView) {
        for subview in self.subviews {
            if subview is AnimationProtocol && subview.frame.intersects(view.frame) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func stopShimmering(at views: [UIView]) {
        for view in views {
            for subview in self.subviews {
                if subview is AnimationProtocol && subview.frame.intersects(view.frame) {
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func stopShimmeringAll() {
        for subview in self.subviews {
            if subview is AnimationProtocol && subview.frame.intersects(self.frame) {
                subview.removeFromSuperview()
            }
        }
    }
    
}

private extension UIView {
    
    func getShimmeringView(_ backgroundColor: UIColor) -> ShimmeringView {
        let shimmeringView = ShimmeringView()
        shimmeringView.setup(backgroundColor: backgroundColor)
        return shimmeringView
    }
}

// MARK: AnimationProtocol

fileprivate protocol AnimationProtocol {
    func startAnimation(allowUserInteraction: Bool)
    func buildConstraints(view: UIView)
    func setup(backgroundColor: UIColor)
}

// MARK: ShimmeringView

fileprivate final class ShimmeringView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShimmeringView: AnimationProtocol {
    
    func setup(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func buildConstraints(view: UIView) {
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func startAnimation(allowUserInteraction: Bool) {
        let options: AnimationOptions = allowUserInteraction ? [.repeat, .autoreverse, .allowUserInteraction] : [.repeat, .autoreverse]
        
        self.alpha = 1.0
        UIView.animate(withDuration: 1.0, delay: 0, options: options, animations: {
            self.alpha = allowUserInteraction ? 0 : 0.01
        }, completion: nil)
    }
}

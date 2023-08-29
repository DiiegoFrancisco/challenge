//
//  UIExtension.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 28/08/23.
//

import UIKit

extension UIViewController {
    private static var loadingindicator: UIActivityIndicatorView?
    
    func startLoading() {
        if UIViewController.loadingindicator == nil {
            UIViewController.loadingindicator = UIActivityIndicatorView(style: .large)
            UIViewController.loadingindicator?.color = .red
            UIViewController.loadingindicator?.center = view.center
            UIViewController.loadingindicator?.hidesWhenStopped = true
            view.addSubview(UIViewController.loadingindicator ?? UIActivityIndicatorView())
        }
        UIViewController.loadingindicator?.startAnimating()
    }
    
    func stopLoading() {
        UIViewController.loadingindicator?.stopAnimating()
    }
}

extension UIView {
    func showToast(message: String, duration: TimeInterval = 4.0) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 15)
        toastLabel.text = message
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let toastWidth: CGFloat = min(300, self.bounds.size.width - 40)
        let toastHeight: CGFloat = 40
        toastLabel.frame = CGRect(x: self.frame.size.width,
                                  y: self.frame.size.height,
                                  width: toastWidth,
                                  height: toastHeight)
        self.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseIn, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseIn, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
                           
        })
    }
}

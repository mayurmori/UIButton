//
//  ViewController.swift
//  UIButton
//
//  Created by Mayur Mori on 10/09/19.
//  Copyright © 2019 Mayur Mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES -
    var btnGo = UIButton()
    var topConstraints = NSLayoutConstraint()
    var isAnimating = true
    
    // MARK: - VIEW LIFE CYCLE METHODS -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
    }
    
    // MARK: - FUNCTIONS -
    func createButton() {
        btnGo.setTitle("GO & Play >", for: .normal)
        btnGo.setTitleColor(UIColor.yellow, for: .normal)
        btnGo.backgroundColor = UIColor.lightGray
        
        // Round
        btnGo.layer.borderWidth = 2
        btnGo.layer.cornerRadius = 18
        
        // Alignment
        btnGo.frame = CGRect(x: view.frame.width/2-50, y: view.frame.height/2-18, width: 100, height: 36)
        
        view.addSubview(btnGo)
        
        
        // Auto Constraints
        btnGo.translatesAutoresizingMaskIntoConstraints = false
        
        // Left
        let leftConstraints = NSLayoutConstraint(item: btnGo, attribute: .leftMargin, relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1.0, constant: 0)
        
        // Right
        let rightConstraints = NSLayoutConstraint(item: btnGo, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1.0, constant: 0)
        
        // Top
        topConstraints = NSLayoutConstraint(item: btnGo, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)
        
        // Add Constraints
        view.addConstraints([leftConstraints,rightConstraints,topConstraints])
        
        btnGo.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
    }
    
    // MARK: - IB ACTIONS -
    @objc func playPressed() {
        if isAnimating {
            UIView.animate(withDuration: 0.5, animations: {
                self.topConstraints.constant = 100
                self.btnGo.layer.cornerRadius = 10.0
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.topConstraints.constant = 0
                self.btnGo.layer.cornerRadius = 0
                self.view.layoutIfNeeded()
            })
        }
        isAnimating = !isAnimating
    }
}

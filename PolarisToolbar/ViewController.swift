//
//  ViewController.swift
//  PolarisToolbar
//
//  Created by Victor K. Lee on 11/03/2019.
//  Copyright © 2019 kingpin11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainToolbar: UIView!
    @IBOutlet var drawToolbar: UIView!
    @IBOutlet var findToolbar: UIView!
    @IBOutlet var drawToolbarToggleBtn: UIButton!
    @IBOutlet var findToolbarToggleBtn: UIButton!
    @IBOutlet weak var slideNote: UIView!
    var drawToolbarHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var slideNoteHeightConstraint: NSLayoutConstraint!
    
    override public var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isPortrait {
            return UITraitCollection(traitsFrom:[UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .regular)])
        }
        return super.traitCollection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func toggleDrawToolbar(_ sender: Any) {
        drawToolbarHeightConstraint?.isActive = false
        
        if drawToolbar.frame.height != 0 {
            drawToolbarHeightConstraint = drawToolbar.heightAnchor.constraint(equalToConstant: 0)
            drawToolbarToggleBtn.setTitle("Show DrawToolbar", for: .normal)
        } else {
            drawToolbarHeightConstraint = drawToolbar.heightAnchor.constraint(equalToConstant: 44)
            drawToolbarToggleBtn.setTitle("Hide DrawToolbar", for: .normal)
        }
        UIView.animate(withDuration: 0.3) {
            self.drawToolbarHeightConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func toggleFindToolbar(_ sender: Any) {
        
    }
    @IBAction func toggleSlideNote(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.slideNoteHeightConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (isFinished) in
            self.slideNote.isHidden = true
        }
    }
    
    @IBAction func onTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if view.bounds.width  < view.bounds.height {
            let traitCollections = [UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .regular)]
            return  UITraitCollection(traitsFrom: traitCollections)
        } else {
            let traitCollections = [UITraitCollection(horizontalSizeClass: .unspecified), UITraitCollection(verticalSizeClass: .unspecified)]
            return  UITraitCollection(traitsFrom: traitCollections)
        }
    }
}


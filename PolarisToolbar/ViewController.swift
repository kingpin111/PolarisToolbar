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
    var drawToolbarHeightConstraint: NSLayoutConstraint?
    
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
        UIView.animate(withDuration: 1) {
            self.drawToolbarHeightConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func toggleFindToolbar(_ sender: Any) {
        
    }
    
    @IBAction func onTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
}


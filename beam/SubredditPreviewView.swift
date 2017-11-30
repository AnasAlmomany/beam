//
//  SubredditPreviewView.swift
//  beam
//
//  Created by Rens Verhoeven on 20/10/2017.
//  Copyright © 2017 Awkward. All rights reserved.
//

import UIKit
import Snoo

final class SubredditPreviewView: UIView {
    
    var subreddit: Subreddit? {
        didSet {
            guard let displayName = self.subreddit?.displayName, displayName.count > 0 else {
                label.text = nil
                return
            }
            label.text =  displayName.substring(to: displayName.index(displayName.startIndex, offsetBy: 1)).uppercased()
        }
    }
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFontWeightLight)
        label.textColor = UIColor.beamGreyLight()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        self.addSubview(self.imageView)
        self.addSubview(self.label)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        let constraints = [
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.rightAnchor.constraint(equalTo: self.imageView.rightAnchor),
            
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}

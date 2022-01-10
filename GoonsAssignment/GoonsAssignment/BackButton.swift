//
//  BackButton.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/9.
//

import UIKit

protocol BackButtonDelegate: AnyObject {
    func popViewController()
}

class BackButton: UIButton {
    
    weak var delegate: BackButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        self.tintColor = .black
        
        let image = UIImage.asset(.back)
        
        self.setImage(image, for: .normal)
        
        self.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @objc func buttonDidTapped(_sender: UIButton){
        delegate?.popViewController()
    }
}

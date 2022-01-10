//
//  ViewController.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/7.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y:0 , width: 100, height: 50))
        button.setTitle("下一頁", for: .normal)
        button.center = view.center
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(pushToNextPage), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        
        self.title = "第一頁"
    }
    
    @objc func pushToNextPage(_ sender: UIButton) {
        
        let vc2 = SecondViewController()
        
        navigationController?.pushViewController(vc2, animated: true)
    }
}

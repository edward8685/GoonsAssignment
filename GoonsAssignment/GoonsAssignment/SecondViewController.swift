//
//  SecondViewController.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/7.
//

import UIKit

class SecondViewController: UIViewController {
    
    var statusBarStyleIsBlack = false  {
        didSet {
            navigationController?.navigationBar.barStyle = statusBarStyleIsBlack ? .default : .black
        }
    }
    
    lazy var statusBarView: UIView = {
        let statusBarframe = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        let view = UIView(frame: statusBarframe)
        view.isOpaque = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width:width, height: 1150)
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var topView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: 300))
        let image = UIImage.asset(.dog)
        view.image = image
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var dimView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 250, width: width, height: 900)
        view.backgroundColor = .red
        view.roundCorner(cornerRadius: 24, type: .rightTop)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        scrollView.delegate = self
        
        setNavigationBar()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(topView)
        
        scrollView.addSubview(dimView)
        
        setTitle(title: "果思設計", subtitle: "iOS APP")
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(statusBarView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
        navigationController?.navigationBar.barStyle = .default
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func setTitle(title: String, subtitle: String) {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = .white
        subtitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        subtitleLabel.sizeToFit()
        
        let stackView = UIStackView(frame: CGRect(x: 20, y: statusBarframe.height + 50, width: 100, height: 50))
        
        stackView.axis = .vertical
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        scrollView.addSubview(stackView)
    }
    
    func setNavigationBar() {
        
        self.title = "果思設計"
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.clear]
        
        setNavButton()
        
        //進入畫面時放大的navi設定 -> StatusBar Style can only change once
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //
        //        let scrollEdgeAppearance =  UINavigationBarAppearance()
        //
        //        scrollEdgeAppearance.configureWithTransparentBackground()
        //
        //        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        //
        //        navigationController?.navigationBar.barTintColor = .white
        
        //滑動時刻navi設定
        //        let standardAppearance =  UINavigationBarAppearance()
        //
        //        standardAppearance.configureWithTransparentBackground()
        //
        //        standardAppearance.backgroundColor = .white
        //
        //        navigationController?.navigationBar.standardAppearance = standardAppearance
    }
    
    func setNavButton(){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let button = BackButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        button.delegate = self
        
        let leftButton = UIBarButtonItem(customView: button)
        
        navigationItem.setLeftBarButton(leftButton, animated: true)
    }
}

extension SecondViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        let ratio = (offsetY - topbarHeight) / (topView.bounds.height - topbarHeight)
        
        statusBarStyleIsBlack = offsetY >= topbarHeight ? true : false
        
        if ratio >= 0 {
            
            statusBarView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: ratio)
            
            navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: ratio)
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor :  UIColor(red: 0, green: 0, blue: 0, alpha: ratio)]
            
        } else {
            
            statusBarView.backgroundColor = .clear
            
            navigationController?.navigationBar.backgroundColor = .clear
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor :  UIColor.clear]
        }
    }
}

extension SecondViewController: BackButtonDelegate {
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

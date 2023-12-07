//
//  FareShareDeeplinkHandler.swift
//  LensReceiptsDemo
//
//  Created by mahender.r.gurram on 23/11/23.
//

import Foundation
import UIKit

final class FareShareDeeplinkHandler: DeeplinkHandlerProtocol {

    
    private weak var rootViewController: UIViewController?
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    // MARK: - DeeplinkHandlerProtocol
    
    func canOpenURL(_ url: URL) -> Bool {
        return true;//url.absoluteString.hasPrefix("Fareshare://1234")
    }
    func openURL(_ url: URL) {
        guard canOpenURL(url) else {
            return
        }
        
        // mock the navigation
        let viewController = UIViewController()
        switch url.path {
        case "/new":
            viewController.title = "Home"
            viewController.view.backgroundColor = .orange
        default:
            viewController.title = "Home"
            viewController.view.backgroundColor = .cyan
        }
        
        self.addButton1(vc: viewController)
        self.addButton2(vc: viewController)
        
        rootViewController?.present(viewController, animated: true)
    }
    
    func addButton1(vc: UIViewController){
            
            let button = UIButton(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
            button.setTitle("Approve", for: .normal)
            button.setTitleColor(.red, for: .normal)
            
            button.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
            button.layer.cornerRadius = 10;
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.clipsToBounds = true;
            
//            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            vc.view.addSubview(button)
            
        }
        
    func addButton2(vc: UIViewController){
            
            let button2 = UIButton()
            button2.setTitle("Reject", for: .normal)
            button2.backgroundColor = UIColor.red
            vc.view.addSubview(button2)
            
            button2.translatesAutoresizingMaskIntoConstraints = false
            var allConstraints: [NSLayoutConstraint] = []
        let views = ["view": vc.view!, "button2": button2]
            
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=10)-[button2(200)]-(>=10)-|", metrics: nil, views: views)
            allConstraints += horizontalConstraints
            button2.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
                    
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(<=120)-[button2(50)]", metrics: nil, views: views)
            allConstraints += verticalConstraints
            NSLayoutConstraint.activate(allConstraints)
            
//            button2.addTarget(vc, action: #selector(buttonAction), for: .touchUpInside)
            
        }
        
}

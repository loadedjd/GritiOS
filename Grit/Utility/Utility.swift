//
//  Utility.swift
//  SoundMap6
//
//  Created by Jared Williams on 1/20/18.
//  Copyright © 2018 Jared Williams. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Colors {
    static var niceGreen = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 0.95)
    static var nicePink = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 0.95)
    static var niceBlue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.95)
}

class Utility {
    
    
    
    /***
     
     Creates a navigation controller with the specified root view controller, tab bar controller title, navigation title, bar buttons, and bar tint color
     
     **/
    
    static func createNavigationController(title: String, controller: UIViewController, buttons: [UIBarButtonItem]?, color: UIColor, tabTitle: String, textColor: UIColor) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.topItem?.title = title
        nav.navigationBar.barTintColor = color
        nav.tabBarItem.title = tabTitle
        nav.navigationBar.prefersLargeTitles = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : textColor]
        
        if let barButtons = buttons {
            if barButtons.count % 2 == 0 {
                let leftButtons = barButtons[0..<(barButtons.count / 2)]
                nav.navigationBar.topItem?.leftBarButtonItems = Array(leftButtons)
                
                let rightButtons = barButtons[ (barButtons.count / 2) ..< barButtons.count]
                nav.navigationBar.topItem?.rightBarButtonItems = Array(rightButtons)
                
            } else {
                let rightCount = barButtons.count / 2
                let leftCount = barButtons.count - rightCount
                
                let leftButtons = barButtons.dropFirst(leftCount)
                let rightButtons = barButtons.dropLast(rightCount)
                
                nav.navigationBar.topItem?.leftBarButtonItems = Array(leftButtons)
                nav.navigationBar.topItem?.rightBarButtonItems = Array(rightButtons)
                
            }
        }
        
        return nav
    }
    
    static func constrain(new: UIView, to view: UIView, top: CGFloat?, bottom: CGFloat?, left: CGFloat?, right: CGFloat?, height: CGFloat?, width: CGFloat?, centerX: Bool) {

        
        if top != nil { new.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: top!).isActive = true }
        if bottom != nil { new.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottom!).isActive = true }
        if left != nil { new.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left!).isActive = true }
        if right != nil { new.rightAnchor.constraint(equalTo: view.rightAnchor, constant: right!).isActive = true }
        
        if centerX { new.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true }
        
        if height != nil { new.heightAnchor.constraint(equalToConstant: height!).isActive = true }
        if width != nil { new.widthAnchor.constraint(equalToConstant: width!).isActive = true }
    }
    
    static func returnTimeStamp(format: String, date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
        
    }
    
    static func createTextFieldsAndConstrainToView(view: UIView, placeholders: [String]) {
        
        var fields = [UITextField]()
        
        placeholders.forEach() {
            let field = UITextField()
            
            field.placeholder = $0
            field.textAlignment = .center
            field.translatesAutoresizingMaskIntoConstraints = false
            field.layer.cornerRadius = 15
            
            if $0.lowercased().contains("password") {
                field.isSecureTextEntry = true
            }
            
            if $0.lowercased().contains("email") {
                field.keyboardType = .emailAddress
            }
            
            if $0.lowercased().contains("zip") {
                field.keyboardType = .numberPad
            }
            
            view.addSubview(field)
            fields.append(field)
        }
        
        var count = 0
        
        while count < fields.count {
            
            if count != 0 {
                fields[count].topAnchor.constraint(equalTo: fields[count - 1].bottomAnchor, constant: 15).isActive = true
                fields[count].centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                fields[count].widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
                fields[count].heightAnchor.constraint(equalToConstant: 20).isActive = true
            } else {
                fields[count].topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
                fields[count].centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            }
            
            count = count + 1
        }
        
        
        
    }
    
    static func presentGenericAlart(controller: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayButton = UIAlertAction(title: "Got it!", style: .default) { (action: UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okayButton)
        
        controller.present(alert, animated: true, completion: nil)
    }
}

extension UICollectionViewCell {
    func addShadow() {
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.contentView.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    }
}

extension UIButton {
    func addShadow() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
}

extension String {
    func truncate(to length: Int) -> String {
        return String(self.prefix(length))
    }
}

extension UITextField {
    func addUnderline() {
    }
}




//
//  Utility.swift
//  Grit
//
//  Created by Jared Williams on 2/7/18.
//  Copyright © 2018 Jared Williams. All rights reserved.
//



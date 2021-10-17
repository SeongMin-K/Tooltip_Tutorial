//
//  ViewController.swift
//  Tooltip_Tutorial
//
//  Created by SeongMinK on 2021/10/17.
//

import UIKit
import EasyTipView

class ViewController: UIViewController {
    
    @IBOutlet weak var centerBtn: UIButton!
    @IBOutlet weak var topLeadingBtn: UIButton!
    @IBOutlet weak var topTrailingBtn: UIButton!
    @IBOutlet weak var bottomLeadingBtn: UIButton!
    @IBOutlet weak var bottomTrailngBtn: UIButton!
    
    lazy var centerTooltip = EasyTipView(text: "")
    lazy var topLeadingTooltip = EasyTipView(text: "")
    lazy var topTrailingTooltip = EasyTipView(text: "")
    lazy var bottomLeadingTooltip = EasyTipView(text: "")
    lazy var bottomTrailngTooltip = EasyTipView(text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, "called")
        

        
    }
    
    @IBAction func onBtnClicked(sender: UIButton) {
        print(#fileID, #function, "called")
        
        switch sender {
        case self.centerBtn:
            print("CenterBtn Clicked")
            // centerTooltip 설정
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            preferences.drawing.arrowPosition = .top
            
            centerTooltip = EasyTipView(text: "안녕하세요?", preferences: preferences, delegate: self)
            centerTooltip.show(forView:  self.centerBtn, withinSuperview: self.view)
            
        case self.topLeadingBtn:
            print("topLeadingBtn Clicked")
            // topLeadingTooltip 설정
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 16)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            preferences.drawing.arrowPosition = .top
            
            preferences.animating.showDuration = 1
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: 100)
            preferences.animating.dismissDuration = 1
            preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: 100)
            preferences.animating.dismissFinalAlpha = 0

            
            topLeadingTooltip = EasyTipView(text: "왼쪽 위 툴팁!", preferences: preferences, delegate: self)
            topLeadingTooltip.show(forView:  self.topLeadingBtn, withinSuperview: self.view)
            
        case self.topTrailingBtn:
            print("topTrailingBtn Clicked")
            // topTrailingTooltip 설정
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 16)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            preferences.drawing.arrowPosition = .bottom
            
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: -100)
            preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: -100)
            
            // Padding
            preferences.positioning.contentInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
            topTrailingTooltip = EasyTipView(text: "오른쪽 위 툴팁!", preferences: preferences, delegate: self)
            topTrailingTooltip.show(forView:  self.topTrailingBtn, withinSuperview: self.view)
            
        case self.bottomLeadingBtn:
            print("bottomLeadingBtn Clicked")
            // bottomLeadingTooltip 설정
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 16)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            preferences.drawing.arrowPosition = .top
            
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 100, y: 100)
            preferences.animating.dismissTransform = CGAffineTransform(translationX: 100, y: 100)
            
            bottomLeadingTooltip = EasyTipView(text: "왼쪽 아래 툴팁!", preferences: preferences, delegate: self)
            bottomLeadingTooltip.show(forView:  self.bottomLeadingBtn, withinSuperview: self.view)
            
        case self.bottomTrailngBtn:
            print("bottomTrailngBtn Clicked")
            // bottomTrailngTooltip 설정
            var preferences = EasyTipView.Preferences()
            preferences.drawing.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            preferences.drawing.arrowPosition = .top
            preferences.drawing.borderWidth = 10
            preferences.drawing.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: -100, y: 100)
            preferences.animating.dismissTransform = CGAffineTransform(translationX: -100, y: 100)
            
            let contentView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            contentView.image = UIImage(named: "Shark")
            
            bottomTrailngTooltip = EasyTipView(contentView: contentView, preferences: preferences, delegate: self)
            bottomTrailngTooltip.show(forView:  self.bottomTrailngBtn, withinSuperview: self.view)
            
        default:
            print("Default")
        }
    }
}

extension ViewController: EasyTipViewDelegate {
    func easyTipViewDidTap(_ tipView: EasyTipView) {
        print(#fileID, #function, "called")
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        print(#fileID, #function, "called")
        switch tipView {
        case self.centerTooltip:
            print("centerTooltip Dismiss")
        case self.topLeadingTooltip:
            print("topLeadingTooltip Dismiss")
        case self.topTrailingTooltip:
            print("topTrailingTooltip Dismiss")
        case self.bottomLeadingTooltip:
            print("bottomLeadingTooltip Dismiss")
        case self.bottomTrailngTooltip:
            print("bottomTrailngTooltip Dismiss")
        default:
            print("Default")
        }
    }
}


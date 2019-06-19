//
//  ViewController.swift
//  SwiftAnimation
//
//  Created by Krešimir Sabljo on 19/06/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let countingLabel: UILabel =  {
        let label = UILabel()
        label.text = "123456789"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
            
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        

        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: RunLoop.Mode.default)
    }


    var startValue: Double = 0
    let endValue: Double = 100
    let animationDuration: Double = 3.5
    
    let animationStartTime = Date()

    @objc func handleUpdate() {
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartTime)
        
        if elapsedTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
        }
            
        else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.countingLabel.text = "\(value)"
        }
        

        // second
//        self.countingLabel.text = "\(startValue)"
//        startValue += 1
//
//        if startValue > endValue {
//            startValue = endValue
//        }
//
     
        
        // first
//        let time = Date().timeIntervalSince1970
//        print(time)
//        self.countingLabel.text = "\(time)"
        
    }
}


//
//  ViewController.swift
//  UISlider-sample
//
//  Created by Risako Kato on 2022/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiSlider: UISlider!
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSlider.maximumValue = 3
        uiSlider.minimumValue = -3

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        self.uiSlider.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = round(sender.value)
        label.text = String(sliderValue)
        uiSlider.setValue(sliderValue, animated: false)
    }

    @objc func sliderTapped(gestureRecognizer: UIGestureRecognizer) {

        let pointTapped: CGPoint = gestureRecognizer.location(in: uiSlider)

        let widthOfSlider: CGFloat = uiSlider.frame.size.width
        let newValue = pointTapped.x * CGFloat(uiSlider.maximumValue - uiSlider.minimumValue) / widthOfSlider - CGFloat(uiSlider.maximumValue)
        uiSlider.setValue(round(Float(newValue)), animated: false)
        sliderValueChanged(uiSlider)

    }

}


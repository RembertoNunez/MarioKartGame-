//
//  ViewController.swift
//  Mario Kart
//
//  Created by Remberto on 2/20/19.
//  Copyright © 2019 Remberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kartViewMario: UIImageView!
    @IBOutlet weak var kartViewBawser: UIImageView!
      @IBOutlet weak var kartViewToad: UIImageView!
    
    var startingPointKartViewMario = CGPoint()
    var startingPointKartViewToad = CGPoint()
    var startingPointKartViewBawser = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startingPointKartViewMario = kartViewMario.center
        startingPointKartViewToad = kartViewToad.center
        startingPointKartViewBawser = kartViewBawser.center
        
    }
    
    
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        
        print("Location: x: \(location.x), y: \(location.y)")
        
        let kartView = sender.view!
        kartView.center = location
    }
    
    @IBAction func didPinchKart(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale

        print("scale: \(scale)")
        
        let kartView = sender.view!
        
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    @IBAction func didRotationKart(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        
        print("rotation: \(rotation)")
        
        let kartView = sender.view!
        
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    
    @IBAction func didTapKart(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        
        let kartView = sender.view!
        
        kartView.center.x += 50
        
        UIView.animate(withDuration: 0.6) {
            // Closure body
            kartView.center.x += 400
        }
    }
    
    
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        
        UIView.animate(withDuration: 0.8) {
            self.kartViewMario.center = self.startingPointKartViewMario
            self.kartViewToad.center = self.startingPointKartViewToad
            self.kartViewBawser.center = self.startingPointKartViewBawser
            
            self.kartViewMario.transform = CGAffineTransform.identity
            self.kartViewToad.transform = CGAffineTransform.identity
            self.kartViewBawser.transform = CGAffineTransform.identity
        }
    }
    
}


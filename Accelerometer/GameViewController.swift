//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 川岸樹奈 on 2019/02/14.
//  Copyright © 2019年 juna.Kawagishi. All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    @IBOutlet var awaImageVIew: UIImageView!
    
    let motionManager = CMMotionManager()
    var accelerationX: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current! , withHandler: { (data, error) in
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageVIew.center.x = self.awaImageVIew.center.x - CGFloat(self.accelerationX*20)
                
                if self.awaImageVIew.frame.origin.x <= 0{
                    self.awaImageVIew.frame.origin.x = 0
                }
                if self.awaImageVIew.frame.origin.x > 250 {
                    self.awaImageVIew.frame.origin.x = 250
                }
            })
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

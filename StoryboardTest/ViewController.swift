//
//  ViewController.swift
//  StoryboardTest
//
//  Created by  macpro on 2019/12/5.
//  Copyright © 2019 kanandian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timelabel: UILabel!
    
    var seconds = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupApp()

    }
    
    @IBAction func buttonPressed()  {
        label.text = "我很帅"
    }
    
    func setupApp() -> Void {
        seconds = 10
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)

    }
    
    func subtractTime() -> Void {
        seconds -= 1
        timelabel.text = "/(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!",
             message: "alert",
             preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: {
              action in self.setupApp()
            }))
            present(alert, animated: true, completion:nil)


        }
    }



}


//
//  ViewController.swift
//  labelgame
//
//  Created by 小野山大吉 on 2015/11/25.
//  Copyright © 2015年 小野山大吉. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var xArray: [CGFloat] = [100.0, 200.0, 300.0, 400.0] // x座標の配列
    var yDown0: CGFloat = -140 // y座標
    var yDown1: CGFloat = -140
    var yDown2: CGFloat = -140
    var yDown3: CGFloat = -140
    var yUp0: CGFloat = 560
    var yUp1: CGFloat = 560
    var yUp2: CGFloat = 560
    var yUp3: CGFloat = 560
    
    var dy0: CGFloat = 2
    var dy1: CGFloat = 2
    var dy2: CGFloat = 2
    var dy3: CGFloat = 2
    
    var timer1: NSTimer!
    var timer2: NSTimer!
    
    
    var downImageView0: UIImageView!
    var downImageView1: UIImageView!
    var downImageView2: UIImageView!
    var downImageView3: UIImageView!
    
    var upImageView0: UIImageView!
    var upImageView1: UIImageView!
    var upImageView2: UIImageView!
    var upImageView3: UIImageView!
    
    
    
    @IBOutlet var label : UILabel!
    @IBOutlet var button : UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //２秒おきにImageVuewを作る
        timer1 = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "onUpdate1:", userInfo: nil, repeats: true)
        timer1.fire()
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate2:", userInfo: nil, repeats: true)
        timer2.fire()
        
        button.addTarget(self, action: "reset:", forControlEvents: .TouchUpInside)
        button.hidden = true
        
    }
    
    //0~3の中から一つ選んでImageView作る
    func onUpdate1(timer1 : NSTimer) {
        let randInt = Int(rand()%4)
        NSLog("\(randInt)")
        switch randInt {
        case 0:
            makeDownImageView0()
        case 1:
            makeDownImageView1()
        case 2:
            makeDownImageView2()
        case 3:
            makeDownImageView3()
        default:
            break
        }
    }
    
    //ImageViewを動かす
    func onUpdate2(timer2 : NSTimer) {
        
        if downImageView0 != nil{
            if yDown0 < -200 {
                downImageView0.removeFromSuperview()
                downImageView0 = nil
            }else {
                yDown0 = yDown0 + dy0
                downImageView0.center = CGPointMake(60, yDown0)
            }
            if yDown0 >= 620{
               timer1.invalidate()
                timer2.invalidate()
                label.text = String("GAME OVER")
                button.hidden = false
                
            }
        }
        if downImageView1 != nil{
            if yDown1 < -200 {
                downImageView1.removeFromSuperview()
                downImageView1 = nil
            }else{
                yDown1 = yDown1 + dy1
                downImageView1.center = CGPointMake(150, yDown1)
                
            }
            if yDown1 >= 620{
                timer1.invalidate()
                timer2.invalidate()
                label.text = String("GAME OVER")
                button.hidden = false
            }
        }
        if downImageView2 != nil{
            if yDown2 < -200 {
                downImageView2.removeFromSuperview()
                downImageView2 = nil

            }else{
                yDown2 = yDown2 + dy2
                downImageView2.center = CGPointMake(240, yDown2)

            }
            if yDown2 >= 620{
                timer1.invalidate()
                timer2.invalidate()
                label.text = String("GAME OVER")
                button.hidden = false
            }
        }
        if downImageView3 != nil{
            if yDown3 < -200{
                downImageView3.removeFromSuperview()
                downImageView3 = nil
            }else{
                yDown3 = yDown3 + dy3
                downImageView3.center = CGPointMake(330, yDown3)
                
            }
            if yDown3 >= 620{
                timer1.invalidate()
                timer2.invalidate()
                label.text = String("GAME OVER")
                button.hidden = false
            }
        }
        
        //////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////
        
        if upImageView0 != nil{
            if yUp0 < 0 {
                // 一番上まで行ったら消す
                upImageView0.removeFromSuperview()
                upImageView0 = nil
                dy0 = 1
            }else if CGRectIntersectsRect(upImageView0.frame, downImageView0.frame) == true {
                dy0 = -1
            }else{
                yUp0 = yUp0 - 1
                upImageView0.center = CGPointMake(60, yUp0)
            }
        }
        
        if upImageView1 != nil{
            if yUp1 < 0 {
                upImageView1.removeFromSuperview()
                upImageView1 = nil
                dy1 = 1
            }else if CGRectIntersectsRect(upImageView1.frame, downImageView1.frame) == true{
                dy1 = -1
            }
            else{
                yUp1 = yUp1 - 1
                upImageView1.center = CGPointMake(150, yUp1)
            }
        }
        if upImageView2 != nil{
            if yUp2 < 0 {
                upImageView2.removeFromSuperview()
                upImageView2 = nil
                dy2 = 1
            }else if CGRectIntersectsRect(upImageView2.frame, downImageView2.frame) == true{
                dy2 = -1
            }
            else{
                yUp2 = yUp2 - 1
                upImageView2.center = CGPointMake(240, yUp2)
            }
        }
        if upImageView3 != nil{
            if yUp3 < 0{
                upImageView3.removeFromSuperview()
                upImageView3 = nil
                dy3 = 1
                }
            else if CGRectIntersectsRect(upImageView3.frame, downImageView3.frame) == true{
                dy3 = -1
            }
            else{
                yUp3 = yUp3 - 1
                upImageView3.center = CGPointMake(330, yUp3)
                
            }
        }
    }
    
    
    //ImageViewを作る機能
    //下に行く奴
    func makeDownImageView0() {
        if downImageView0 == nil {
            yDown0 = -140
            downImageView0 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            downImageView0.center = CGPointMake(60, yDown0)
            downImageView0.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
            self.view.addSubview(downImageView0)
        }
        
            
        
    }
    
    
    func makeDownImageView1() {
        if downImageView1 == nil {
            yDown1 = -140
            downImageView1 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            downImageView1.center = CGPointMake(150, yDown1)
            downImageView1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
            self.view.addSubview(downImageView1)
        }
    }
    
    
    func makeDownImageView2() {
        if downImageView2 == nil {
            yDown2 = -140
            downImageView2 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            downImageView2.center = CGPointMake(240, yDown2)
            downImageView2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
            self.view.addSubview(downImageView2)
        }
    }
    
    
    func makeDownImageView3() {
        if downImageView3 == nil {
            yDown3 = -140
            downImageView3 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            downImageView3.center = CGPointMake(330, yDown3)
            downImageView3.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
            self.view.addSubview(downImageView3)
        }
    }
    
    //上に行く奴
    @IBAction func createUpImage0() {
        if upImageView0 == nil {
            yUp0 = 560
            upImageView0 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            upImageView0.center = CGPointMake(60,yUp0)
            upImageView0.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
            self.view.addSubview(upImageView0)
        }
    }
    
    
    @IBAction func createUpImage1() {
        if upImageView1 == nil {
            yUp1 = 560
            upImageView1 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            upImageView1.center = CGPointMake(150,yUp1)
            upImageView1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
            self.view.addSubview(upImageView1)
        }
    }
    
    @IBAction func createUpImage2() {
        if upImageView2 == nil {
            yUp2 = 560
            upImageView2 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            upImageView2.center = CGPointMake(240,yUp2)
            upImageView2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
            self.view.addSubview(upImageView2)
        }
    }
    
    @IBAction func createUpImage3() {
        if upImageView3 == nil {
            yUp3 = 560
            upImageView3 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
            upImageView3.center = CGPointMake(330,yUp3)
            upImageView3.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
            self.view.addSubview(upImageView3)
        }
    }
    
    func reset(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}


//
//  ViewController.swift
//  Cricket-Scorecard
//
//  Created by Saif Jilani on 5/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit
import KGNAutoLayout

class ViewController: UIViewController {
    
    //labels
    var teamOneLabel = UILabel()
    var teamOneScore = UILabel()
    var teamTwoLabel = UILabel()
    var teamTwoScore = UILabel()
    var oversLabel = UILabel()
    var overs = UILabel()
    var runsLabel = UILabel()
    var boundaryLabel = UILabel()
    var extrasLabel = UILabel()
    var noballLabel = UILabel()
    var wideLabel = UILabel()
    var byeLabel = UILabel()
    
    //buttons
    var dotBall = UIButton(type: .System)
    var oneRuns = UIButton(type: .System)
    var twoRuns = UIButton(type: .System)
    var threeRuns = UIButton(type: .System)
    var fourRuns = UIButton(type: .System)
    var sixRuns = UIButton(type: .System)
    var editLastBall = UIButton(type: .System)
    var out = UIButton(type: .System)
    var endMatch = UIButton(type: .System)
    
    //switches
    var noBall = UISwitch()
    var wide = UISwitch()
    var bye = UISwitch()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamOneLabel.textAlignment = NSTextAlignment.Center
        teamOneLabel.text = "Team 1:"
        self.view.addSubview(teamOneLabel)
        teamOneLabel.pinToTopEdgeOfSuperview(offset: 20)
        teamOneLabel.pinToLeftEdgeOfSuperview(offset: 80)
        
        teamOneScore.textAlignment = NSTextAlignment.Center
        teamOneScore.text = "0"
        self.view.addSubview(teamOneScore)
        teamOneScore.centerVerticallyToItem(teamOneLabel)
        teamOneScore.pinLeftEdgeToLeftEdgeOfItem(teamOneLabel, offset: 80)
        
        teamTwoLabel.textAlignment = .Center
        teamTwoLabel.text = "Team 2:"
        self.view.addSubview(teamTwoLabel)
        teamTwoLabel.pinTopEdgeToTopEdgeOfItem(teamOneLabel, offset: 50)
        teamTwoLabel.pinToLeftEdgeOfSuperview(offset: 80)
        
        teamTwoScore.textAlignment = NSTextAlignment.Center
        teamTwoScore.text = "147"
        self.view.addSubview(teamTwoScore)
        teamTwoScore.centerVerticallyToItem(teamTwoLabel)
        teamTwoScore.pinLeftEdgeToLeftEdgeOfItem(teamTwoLabel, offset: 80)
        
        oversLabel.textAlignment = .Center
        oversLabel.text = "Overs:"
        self.view.addSubview(oversLabel)
        oversLabel.pinTopEdgeToTopEdgeOfItem(teamTwoLabel, offset: 50)
        oversLabel.pinToLeftEdgeOfSuperview(offset: 80)
        
        overs.textAlignment = NSTextAlignment.Center
        overs.text = "0.0"
        self.view.addSubview(overs)
        overs.centerVerticallyToItem(oversLabel)
        overs.pinLeftEdgeToLeftEdgeOfItem(oversLabel, offset: 80)

        runsLabel.textAlignment = .Center
        runsLabel.text = "Runs:"
        self.view.addSubview(runsLabel)
        runsLabel.pinTopEdgeToTopEdgeOfItem(oversLabel, offset: 50)
        runsLabel.pinToLeftEdgeOfSuperview(offset: 80)

        dotBall.setTitle("0", forState: .Normal)
        dotBall.layer.borderWidth = 1.0
        dotBall.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(dotBall)
        dotBall.pinLeftEdgeToLeftEdgeOfItem(runsLabel, offset: 50)
        dotBall.centerVerticallyToItem(runsLabel)
        dotBall.addTarget(self, action: "playNextBall:", forControlEvents: .TouchUpInside)

        oneRuns.setTitle("1", forState: .Normal)
        oneRuns.layer.borderWidth = 1.0
        oneRuns.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(oneRuns)
        oneRuns.pinLeftEdgeToLeftEdgeOfItem(dotBall, offset: 50)
        oneRuns.centerVerticallyToItem(runsLabel)
        oneRuns.addTarget(self, action: "playNextBall:", forControlEvents: .TouchUpInside)

        twoRuns.setTitle("2", forState: .Normal)
        twoRuns.layer.borderWidth = 1.0
        twoRuns.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(twoRuns)
        twoRuns.pinLeftEdgeToLeftEdgeOfItem(oneRuns, offset: 60)
        twoRuns.centerVerticallyToItem(runsLabel)
        
        threeRuns.setTitle("3", forState: .Normal)
        threeRuns.layer.borderWidth = 1.0
        threeRuns.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(threeRuns)
        threeRuns.pinLeftEdgeToLeftEdgeOfItem(twoRuns, offset: 60)
        threeRuns.centerVerticallyToItem(runsLabel)
        
        boundaryLabel.textAlignment = .Center
        boundaryLabel.text = "Boundary:"
        self.view.addSubview(boundaryLabel)
        boundaryLabel.pinTopEdgeToTopEdgeOfItem(runsLabel, offset: 50)
        boundaryLabel.pinToLeftEdgeOfSuperview(offset: 80)
        
        fourRuns.setTitle("4", forState: .Normal)
        fourRuns.layer.borderWidth = 1.0
        fourRuns.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(fourRuns)
        fourRuns.pinLeftEdgeToLeftEdgeOfItem(boundaryLabel, offset: 100)
        fourRuns.centerVerticallyToItem(boundaryLabel)
        
        sixRuns.setTitle("6", forState: .Normal)
        sixRuns.layer.borderWidth = 1.0
        sixRuns.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(sixRuns)
        sixRuns.pinLeftEdgeToLeftEdgeOfItem(fourRuns, offset: 60)
        sixRuns.centerVerticallyToItem(boundaryLabel)
        
        extrasLabel.textAlignment = .Center
        extrasLabel.text = "Extras:"
        self.view.addSubview(extrasLabel)
        extrasLabel.pinTopEdgeToTopEdgeOfItem(boundaryLabel, offset: 50)
        extrasLabel.pinToLeftEdgeOfSuperview(offset: 80)
        
        noballLabel.textAlignment = .Center
        noballLabel.text = "No Ball"
        self.view.addSubview(noballLabel)
        noballLabel.pinLeftEdgeToLeftEdgeOfItem(extrasLabel, offset: 60)
        noballLabel.centerVerticallyToItem(extrasLabel)
        
        wideLabel.textAlignment = .Center
        wideLabel.text = "Wide"
        self.view.addSubview(wideLabel)
        wideLabel.pinLeftEdgeToLeftEdgeOfItem(noballLabel, offset: 70)
        wideLabel.centerVerticallyToItem(extrasLabel)
        
        byeLabel.textAlignment = .Center
        byeLabel.text = "Bye"
        self.view.addSubview(byeLabel)
        byeLabel.pinLeftEdgeToLeftEdgeOfItem(wideLabel, offset: 60)
        byeLabel.centerVerticallyToItem(extrasLabel)
        
        self.view.addSubview(noBall)
        noBall.centerHorizontallyToItem(noballLabel)
        noBall.pinTopEdgeToTopEdgeOfItem(noballLabel, offset: 20)
        
        self.view.addSubview(wide)
        wide.centerHorizontallyToItem(wideLabel)
        wide.pinTopEdgeToTopEdgeOfItem(wideLabel, offset: 20)
        
        self.view.addSubview(bye)
        bye.centerHorizontallyToItem(byeLabel)
        bye.pinTopEdgeToTopEdgeOfItem(byeLabel, offset: 20)
        
        editLastBall.setTitle("Edit Last Ball", forState: .Normal)
        editLastBall.layer.borderWidth = 1.0
        editLastBall.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(editLastBall)
        editLastBall.pinTopEdgeToTopEdgeOfItem(extrasLabel, offset: 60)
        editLastBall.pinToLeftEdgeOfSuperview(offset: 80)
        
        out.setTitle("Out", forState: .Normal)
        out.layer.borderWidth = 1.0
        out.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(out)
        out.pinLeftEdgeToLeftEdgeOfItem(editLastBall, offset: 100)
        out.centerVerticallyToItem(editLastBall)
        
        endMatch.setTitle("End Match", forState: .Normal)
        endMatch.layer.borderWidth = 1.0
        endMatch.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(endMatch)
        endMatch.pinToLeftEdgeOfSuperview(offset: 80)
        endMatch.pinTopEdgeToTopEdgeOfItem(editLastBall, offset: 40)
    }
    
    func playNextBall(sender: UIButton!)
    {
        print("play next ball")
        let runsScoredOnBall = (sender.titleLabel!.text! as NSString).intValue
        addRuns(runsScoredOnBall)
        incrementBall()
    }
    
    func incrementBall()
    {
        var nextBall = (overs.text! as NSString).doubleValue
        nextBall += 0.1
        if ((nextBall * 10) % 10 == 6)
        {
            nextBall += 0.4
        }
        overs.text = String(nextBall)
    }
    
    func addRuns(runsScoredOnBall: Int32)
    {
        var totalScore = (teamOneScore.text! as NSString).intValue
        totalScore += runsScoredOnBall
        teamOneScore.text = String(totalScore)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


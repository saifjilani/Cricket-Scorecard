//
//  ViewController.swift
//  Cricket-Scorecard
//
//  Created by Saif Jilani on 5/16/16.
//  Copyright © 2016 saifjilani. All rights reserved.
//

import UIKit
import KGNAutoLayout

class MatchViewController: UIViewController {
    
    //labels
    let teamOneLabel = UILabel()
    let teamOneScore = UILabel()
    let teamTwoLabel = UILabel()
    let teamTwoScore = UILabel()
    let oversLabel = UILabel()
    let overs = UILabel()
    let runsLabel = UILabel()
    let boundaryLabel = UILabel()
    let extrasLabel = UILabel()
    let noballLabel = UILabel()
    let wideLabel = UILabel()
    let slashOneLabel = UILabel()
    let slashTwoLabel = UILabel()
    let teamOneWickets = UILabel()
    let teamTwoWickets = UILabel()
    var isFirstInnings = true
    
    //buttons
    let dotBall = UIButton(type: .System)
    let oneRuns = UIButton(type: .System)
    let twoRuns = UIButton(type: .System)
    let threeRuns = UIButton(type: .System)
    let fourRuns = UIButton(type: .System)
    let sixRuns = UIButton(type: .System)
    let out = UIButton(type: .System)
    let endInnings = UIButton(type: .System)
    let endMatch = UIButton(type: .System)
    
    //switches
    let noBall = UISwitch()
    let wide = UISwitch()
    let bye = UISwitch()

    //alerts
    let endInningAlert = UIAlertController(title: "End Innings", message: "Are you sure you want to end the innings?", preferredStyle: .Alert)
     let endMatchAlert = UIAlertController(title: "End Match", message: "Are you sure you want to end the match?", preferredStyle: .Alert)


    override func viewDidLoad() {
        super.viewDidLoad()

        endMatch.enabled = false
        setupEndInningsAlert()
        setupEndMatchAlert()

        out.addTarget(self, action: "wicket:", forControlEvents: .TouchUpInside)
        endInnings.addTarget(self, action: "changeInnings:", forControlEvents: .TouchUpInside)
        endMatch.addTarget(self, action: "endMatch:", forControlEvents: .TouchUpInside)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        addLabel(teamOneLabel, text: "Team 1:")
        teamOneLabel.pinToTopEdgeOfSuperview(offset: 20)
        teamOneLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addLabel(teamOneScore, text: "0")
        teamOneScore.centerVerticallyToItem(teamOneLabel)
        teamOneScore.pinLeftEdgeToLeftEdgeOfItem(teamOneLabel, offset: 80)

        addLabel(slashOneLabel, text: "/")
        slashOneLabel.centerVerticallyToItem(teamOneScore)
        slashOneLabel.pinLeftEdgeToLeftEdgeOfItem(teamOneScore, offset: 35)

        addLabel(teamOneWickets, text: "0")
        teamOneWickets.centerVerticallyToItem(slashOneLabel)
        teamOneWickets.pinLeftEdgeToLeftEdgeOfItem(slashOneLabel, offset: 20)

        addLabel(teamTwoLabel, text: "Team 2:")
        teamTwoLabel.pinTopEdgeToTopEdgeOfItem(teamOneLabel, offset: 50)
        teamTwoLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addLabel(teamTwoScore, text: "0")
        teamTwoScore.centerVerticallyToItem(teamTwoLabel)
        teamTwoScore.pinLeftEdgeToLeftEdgeOfItem(teamTwoLabel, offset: 80)

        addLabel(slashTwoLabel, text: "/")
        slashTwoLabel.centerVerticallyToItem(teamTwoScore)
        slashTwoLabel.pinLeftEdgeToLeftEdgeOfItem(teamTwoScore, offset: 35)

        addLabel(teamTwoWickets, text: "0")
        teamTwoWickets.centerVerticallyToItem(slashTwoLabel)
        teamTwoWickets.pinLeftEdgeToLeftEdgeOfItem(slashTwoLabel, offset: 20)

        addLabel(oversLabel, text: "Overs:")
        oversLabel.pinTopEdgeToTopEdgeOfItem(teamTwoLabel, offset: 50)
        oversLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addLabel(overs, text: "0.0")
        overs.centerVerticallyToItem(oversLabel)
        overs.pinLeftEdgeToLeftEdgeOfItem(oversLabel, offset: 80)

        addLabel(runsLabel, text: "Runs:")
        runsLabel.pinTopEdgeToTopEdgeOfItem(oversLabel, offset: 50)
        runsLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addRunsButton(dotBall, title: "0")
        dotBall.pinLeftEdgeToLeftEdgeOfItem(runsLabel, offset: 50)
        dotBall.centerVerticallyToItem(runsLabel)

        addRunsButton(oneRuns, title: "1")
        oneRuns.pinLeftEdgeToLeftEdgeOfItem(dotBall, offset: 50)
        oneRuns.centerVerticallyToItem(runsLabel)

        addRunsButton(twoRuns, title: "2")
        twoRuns.pinLeftEdgeToLeftEdgeOfItem(oneRuns, offset: 60)
        twoRuns.centerVerticallyToItem(runsLabel)

        addLabel(boundaryLabel, text: "Boundary:")
        boundaryLabel.pinTopEdgeToTopEdgeOfItem(runsLabel, offset: 50)
        boundaryLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addRunsButton(fourRuns, title: "4")
        fourRuns.pinLeftEdgeToLeftEdgeOfItem(boundaryLabel, offset: 100)
        fourRuns.centerVerticallyToItem(boundaryLabel)

        addRunsButton(sixRuns, title: "6")
        sixRuns.pinLeftEdgeToLeftEdgeOfItem(fourRuns, offset: 60)
        sixRuns.centerVerticallyToItem(boundaryLabel)

        addLabel(extrasLabel, text: "Extras:")
        extrasLabel.pinTopEdgeToTopEdgeOfItem(boundaryLabel, offset: 50)
        extrasLabel.pinToLeftEdgeOfSuperview(offset: 80)

        addLabel(noballLabel, text: "No Ball")
        noballLabel.pinLeftEdgeToLeftEdgeOfItem(extrasLabel, offset: 60)
        noballLabel.centerVerticallyToItem(extrasLabel)

        addLabel(wideLabel, text: "Wide")
        wideLabel.pinLeftEdgeToLeftEdgeOfItem(noballLabel, offset: 70)
        wideLabel.centerVerticallyToItem(extrasLabel)

        view.addSubview(noBall)
        noBall.centerHorizontallyToItem(noballLabel)
        noBall.pinTopEdgeToTopEdgeOfItem(noballLabel, offset: 20)

        view.addSubview(wide)
        wide.centerHorizontallyToItem(wideLabel)
        wide.pinTopEdgeToTopEdgeOfItem(wideLabel, offset: 20)

        addButton(out, title: "Out")
        out.pinTopEdgeToTopEdgeOfItem(extrasLabel, offset: 60)
        out.pinToLeftEdgeOfSuperview(offset: 80)

        addButton(endInnings, title: "End Innings")
        endInnings.pinToLeftEdgeOfSuperview(offset: 80)
        endInnings.pinTopEdgeToTopEdgeOfItem(out, offset: 40)

        addButton(endMatch, title: "End Match")
        endMatch.pinLeftEdgeToLeftEdgeOfItem(endInnings, offset: 100)
        endMatch.centerVerticallyToItem(endInnings)

    }

    func addLabel(label: UILabel!, text:String){
        label.textAlignment = .Center
        label.text = text
        view.addSubview(label)
    }

    func addButton(button: UIButton!, title: String){
        button.setTitle(title, forState: .Normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blueColor().CGColor
        view.addSubview(button)
    }

    func setupEndInningsAlert(){
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        endInningAlert.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.isFirstInnings = false
            self.endInnings.enabled = false
            self.endMatch.enabled = true
        }
        endInningAlert.addAction(OKAction)
    }

    func setupEndMatchAlert(){
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        endMatchAlert.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in

        }
        endMatchAlert.addAction(OKAction)
    }

    func changeInnings(sender: UIButton!){
        print("end innings")
        presentViewController(endInningAlert, animated: true, completion: nil)
    }


    func endMatch(sender: UIButton!){
        print("end match")
        presentViewController(endMatchAlert, animated: true, completion: nil)
    }


    func addRunsButton(button: UIButton!, title: String){
        addButton(button, title: title)
        button.addTarget(self, action: "runOnBall:", forControlEvents: .TouchUpInside)
    }

    func runOnBall(sender: UIButton!){
        print("play next ball")
        let runsScoredOnBall = (sender.titleLabel!.text! as NSString).intValue
        addRuns(runsScoredOnBall)
        incrementBall()
    }

    func wicket(sender: UIButton!){
        print ("out")
        let teamWickets = isFirstInnings ? teamOneWickets : teamTwoWickets
        var totalWickets = (teamWickets.text! as NSString).intValue
        totalWickets += 1
        teamWickets.text = String(totalWickets)
        incrementBall()
    }

    func incrementBall(){
        if noBall.on || wide.on{

            addRuns(1)
            return
        }
        let currentBall = (overs.text! as NSString).doubleValue
        var nextBall = currentBall + 0.1
        if (nextBall * 10) % 10 == 6{
            
            nextBall += 0.4
        }
        overs.text = String(nextBall)
    }
    
    func addRuns(runsScoredOnBall: Int32){
        let teamScore = isFirstInnings ? teamOneScore : teamTwoScore
        var totalScore = (teamScore.text! as NSString).intValue
        totalScore += runsScoredOnBall
        teamScore.text = String(totalScore)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


//
//  ViewController.swift
//  NewTimerPlay
//
//  Created by Apple on 13/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
//    var countdownTimers: [(id: Int, createdAt: TimeInterval, duration: TimeInterval)] = {
//            return [(0, Date().timeIntervalSince1970, 5),(1, Date().timeIntervalSince1970, 10),(2, Date().timeIntervalSince1970, 15),(3, Date().timeIntervalSince1970, 86)]
//    }()

    var countdownTimers: [(id: Int, createdAt: TimeInterval, duration: TimeInterval)] = {
        return [(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 10),(0, Date().timeIntervalSince1970, 15),(0, Date().timeIntervalSince1970, 35),(0, Date().timeIntervalSince1970, 25),(0, Date().timeIntervalSince1970, 65),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 45),(0, Date().timeIntervalSince1970, 95),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 55),(0, Date().timeIntervalSince1970, 85),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 65),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 75),(0, Date().timeIntervalSince1970, 85),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 85),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 95),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 105),(0, Date().timeIntervalSince1970, 985),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 5),(0, Date().timeIntervalSince1970, 785),(0, Date().timeIntervalSince1970, 125),(0, Date().timeIntervalSince1970, 325)]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countdownTimers.count
    }
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let dict = countdownTimers[indexPath.row]
        //cell.configureCell(withCountdownTimer: (index: indexPath.row, duration: dict.duration))
        cell.configureCell(withCountdownTimer: (index: indexPath.row, createdAt: dict.createdAt, duration: dict.duration))
        return cell
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}


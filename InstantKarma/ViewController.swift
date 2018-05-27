//
//  ViewController.swift
//  InstantKarma
//
//  Created by godori on 2018. 4. 29..
//  Copyright © 2018년 godori. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentDateTime()
        tasks.append(Task(name: "developing swift app meetup"))
    }
    
    
    // number of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath ) as! TaskCell
        cell.taskNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].chcecked{
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControlState.normal)
        } else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControlState.normal )
        }
        return cell
    }
    
    
    private(set) var addCount = 0 {
        didSet {
            updateAddCountLabel()
        }
    }
   
    @IBOutlet weak var testLabel: UILabel! {
        didSet {
            updateAddCountLabel()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var testCollection: UICollectionView!
    
    @IBAction func myButton(_ sender: Any) {
        addCount += 1
        updateAddCountLabel()
    }

    
    private func updateAddCountLabel() {
        testLabel.text = "\(addCount)"
    }
    

    
    func getCurrentDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd (EE)"
        let str = formatter.string(from: Date())
        label.text = str
    }

}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell{
            let cell = testCollection.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
            
            return cell
        }
    
}

class Task {
    var name = ""
    var chcecked = false
    
    convenience init (name:String){
        self.init()
        self.name = name
    }
}


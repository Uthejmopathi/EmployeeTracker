//
//  SecondViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var personsImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var details: Details?
    
    var leftLabelsData: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personsImage.image = UIImage(named: "ronaldo")
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        leftLabelsData!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as? SecondTableViewCell
        if indexPath.section == 0{
            cell?.rightLabel.text = details?.name
            cell?.leftLabel.text = leftLabelsData![0]
        return cell!
        }
        else if indexPath.section == 1{
            cell?.rightLabel.text = details?.emailID
            cell?.leftLabel.text = leftLabelsData![1]
            return cell!
            }
        else if indexPath.section == 2 {
            cell?.rightLabel.text = String(details!.phoneNumber)
            cell?.leftLabel.text = leftLabelsData![2]
            return cell!
            }
        else if indexPath.section == 3 {
            cell?.rightLabel.text = details?.dob
            cell?.leftLabel.text = leftLabelsData![3]
            return cell!
            }
        else{
            cell?.rightLabel.text = details?.role
            cell?.leftLabel.text = leftLabelsData![4]
            return cell!
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return leftLabelsData![0]
        case 1:
            return leftLabelsData![1]
        case 2:
            return leftLabelsData![2]
        case 3:
            return leftLabelsData![3]
        default:
            return leftLabelsData![4]
        }
    }
    
    
}

class SecondTableViewCell: UITableViewCell{
    static let identifier = "SecondPageCells"
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
}

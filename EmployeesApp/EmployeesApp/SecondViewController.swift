//
//  SecondViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

// MARK: SecondViewController Class
class SecondViewController: UIViewController {
    
// MARK: IBOutelts
    @IBOutlet weak var personsImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
// MARK: Variable Declarations and Initializations
    var details: Details?
    var leftLabelsData: [String]?
    
// MARK: ViewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        personsImage.image = UIImage(named: "ronaldo")
    }
// MARK: Action to be performed when Logout Button Tapped
    @IBAction func logoutButtonTapped(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: Extensions for tableView in SecondViewController
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
            cell?.rightLabel.text = String(details!.econtact)
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

// MARK: Class for cells in tableView of SecondViewController
class SecondTableViewCell: UITableViewCell{
    
// MARK: Identifier for Cell
    static let identifier = "SecondPageCells"
    
// MARK: IBOutlets for components in Cell
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
}

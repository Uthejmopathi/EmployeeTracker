//
//  ViewController.swift
//  EmployeesApp
//
//  Created by Uthej Mopathi on 10/20/20.
//

import UIKit

struct Details {
    var name: String
    var dob: String
    var contactImage: String
    var emailID: String
    var phoneNumber: Int
    var role: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recievedUserName: String?
    
    var userData: [String] = ["Name", "Email"]
    var managerData: [String] = ["Name", "Email", "Phone", "Date Of Birth"]
    var ceoData: [String] = ["Name", "Email", "Phone", "Date Of Birth", "Emergency Contacts"]
    
    var indexValue = 0
    var contactDetails: [Details?] = [Details(name: "Ashley",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "ashley@gmail.com",
                                              phoneNumber: 1234567891,
                                              role: "iOS Developer"),
                                      Details(name: "Brian",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "brian@gmail.com",
                                              phoneNumber: 1234567892,
                                              role: "Data Analyst"),
                                      Details(name: "Charlie",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "charlie@gmail.com",
                                              phoneNumber: 1234567893,
                                              role: "Java Developer"),
                                      Details(name: "TJ",
                                              dob: "07-11-1996",
                                              contactImage: "ronaldo",
                                              emailID: "tj@gmail.com",
                                              phoneNumber: 1234567894,
                                              role: "QA Engineer"),
                                      Details(name: "Kerry",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "kerry@gmail.com",
                                              phoneNumber: 1234567895,
                                              role: "Technical Lead")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.nameLabel.text = contactDetails[indexPath.row]?.name
        cell?.descriptionLabel.text = contactDetails[indexPath.row]?.role
        cell?.personImage.image = UIImage(named: contactDetails[indexPath.row]!.contactImage)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexValue = indexPath.row
        performSegue(withIdentifier: "detailsPageSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SecondViewController
        
        if recievedUserName == "abc" {
            destinationVC?.details = contactDetails[indexValue]
            destinationVC?.leftLabelsData = userData
        }
        else if recievedUserName == "pqr" {
            destinationVC?.details = contactDetails[indexValue]
            destinationVC?.leftLabelsData = managerData
        }
        else {
            destinationVC?.details = contactDetails[indexValue]
            destinationVC?.leftLabelsData = ceoData
        }
    }
}


class TableViewCell: UITableViewCell{
    static let identifier = "FirstPageTableCells"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
}


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
    var econtact: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recievedUserName: String?
    
    var userData: [String] = ["Name", "Email"]
    var managerData: [String] = ["Name", "Email", "Phone", "Date Of Birth"]
    var ceoData: [String] = ["Name", "Email", "Phone", "Date Of Birth", "Emergency Contact"]
    
    var indexValue = 0
    var contactDetails: [Details?] = [Details(name: "Ashley",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "ashley@gmail.com",
                                              phoneNumber: 1234567891,
                                              role: "iOS Developer", econtact: 987654321),
                                      Details(name: "Brian",
                                              dob: "08-27-1995",
                                              contactImage: "messi",
                                              emailID: "brian@gmail.com",
                                              phoneNumber: 1234567892,
                                              role: "Data Analyst", econtact: 987654322),
                                      Details(name: "Charlie",
                                              dob: "08-27-1995",
                                              contactImage: "messi",
                                              emailID: "charlie@gmail.com",
                                              phoneNumber: 1234567893,
                                              role: "Java Developer", econtact: 9876543231),
                                      Details(name: "TJ",
                                              dob: "07-11-1996",
                                              contactImage: "messi",
                                              emailID: "tj@gmail.com",
                                              phoneNumber: 1234567894,
                                              role: "QA Engineer", econtact: 9835279182),
                                      Details(name: "Suhaas",
                                              dob: "08-27-1995",
                                              contactImage: "messi",
                                              emailID: "kerry@gmail.com",
                                              phoneNumber: 1234567895,
                                              role: "iOS Lead", econtact: 6752489051),
                                      Details(name: "Venkat",
                                              dob: "06-12-1994",
                                              contactImage: "messi",
                                              emailID: "venkat@gmail.com",
                                              phoneNumber: 1234567896,
                                              role: "Data Scientist", econtact: 459874168),
                                      Details(name: "Bhanu",
                                              dob: "11-10-1994",
                                              contactImage: "messi",
                                              emailID: "bhanu@gmail.com",
                                              phoneNumber: 1234567897,
                                              role: "Data Analyst", econtact: 8856712297),
                                      Details(name: "Charles",
                                              dob: "08-27-1995",
                                              contactImage: "messi",
                                              emailID: "charlie@gmail.com",
                                              phoneNumber: 1234567898,
                                              role: "Full Stack Developer", econtact: 9765407914),
                                      Details(name: "messi",
                                              dob: "11-01-1993",
                                              contactImage: "ronaldo",
                                              emailID: "aneesh@gmail.com",
                                              phoneNumber: 1234567899,
                                              role: "UI Engineer", econtact: 9989376168),
                                      Details(name: "Kerry",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "kerry@gmail.com",
                                              phoneNumber: 1234567810,
                                              role: "UI Lead", econtact: 5305385701),
                                      Details(name: "Selena",
                                              dob: "02-29-1993",
                                              contactImage: "ronaldo",
                                              emailID: "selena@gmail.com",
                                              phoneNumber: 1234567811,
                                              role: "Senior iOS Developer", econtact: 9769971412),
                                      Details(name: "Sunil",
                                              dob: "05-17-1980",
                                              contactImage: "messi",
                                              emailID: "sunil@gmail.com",
                                              phoneNumber: 1234567812,
                                              role: "Senior Manager", econtact: 7815601335),
                                      Details(name: "Aravind",
                                              dob: "04-08-1985",
                                              contactImage: "messi",
                                              emailID: "aravind@gmail.com",
                                              phoneNumber: 1234567813,
                                              role: "Front End Developer", econtact: 9964887318),
                                      Details(name: "Christel",
                                              dob: "07-11-1991",
                                              contactImage: "ronaldo",
                                              emailID: "chrsitel@gmail.com",
                                              phoneNumber: 1234567814,
                                              role: "Lead QA Engineer", econtact: 9985016329),
                                      Details(name: "Taylor",
                                              dob: "11-16-1992",
                                              contactImage: "ronaldo",
                                              emailID: "taylor@gmail.com",
                                              phoneNumber: 1234567815,
                                              role: "Product Manager", econtact: 9898761458),
                                      Details(name: "Dianna",
                                              dob: "01-12-1994",
                                              contactImage: "ronaldo",
                                              emailID: "dianna@gmail.com",
                                              phoneNumber: 1234567816,
                                              role: "Data Scientist - II", econtact: 8879391182),
                                      Details(name: "Sarah",
                                              dob: "11-11-1992",
                                              contactImage: "ronaldo",
                                              emailID: "sarah@gmail.com",
                                              phoneNumber: 1234567817,
                                              role: "Businaess Analyst", econtact: 9967811567),
                                      Details(name: "Andrea",
                                              dob: "08-27-1995",
                                              contactImage: "ronaldo",
                                              emailID: "andrea@gmail.com",
                                              phoneNumber: 1234567818,
                                              role: "Backend Developer", econtact: 8761028346),
                                      Details(name: "Sohail",
                                              dob: "03-06-1989",
                                              contactImage: "messi",
                                              emailID: "sohail@gmail.com",
                                              phoneNumber: 1234567819,
                                              role: "Hardware Engineer", econtact: 7982407422),
                                      Details(name: "Sherene",
                                              dob: "06-06-1997",
                                              contactImage: "ronaldo",
                                              emailID: "sherene@gmail.com",
                                              phoneNumber: 1234567820,
                                              role: "Scrum Master", econtact: 9376102775),
                                      Details(name: "Samuel",
                                              dob: "11-26-1985",
                                              contactImage: "messi",
                                              emailID: "samuel@gmail.com",
                                              phoneNumber: 1234567821,
                                              role: "Senior Product Manager", econtact: 9943008281),
                                      Details(name: "Kumar",
                                              dob: "08-27-1982",
                                              contactImage: "messi",
                                              emailID: "kumar@gmail.com",
                                              phoneNumber: 1234567822,
                                              role: "Senior Data Analyst", econtact: 1234569753),
                                      Details(name: "Priyanka",
                                              dob: "01-21-1994",
                                              contactImage: "ronaldo",
                                              emailID: "priyanka@gmail.com",
                                              phoneNumber: 1234567823,
                                              role: "Firmware Developer", econtact: 9457912244),
                                      Details(name: "Krishna",
                                              dob: "06-15-1996",
                                              contactImage: "messi",
                                              emailID: "krishna@gmail.com",
                                              phoneNumber: 1234567824,
                                              role: "Chip Control Engineer", econtact: 9848092919),
                                      Details(name: "Virat",
                                              dob: "08-27-1989",
                                              contactImage: "messi",
                                              emailID: "virat@gmail.com",
                                              phoneNumber: 1234567825,
                                              role: "CEO", econtact: 93679129811),
                                      Details(name: "Dhoni",
                                              dob: "06-12-1974",
                                              contactImage: "messi",
                                              emailID: "dhoni@gmail.com",
                                              phoneNumber: 1234567826,
                                              role: "Test ENgineer", econtact: 9162345678),
                                      Details(name: "Steve",
                                              dob: "12-29-1989",
                                              contactImage: "messi",
                                              emailID: "steve@gmail.com",
                                              phoneNumber: 1234567827,
                                              role: "COO", econtact: 8007651008),
                                      Details(name: "Hillary",
                                              dob: "04-17-1975",
                                              contactImage: "ronaldo",
                                              emailID: "hillary@gmail.com",
                                              phoneNumber: 1234567828,
                                              role: "Director of Logistics", econtact: 9986745610),
                                      Details(name: "Emma",
                                              dob: "05-11-1998",
                                              contactImage: "ronaldo",
                                              emailID: "emma@gmail.com",
                                              phoneNumber: 1234567829,
                                              role: "Data Science Intern", econtact: 7969805129),
                                      Details(name: "Olivia",
                                              dob: "03-05-1992",
                                              contactImage: "ronaldo",
                                              emailID: "olivia@gmail.com",
                                              phoneNumber: 1234567830,
                                              role: "UI Designer", econtact: 9989450814),
                                      Details(name: "Mia",
                                              dob: "02-16-1991",
                                              contactImage: "ronaldo",
                                              emailID: "mia@gmail.com",
                                              phoneNumber: 1234567831,
                                              role: "Senior Java Developer", econtact: 7989560211),
                                      Details(name: "Charlotte",
                                              dob: "11-07-1998",
                                              contactImage: "ronaldo",
                                              emailID: "charlotte@gmail.com",
                                              phoneNumber: 1234567832,
                                              role: "Software Developer Intern", econtact: 9441725901),
                                      Details(name: "Ava",
                                              dob: "08-11-1992",
                                              contactImage: "ronaldo",
                                              emailID: "ava@gmail.com",
                                              phoneNumber: 1234567833,
                                              role: "Hiring Manager", econtact: 9202453221),
                                      Details(name: "Isabella",
                                              dob: "27-01-1993",
                                              contactImage: "ronaldo",
                                              emailID: "isabella@gmail.com",
                                              phoneNumber: 1234567834,
                                              role: "Automation Engineer", econtact: 8876510987),
                                      Details(name: "Emily",
                                              dob: "04-26-1997",
                                              contactImage: "ronaldo",
                                              emailID: "emily@gmail.com",
                                              phoneNumber: 1234567835,
                                              role: "Machine Learning Intern", econtact: 9713407155),
                                      Details(name: "Yana",
                                              dob: "11-02-1984",
                                              contactImage: "ronaldo",
                                              emailID: "yana@gmail.com",
                                              phoneNumber: 1234567836,
                                              role: "Director of Mobile Applications", econtact: 8816705479),
                                      Details(name: "Victoria",
                                              dob: "11-07-1992",
                                              contactImage: "ronaldo",
                                              emailID: "victoria@gmail.com",
                                              phoneNumber: 1234567837,
                                              role: "Data Analyst", econtact: 9167794081),
                                      Details(name: "Sophie",
                                              dob: "11-22-1991",
                                              contactImage: "ronaldo",
                                              emailID: "sophie@gmail.com",
                                              phoneNumber: 1234567838,
                                              role: "Manager Off-Shore", econtact: 9848092818),
                                      Details(name: "Morgan",
                                              dob: "09-16-1982",
                                              contactImage: "messi",
                                              emailID: "morgan@gmail.com",
                                              phoneNumber: 1234567839,
                                              role: "CTO", econtact: 9760664591),
                                      Details(name: "Munna Bhayya",
                                              dob: "08-12-1992",
                                              contactImage: "messi",
                                              emailID: "munna@gmail.com",
                                              phoneNumber: 1234567840,
                                              role: "Manager of External Affairs", econtact: 5305375186)]
    
    
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


//
//  ViewController.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/2/23.
//

import UIKit
import Charts

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDel, UISearchResultsUpdating, UISearchBarDelegate {
    
    let searchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var colleges = [Schools]()
    var filteredColleges = [Schools]()

    override func viewDidLoad() {
    
        super.viewDidLoad()
        initSearchController()
        
        // set self to data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getSchools()
        
    }
    
    func initSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // make sure a row is selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }

        // connect to school that was selected by user
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let selectedSchool:Schools!
        
        if(searchController.isActive){
            selectedSchool = self.filteredColleges[indexPath.row]
        }
        else {
            selectedSchool = self.colleges[indexPath.row]
        }
        
        let tabCtrl = segue.destination as! UITabBarController
        
        let destinationVC = tabCtrl.viewControllers![0] as! DetailViewController // Assuming home view controller is in the first tab, else update the array index
        
        destinationVC.school = selectedSchool;
        
        destinationVC.title = "Main Page"
        
        let navVC = tabCtrl.viewControllers![1]
        
        let navVC2 = tabCtrl.viewControllers![2]
        
        let navVC3 = tabCtrl.viewControllers![3]
        
        navVC.title = "Earnings Trajectory"
        
        navVC2.title = "Top Degrees"
        
        navVC3.title = "SAT Percentile"
        
        // Assuming home view controller is in the first tab, else update the array index
        
        let graphVC = navVC.children[0] as! BarViewController
        
        graphVC.school = selectedSchool;
        
        let graphVC2 = navVC2.children[0] as! BarViewController2
        
        graphVC2.school = selectedSchool;
        
        let graphVC3 = navVC3.children[0] as! BarViewController3
        
        graphVC3.school = selectedSchool;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchController.isActive) {
            return filteredColleges.count
        }
        return colleges.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CollegeCell_ID, for: indexPath) as! CollegeTableViewCell
        
        // Configure cell with data
        
        let school:Schools!
        
        if(searchController.isActive){
            school = self.filteredColleges[indexPath.row]
        }
        else {
            school = self.colleges[indexPath.row]
        }
        
        cell.setCell(school)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func getSchools(_ schools: [Schools]) {
        self.colleges = schools
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        filterForSearchText(searchText: searchText)
    }
    
    func filterForSearchText(searchText: String) {
        
        filteredColleges = colleges.filter {
            
            college in
            if(searchController.searchBar.text != ""){
                
                let collegeMatch = college.schoolName.lowercased().contains(searchText.lowercased())
                
                return collegeMatch
            }
            else {
                return true
            }
        }
        
        tableView.reloadData()
    }

}


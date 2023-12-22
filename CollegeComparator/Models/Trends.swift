//
//  Trends.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/22/23.
//

import Foundation

protocol TrendsDel {
    func getSchool(_ schools:[Schools])
}

class Trends {
    
    var delegate:ModelDel?
    
    func getSchool() {
        
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.results != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.getSchools(response.results!)
                    }
                    
                }
                
            }
            
            catch {
                
                print(error)
            }
            // parse the data

        }
        
        dataTask.resume()
            
        }
    }

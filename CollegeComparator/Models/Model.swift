//
//  Model.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import Foundation

protocol ModelDel {
    func getSchools(_ schools:[Schools])
}

class Model {
    
    var delegate:ModelDel?
    
    var schools:[Schools]?
    
    var ready = false
    
    func getSchools() {
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let session2 = URLSession.shared
        
        let url2 = URL(string: Constants.API_URL_2)
        
        guard url2 != nil else {
            return
        }
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.results != nil && self.ready {
                    
                    DispatchQueue.main.async {
                        self.delegate?.getSchools(response.results!)
                    }
                    
                }
                
                else {
                    
                    self.schools = response.results!
                    
                    self.ready = true
                    
                }
                
            }
            
            catch {
                
                print(error)
            }
            // parse the data

        }
        
        let dataTask2 = session2.dataTask(with: url2!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data!)
                
                //dump(response)
                
                if response.results != nil && self.ready {
                    
                    //print(response.results!)
                    
                    self.schools! += response.results!
                    
                    DispatchQueue.main.async {
                        self.delegate?.getSchools(self.schools!
                        )
                    }
                    
                }
                
                else {
                    
                    self.schools = response.results!
                    
                    self.ready = true
                }
                
            }
            
            catch {
                
                print(error)
            }
            // parse the data

        }
        
        dataTask.resume()
        
        dataTask2.resume()
            
        }
    }


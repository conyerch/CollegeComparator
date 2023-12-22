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
    
    func getSchools() {
        
        
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
                
                //dump(response)
                
                if response.results != nil {
                    
                    //print("not nil")
                    
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


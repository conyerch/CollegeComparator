//
//  Response.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/2/23.
//

import Foundation

struct Response : Decodable {
    
    var results: [Schools]?
        
    enum CodingKeys:String, CodingKey {
            
        case metadata
            
        case results
            
    }
        
    init(from decoder: Decoder) throws {
        
            
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
            
        self.results = try container.decode([Schools].self, forKey: .results)
        
        //dump(results)
        
    }
    
}

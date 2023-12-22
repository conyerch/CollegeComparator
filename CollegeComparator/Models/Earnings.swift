//
//  Earnings.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/6/23.
//

import Foundation

struct Earnings : Decodable {
    
    var med_earnings:Int?
    
    var code:String?
    
    var title:String?
        
    enum CodingKeys:String, CodingKey {
            
        case code
            
        case title
        
        case med_earnings = "overall_median_earnings"
        
        case earnings
        
        case four_year = "4_yr"

    }
        
    init(from decoder: Decoder) throws {
        
            // get container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // read in CIP code
        self.code = try container.decode(String.self, forKey: .code)
        
        // read in program title
        self.title = try container.decode(String.self, forKey: .title)
        
        // get nested earnings container
        let earn = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .earnings)
        
        // get nested years container (in this case 4 year median earnings)
        let year = try earn.nestedContainer(keyedBy: CodingKeys.self, forKey: .four_year)
        
        // get median earnings for program, wrap in do catch for null values
        
        do {
            
            self.med_earnings = try year.decode(Int.self, forKey: .med_earnings)
            
        }
        catch {
            self.med_earnings = -1
            
        }
        
    }
    
}

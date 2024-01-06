//
//  Schools.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/2/23.
//

import Foundation

struct Schools: Decodable {
    
    var id:Int?
    var schoolName = ""
    var studentSize:Int?
    var sat:Int?
    var facSalary:Int?
    var cost:Int?
    var web = ""
    var earnings:[Earnings]?
    var sat_25_math:Int?
    var sat_25_write:Int?
    var sat_25_read:Int?
    var sat_75_math:Int?
    var sat_75_write:Int?
    var sat_75_read:Int?
    var perc_engin:Double?
    var perc_comp:Double?
    var perc_math:Double?
    var perc_hist:Double?
    var perc_business:Double?
    var perc_health:Double?
    var perc_humanities:Double?
    var perc_english:Double?
    var percentages:[(String, Double)] = []
    var scores:[(String, Double)] = []
    var ave_fte:Int?
    var med_10yr:Int?
    var quar_10yr:Int?
    var thir_10yr:Int?
    var med_6yr:Int?
    var quar_6yr:Int?
    var thir_6yr:Int?
    var acc_rate:Double?
    /*
    var med_10yr_2017:Int?
    var med_10yr_2018:Int?
    var med_10yr_2019:Int?
    var med_10yr_2020:Int?
    var med_10yr_2021:Int?*/
    
    // latest.admissions.sat_scores.average.overall,school.faculty_salary,latest.cost.attendance.academic_year"
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case schoolName = "school.name"
        case studentSize = "latest.student.size"
        case sat = "latest.admissions.sat_scores.average.overall"
        case facSalary = "school.faculty_salary"
        case cost = "latest.cost.attendance.academic_year"
        case web = "school.school_url"
        case earnings = "latest.programs.cip_4_digit"
        case sat_25_math = "latest.admissions.sat_scores.25th_percentile.math"
        case sat_25_write = "latest.admissions.sat_scores.25th_percentile.writing"
        case sat_25_read = "latest.admissions.sat_scores.25th_percentile.critical_reading"
        case sat_75_math = "latest.admissions.sat_scores.75th_percentile.math"
        case sat_75_write = "latest.admissions.sat_scores.75th_percentile.writing"
        case sat_75_read = "latest.admissions.sat_scores.75th_percentile.critical_reading"
        case perc_engin = "latest.academics.program_percentage.engineering"
        case perc_comp = "latest.academics.program_percentage.computer"
        case perc_math = "latest.academics.program_percentage.mathematics"
        case perc_hist = "latest.academics.program_percentage.history"
        case perc_business = "latest.academics.program_percentage.business_marketing"
        case perc_health = "latest.academics.program_percentage.health"
        case perc_humanities = "latest.academics.program_percentage.humanities"
        case perc_english = "latest.academics.program_percentage.english"
        case ave_fte = "latest.school.instructional_expenditure_per_fte"
        case med_10yr = "latest.earnings.10_yrs_after_entry.median"
        case quar_10yr = "latest.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.25"
        case thir_10yr = "latest.earnings.10_yrs_after_entry.working_not_enrolled.earnings_percentile.75"
        case med_6yr = "latest.earnings.6_yrs_after_entry.median"
        case quar_6yr = "latest.earnings.6_yrs_after_entry.working_not_enrolled.earnings_percentile.25"
        case thir_6yr = "latest.earnings.6_yrs_after_entry.working_not_enrolled.earnings_percentile.75"
        case acc_rate = "latest.admissions.admission_rate.overall"
        
    }
    
    init (from decoder: Decoder) throws {
       
        // retrieve main container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // set member fields
        self.id = try container.decode(Int.self, forKey: .id)
        
        self.schoolName = try container.decode(String.self, forKey: .schoolName)
        
        self.studentSize = try container.decode(Int.self, forKey: .studentSize)
        
        self.web = try container.decode(String.self, forKey: .web)
        
        do {
            
            self.facSalary = try container.decode(Int.self, forKey: .facSalary)
            self.ave_fte = try container.decode(Int.self, forKey: .ave_fte)
            
        }
        catch {
            self.facSalary = 0
            self.ave_fte = 0
            
        }
        
        // try to get SAT/cost fields, throw error if unretrievable
        do {
            
            self.sat = try container.decode(Int.self, forKey: .sat)
            
        }
        catch {
            self.sat = -1
        }
        
        do {
            
            self.cost = try container.decode(Int.self, forKey: .cost)
            
        }
        catch {
            self.cost = -1
            
            }
        
        // get earnings from Earnings object
        //self.earnings = try container.decode([Earnings]?.self, forKey: .earnings)
        
        do {
            
            self.sat_25_math = try container.decode(Int.self, forKey: .sat_25_math)
            self.sat_75_math = try container.decode(Int.self, forKey: .sat_75_math)
            
        }
        catch {
            self.sat_25_math = 0
            self.sat_75_math = 0
        }
        
        do {
            
            self.sat_25_write = try container.decode(Int.self, forKey: .sat_25_write)
            self.sat_75_write = try container.decode(Int.self, forKey: .sat_75_write)
            
        }
        catch {
            self.sat_25_write = 0
            self.sat_75_write = 0
        }
        
        do {
            
            self.sat_25_read = try container.decode(Int.self, forKey: .sat_25_read)
            self.sat_75_read = try container.decode(Int.self, forKey: .sat_75_read)
            
        }
        catch {
            self.sat_25_read = 0
            self.sat_75_read = 0
        }
        
        do {
            
            self.acc_rate = try container.decode(Double.self, forKey: .acc_rate)
        
        }
        catch {
            self.acc_rate = 1.0
        }
        
        do {
            
            self.med_10yr = try container.decode(Int.self, forKey: .med_10yr)
            self.quar_10yr = try container.decode(Int.self, forKey: .quar_10yr)
            self.thir_10yr = try container.decode(Int.self, forKey: .thir_10yr)
        
        }
        catch {
            self.med_10yr = 0
            self.quar_10yr = 0
            self.thir_10yr = 0
        }
        
        do {
            
            self.med_6yr = try container.decode(Int.self, forKey: .med_6yr)
            self.quar_6yr = try container.decode(Int.self, forKey: .quar_6yr)
            self.thir_6yr = try container.decode(Int.self, forKey: .thir_6yr)
        
        }
        catch {
            self.med_6yr = 0
            self.quar_6yr = 0
            self.thir_6yr = 0
        }
       
        self.perc_engin = try container.decode(Double.self, forKey: .perc_engin)
        
        self.perc_comp = try container.decode(Double.self, forKey: .perc_comp)
        
        self.perc_hist = try container.decode(Double.self, forKey: .perc_hist)
        
        self.perc_english = try container.decode(Double.self, forKey: .perc_english)
        
        self.perc_math = try container.decode(Double.self, forKey: .perc_math)
        
        self.perc_business = try container.decode(Double.self, forKey: .perc_business)
        
        self.perc_humanities = try container.decode(Double.self, forKey: .perc_humanities)
        
        self.perc_health = try container.decode(Double.self, forKey: .perc_health)
        
        self.percentages.append(("Engineering", perc_engin!))
        
        self.percentages.append(("Computer Science", perc_comp!))
        
        self.percentages.append(("Mathematics", perc_math!))
        
        self.percentages.append(("Humanities", perc_humanities!))
        
        self.percentages.append(("Health", perc_health!))
        
        self.percentages.append(("English", perc_english!))
        
        self.percentages.append(("History", perc_hist!))
        
        self.percentages.append(("Business", perc_business!))
        
        self.scores.append(("Bottom Quartile", Double(sat_25_write!)))
        
        self.scores.append(("Top Quartile", Double(sat_75_write!)))
   
        self.scores.append(("Bottom Quartile", Double(sat_25_math!)))
        
        self.scores.append(("Top Quartile", Double(sat_75_math!)))
        
        self.scores.append(("Bottom Quartile", Double(sat_25_read!)))
        
        self.scores.append(("Top Quartile", Double(sat_75_read!)))
        
       }
    
}

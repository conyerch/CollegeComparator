//
//  Constants.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.

import Foundation

struct Constants {
    
    static var API_KEY = "tm10FeQPFFBltVEACrjTbNbe7NgwGOcvfbhjrfma"
    
    static var FIELDS = "id,school.name,latest.student.size,school.school_url,latest.admissions.sat_scores.average.overall,school.faculty_salary,latest.cost.attendance.academic_year,latest.admissions.sat_scores.25th_percentile.critical_reading,latest.admissions.sat_scores.25th_percentile.math,latest.admissions.sat_scores.25th_percentile.writing,latest.admissions.sat_scores.75th_percentile.critical_reading,latest.admissions.sat_scores.75th_percentile.math,latest.admissions.sat_scores.75th_percentile.writing,latest.academics.program_percentage.engineering,latest.academics.program_percentage.computer,latest.academics.program_percentage.mathematics,latest.academics.program_percentage.business_marketing,latest.academics.program_percentage.english,latest.academics.program_percentage.history,latest.academics.program_percentage.health,latest.academics.program_percentage.humanities,latest.school.instructional_expenditure_per_fte,latest.earnings.10_yrs_after_entry.median,latest.admissions.admission_rate.overall"
    
    static var API_URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?latest.admissions.admission_rate.overall__range=0.02..0.4&per_page=100&_fields=\(Constants.FIELDS)&api_key=\(Constants.API_KEY)"
    
    static var API_URL_2 = "https://api.data.gov/ed/collegescorecard/v1/schools.json?latest.admissions.admission_rate.overall__range=0.02..0.4&per_page=100&page=1&_fields=\(Constants.FIELDS)&api_key=\(Constants.API_KEY)"
    
    static var PROGRAM_FIELDS = "latest.programs.cip_4_digit.title,latest.programs.cip_4_digit.code,latest.programs.cip_4_digit.earnings.4_yr.overall_median_earnings"
    
    static var DEGREES = "school.degrees_awarded.predominant=2,3"
    
    static var CollegeCell_ID = "CollegeCell"
    
    static var earnings = "latest.programs.cip_4_digit.earnings.4_yr.overall_median_earnings"
    
}

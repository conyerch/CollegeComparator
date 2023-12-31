# College Comps iOS Application

Creator: Chris Conyers

This Github repository serves as the public, open source homepage for the College Comps iOS application, developed with use of the Department of Education’s College Scorecard Data dictionary. The impetus for this project arose from a desire to disentangle the rich yet vast array of U.S. college data collected and dispersed for public use by the Department of Education in their annual dictionary release into an easily digestible set of current trends and individual college pages. In doing so, this application attempts to clearly display the latest reliable data on emerging fields of study and median returns on education, as well rank top U.S. colleges by metrics such as acceptance rate, earnings per tuition, standardized scoring threshold, and more. Using the search feature, college applicants and transfer students can also easily compare data across all U.S. universities, using this information to assist in the college search process and more. 

To parse the College Scorecard data, this application leverages the decodable protocol to access the Department of Education’s dictionary through their public API and split its member data into usable forms by college. For readability, we make use of the SwiftCharts framework, which allows for clear and modifiable presentation of the relevant metrics in graphical form. Additionally, as can be observed in this repository, the coordinator and delegate pattern is utilized for architecture structure, and the application features a multi-path storyboard that allows for home page visualization of general trends and school specific searching features. 



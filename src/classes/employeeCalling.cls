public with sharing class employeeCalling {

    List<education> educationInfo = new List<education>{ 
        new education('MCA',Date.parse('02/02/2017'),83.3,'Anna univ'),
        new education('BCA',Date.parse('04/05/2019'),92.3,'Anna univ')};

    List<project> projectList1 = new List<project>{
        new project('Online Discount','Clorida','SD',Date.parse('06/03/2017'),Date.parse('02/06/2019'),'Describing'),
        new project('Online Discount Sale','Clorida Tech.','SSD',Date.parse('06/03/2017'),Date.parse('02/06/2019'),'Describing the software')
        };
    List<project> projectList2 = new List<project>{
        new project('Generator','Bambequee','SD',Date.parse('06/03/2017'),Date.parse('02/06/2019'),'Describing'),
        new project('Generator location','Clorida Tech.','SSD',Date.parse('06/03/2017'),Date.parse('02/06/2019'),'Describing the software')
        }; 
    List<workHistory> workInfo = new List<workHistory>{
        new workHistory('Clorida',2.3,'SD','Best award',projectList1), 
        new workHistory('Clorida',2.3,'SD','Best award',projectList2) };      

   
public employeeCalling() {
      employee empa = new employee('gayu','ga@gmail.com','9966885544',14,'greams road','chennai','TN','600002',14,'greams road','chennai','TN','600002',workInfo,educationInfo);
    
}
    


}
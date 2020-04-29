public with sharing class employee {
       
    public employee(String name,String email,String mobile, 
                        Integer residentialDoorNumber, String residentialStreet,String residentialCity,String residentialState,String residentialZipCode,
                        Integer permanentDoorNumber,String permanentStreet, String permanentCity,String permanentState,String permanentZipCode,
                        List<workHistory> workHistories, List<education> education) {
        personalData personal = new personalData(name,email,mobile, 
                        residentialDoorNumber, residentialStreet,residentialCity,residentialState,residentialZipCode,
                        permanentDoorNumber,permanentStreet, permanentCity,permanentState,permanentZipCode);
        workHistories = workHistories;
        education = education;  
    }

}
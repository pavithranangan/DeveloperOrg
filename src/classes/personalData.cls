public with sharing class personalData {

   public personalData(String name,String email,String mobile, 
                        Integer residentialDoorNumber, String residentialStreet,String residentialCity,String residentialState,String residentialZipCode,
                        Integer permanentDoorNumber,String permanentStreet, String permanentCity,String permanentState,String permanentZipCode) {
        name = name;
        email = email;
        mobile = mobile;
        address resdentialAddress = new address(residentialDoorNumber, residentialStreet, residentialCity, residentialState, residentialZipCode);
        address permanentAddress = new address(permanentDoorNumber, permanentStreet, permanentCity, permanentState, permanentZipCode);
    }

    
}
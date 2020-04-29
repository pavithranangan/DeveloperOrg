public with sharing class address {

    public address( Integer doorNumber,String street,String city,String state,String zipCode) {
        doorNumber = doorNumber;
        street = street;
        city = city;
        state = state;
        zipCode = zipCode;
        System.debug(doorNumber+'-'+street+'-'+city+'-'+state+'-'+zipCode);
    }

    
}
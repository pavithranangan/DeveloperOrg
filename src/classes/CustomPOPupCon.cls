public class CustomPOPupCon
{
    public boolean pop{get;set;}
    public boolean chk{get;set;}

    public CustomPOPupCon()
    {      
        pop = false;
    }
    public void showpop()
    {
       if(chk == true)
       {
          pop = true;
       }
    }   
    public void close(){       
       pop = false;
    }
}
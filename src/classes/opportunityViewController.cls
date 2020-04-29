//controller
public class opportunityViewController {
    public List<Opportunity> oppList {set;get;}
    public List<Lead> leadList {set;get;}
    public ID opportunityToDisplay {set;get;}
    public ID leadToDisplay {set;get;}
    public Integer count =0;
    String users = '0052v00000YCtqCAAT';
    String users2 = '0052v00000fulxjAAA';
    String strId;
    Group queueId = new Group();
    
    public opportunityViewController(){
        strId 		= apexpages.currentpage().getparameters().get('id');
        processList();
    }
    public void processList(){
        queueId 	= [SELECT ID FROM Group WHERE Type = 'Queue' AND Name = 'LeadQueue'];
        
        //oppList 	= [SELECT Id,OwnerId FROM Opportunity WHERE StageName != 'Closed Won' AND OwnerId !=: users ORDER BY Name ASC LIMIT 5];
        oppList 	= [SELECT Id,OwnerId FROM Opportunity WHERE StageName != 'Closed Won' AND OwnerId !=: users AND OwnerId !=: users2 ORDER BY Name ASC];
        leadList 	= [SELECT Id,OwnerId FROM Lead WHERE  Status != 'Closed - Converted' AND OwnerId NOT IN (SELECT UserOrGroupId FROM GroupMember WHERE GroupId =: queueId.Id) ORDER BY Name ASC ];
        
        if(strId != null){
            count+=1;
        }
        if(oppList.size()>0){
            showOpp(count);
        }else if(leadList.size()>0){
            showLead(count);
        } 
    }
    public void showOpp(Integer count){
        opportunityToDisplay	=	oppList[count].id;
    }
    
    public void showLead(Integer count){
        leadToDisplay	=	leadList[count].id;        
    }
    
    public PageReference setRedirect(){
        PageReference myVFPage;
        if(opportunityToDisplay != null){
            myVFPage = new PageReference('/lightning/r/Opportunity/'+opportunityToDisplay+'/view');
            myVFPage.setRedirect(true);
        }else{
            if(leadList.size()>0){
                GroupMember member = new GroupMember();
                member.UserOrGroupId = leadList[count].OwnerId;
                member.GroupId = queueId.Id;
                try{
                    insert member;
                }catch(Exception e){
                    System.debug('Exception caught due: ' + e.getMessage());
                }
                
                myVFPage = new PageReference('/lightning/r/Lead/'+leadToDisplay+'/view');
                myVFPage.setRedirect(true);
            }
            
        }
        return myVFPage;
    }
}
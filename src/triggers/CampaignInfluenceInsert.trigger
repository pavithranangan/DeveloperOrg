trigger CampaignInfluenceInsert on CampaignInfluence (after insert) {
    //Create a new list of CampaignInfluence Records.
   List<CampaignInfluence> campInfs = new List<CampaignInfluence>();
   List<Campaign> campp = new List<Campaign>();

    System.debug('view me');
   if(!campInfs.isEmpty()){
       upsert campInfs;//Insert or Update the records if the list if not empty.
       update campp;
   }
}
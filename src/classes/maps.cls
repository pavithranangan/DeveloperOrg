public class maps {
	List<Integer> list_int = new List<Integer>{1,3,1,5,3,9,11,9,100};
    Map<Integer, Integer> map_1 = new Map<Integer,Integer>{};
        
    public void calculation(){
      for(Integer i=0;i<list_int.size();i++){
        Integer key=list_int[i];
        if(map_1.containsKey(list_int[i])==true){
            map_1.put(list_int[i],map_1.get(list_int[i])+1);
        }else{
        map_1.put(list_int[i],1);
        }
      }
   }
    
    public void display(){
        System.debug('list'+list_int);
		System.debug('maps'+map_1);
    }
    public static void sam(Integer i){
        System.Debug('sam - '+i);
    }
}
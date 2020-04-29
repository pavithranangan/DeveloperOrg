public class numbers {
	Integer even=0,odd=0;
    List<Integer>even_list= new List<Integer>{};
	List<Integer>odd_list= new List<Integer>{};
    
    public void odd(integer no){
        odd++;
        odd_list.add(no);
    }
    
    public void even(integer no){
        even++;
        even_list.add(no);
        
    }
	
    public void display_values(){
        System.Debug('odd numbers'+odd_list);
        System.Debug('even numbers'+even_list);
    }
}
public  class MyApexClass2 {
    
    @InvocableMethod(label='Work With Update Account' description='Returns the list of account names corresponding to the specified account IDs.' category='Account')
    public static void workWithUpAccount(List<ID> ids) {
        
        ID f=ids.get(0);
      
        List<Task> tasks=new List<Task>();
        tasks=[SELECT Id, WhatId FROM Task WHERE WhatId=:f];
        if(tasks.size()>=3){
            List<User> users=[SELECT Id FROM User limit 1];
            for (Task variable : tasks) {
                variable.OwnerId=users.get(0).Id;
            }
           
            update tasks;
         }
    }
}

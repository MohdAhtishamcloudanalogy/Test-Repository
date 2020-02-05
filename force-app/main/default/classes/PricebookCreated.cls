public class PricebookCreated {
    public static void pricebookCreated(){
        
        Pricebook2  p = new Pricebook2();
        p.name='Lenovo Pricebook2';
        p.Description ='Pricebook with All product and Price';
        p.IsActive = true;
        insert p;

        
       List<Product2> proList = new List<Product2>(); 
        
        for(Integer i =0 ;i<10;i++){ 
            Product2 pro = new Product2();            
            pro.Name = 'Lenovo'+ i; 
                       
            proList.add(pro); 
        } 
        insert proList;
         
        Pricebook2 standardPB = [select id from Pricebook2 where isStandard=true];
        PricebookEntry standardPBE = new PricebookEntry(Pricebook2Id = standardPB.Id, Product2Id = p.Id, UnitPrice = 1000, IsActive = true);
        insert standardPBE;
		
		List<PricebookEntry> pbeList = new List<PricebookEntry>();
        For(Product2 prod : proList){
			PricebookEntry  pb = new PricebookEntry();
			pb.IsActive =true;
			pb.Pricebook2Id =p.id;
			pb.UseStandardPrice =false;   
			pb.UnitPrice =5001;
			pb.Product2Id=prod.Id;
			pbeList.add(pb);
		}
        insert pbeList;

        }
           
        
        }
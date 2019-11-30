package rtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rtobeans.CustomerBean;

public class CustomerDao {
	static Connection con=null;
    static PreparedStatement pst=null;
    static PreparedStatement pst1=null;
    static ResultSet rs=null;
    static ResultSet rs1=null;
	  static boolean flag=false;
	//----------get-database-connection---------//
	  /**
		 *
		 * @author : VRS 
		 * @date   : 12/11/2019
		 * @version: 1.0
		 * @purpose: set connection
		 * @param  : Connection
		 * @return : connection
		 
		 */
	  public static Connection getDbConnection()throws SQLException{
	      
		    
			try	  {
					DBDAO.connect();
					con=DBDAO.getDbCon();
			   
		  }	catch(ClassNotFoundException  ex)		   {
				 ex.printStackTrace();
			}catch(SQLException e)		{
				e.printStackTrace();
			}
			return con;
	    }
	//-----------Temporary Registration---------//
	    /**
		 *
		 * @author : VRS 
		 * @date   : 12/11/2019
		 * @version: 1.0
		 * @purpose: Temporary registration
		 * @param  : customerBean
		 * @return : boolean flag
		 
		 */
	  
	  public static boolean insertTemp(CustomerBean customerbean)throws SQLException{

			  
			  con=getDbConnection();
			  pst = con.prepareStatement("insert into rto_tempreg(t_bookdate,t_vname,t_vtype,t_vclass,t_vmaker,t_color,t_dealer,t_status,t_username) values(?,?,?,?,?,?,?,'processing',?)");
			  pst.setDate(1, customerbean.getVdate());
			  pst.setString(2, customerbean.getVname());
			  pst.setString(3, customerbean.getVtype());
			  pst.setString(4, customerbean.getVclass());
			  pst.setString(5, customerbean.getVmaker());
			  pst.setString(6, customerbean.getVcolor());
			  pst.setString(7, customerbean.getVdealer());
			  pst.setString(8,customerbean.getUname());
			  pst.executeUpdate();
			  flag=true;
		  return flag;
	  }
	//-----------select vegicle details---------//
	    /**
		 *
		 * @author : VRS 
		 * @date   : 12/11/2019
		 * @version: 1.0
		 * @purpose: select vehicle details list
		 * @param  : Nothing
		 * @return : cb
		 
		 */
	    
	    
public static ArrayList<CustomerBean> selectVehicle1() throws SQLException{
	    	
	    	ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
	        try{
	            
	            con=getDbConnection();
	        pst=con.prepareStatement("select * from rto_vehicle");
	       rs=pst.executeQuery();
	        while(rs.next()){
	        	CustomerBean customerBean=new CustomerBean();
	        	customerBean.setVtype(rs.getString(2));
	        	customerBean.setVclass(rs.getString(3));
	        	customerBean.setVmaker(rs.getString(4));
	        	customerBean.setVname(rs.getString(5));
	        	customerBean.setVcolor(rs.getString(6));
	        	
	        	cb.add(customerBean);
	        }
	        
	    } catch(Exception e){
	        e.printStackTrace();
	    }
	    return cb;
	        
	}
//-----------View Registration Details---------//
/**
 *
 * @author : VRS 
 * @date   : 12/11/2019
 * @version: 1.0
 * @purpose: View Registration Details
 * @param  : customerBean
 * @return : cb
 
 */
public static ArrayList<CustomerBean> displayMsg(CustomerBean custBean) throws SQLException{
	
	ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
    try{
        
        con=getDbConnection();
    //pst=con.prepareStatement("select rto_tempreg.t_bookdate,rto_tempreg.t_vname,rto_tempreg.t_status,rto_tempreg.t_tempno,rto_permanent_reg.p_permanent_number,rto_permanent_reg.p_status from rto_tempreg cross join rto_permanent_reg where rto_tempreg.t_username=? ");
    pst=con.prepareStatement("select t_bookdate,t_vname,t_status,t_tempno from rto_tempreg where t_username=?");
    pst.setString(1,custBean.getUname());
    pst1=con.prepareStatement("select p_permanent_number,p_status from rto_permanent_reg where p_temp_number=?");
    pst1.setString(1,custBean.getTempno()); 
   rs=pst.executeQuery();
   
    while(rs.next()){
    	CustomerBean customerBean=new CustomerBean();
    	customerBean.setVdate(rs.getDate(1));
    	customerBean.setVname(rs.getString(2));
    	customerBean.setStatus(rs.getString(3));
    	customerBean.setTempno(rs.getString(4));
    	
    	 	
    	cb.add(customerBean);
    }
    rs1=pst1.executeQuery();
    while(rs1.next()){
    	CustomerBean customerBean=new CustomerBean();
    	customerBean.setPno(rs1.getString(1));
    	customerBean.setStatus(rs1.getString(2));
    	cb.add(customerBean);
    }
    
} catch(Exception e){
    e.printStackTrace();
}
return cb;
}
//-----------select temporary number---------//
/**
 *
 * @author : VRS 
 * @date   : 17/11/2019
 * @version: 1.0
 * @purpose: select temporary number
 * @param  : customerBean
 * @return : cb
 
 */


public static ArrayList<CustomerBean> getTempNo(CustomerBean custBean) throws SQLException{
	
	ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
    try{
        
        con=getDbConnection();
    pst=con.prepareStatement("select t_tempno from rto_tempreg where t_username=?");
    pst.setString(1,custBean.getUname());
   rs=pst.executeQuery();
    while(rs.next()){
    	CustomerBean customerBean=new CustomerBean();
    	customerBean.setTempno(rs.getString(1));
    	
    	cb.add(customerBean);
    }
    
} catch(Exception e){
    e.printStackTrace();
}
return cb;
    
}
//-----------Permanent Registration---------//
/**
 *
 * @author : VRS 
 * @date   : 12/11/2019
 * @version: 1.0
 * @purpose: Temporary registration
 * @param  : customerBean
 * @return : boolean flag
 
 */

public static boolean insertPermanent(CustomerBean customerbean)throws SQLException{

	  
	  con=getDbConnection();
	  pst = con.prepareStatement("insert into rto_permanent_Reg(p_apply_date,p_username,p_status,p_temp_number) values(?,?,'processing',?)");
	  pst.setDate(1, customerbean.getVdate());
	  pst.setString(2,customerbean.getUname());
	  pst.setString(3,customerbean.getTempno());
	  pst.executeUpdate();
	  flag=true;
  return flag;
}

//-----------Get Temporary registration date---------//
/**
*
* @author : VRS 
* @date   : 12/11/2019
* @version: 1.0
* @purpose: Get Temporary registration date
* @param  : custBean
* @return : alist

*/
public static ArrayList<CustomerBean> getDifferOfTempDate(CustomerBean custbean)throws SQLException{
	con = getDbConnection();
	pst = con.prepareStatement("select t_id,t_regdate from rto_tempreg where t_username=?");
	pst.setString(1, custbean.getUname());
	rs = pst.executeQuery();
	ArrayList<CustomerBean> alist = new ArrayList<CustomerBean>();
	while(rs.next()){
		CustomerBean cbean = new CustomerBean();
		cbean.setId(rs.getInt(1));
		cbean.setRegDate(rs.getDate(2));
		alist.add(cbean);
		for(CustomerBean cb:alist){
			System.out.println(cb.getId());
			System.out.println(cb.getRegDate());
		}
	}
	return alist;
}

//-----------Update status---------//
/**
*
* @author : VRS 
* @date   : 12/11/2019
* @version: 1.0
* @purpose: Update status
* @param  : customerBean cb
* @return : flag

*/
public static boolean updateTempStatus(CustomerBean cb)throws SQLException{
	con = getDbConnection();
	pst = con.prepareStatement("update rto_tempreg set t_status='Expired' where t_id=? ");
	pst.setInt(1, cb.getId());
	pst.executeUpdate();
	flag = true;
	return flag;
			
}
//-----------Get Username---------//
/**
*
* @author : VRS 
* @date   : 17/11/2019
* @version: 1.0
* @purpose: Get Id
* @param  : Nothing
* @return : cb

*/


public static ArrayList<CustomerBean> getId() throws SQLException{
	
	ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
  try{
      
      con=getDbConnection();
  pst=con.prepareStatement("select t_id,t_regdate,t_username from rto_tempreg where t_status='approved'");
 
 rs=pst.executeQuery();
  while(rs.next()){
  	CustomerBean customerBean=new CustomerBean();
  	customerBean.setId(rs.getInt(1));
  	customerBean.setRegDate(rs.getDate(2));
  	customerBean.setUname(rs.getString(3));
  	cb.add(customerBean);
  }
  
} catch(Exception e){
  e.printStackTrace();
}
  //System.out.print("Hai");
  for(CustomerBean cus:cb){
  System.out.println(cus.getId());
  }
return cb;
  
}

//-----------Get Username---------//
/**
*
* @author : VRS 
* @date   : 17/11/2019
* @version: 1.0
* @purpose: Get Username
* @param  : Nothing
* @return : cb

*/


public static ArrayList<CustomerBean> getStatus(CustomerBean cusBean) throws SQLException{
	
	ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
try{
    
    con=getDbConnection();
pst=con.prepareStatement("select t_status from rto_tempreg where t_username=?");
pst.setString(1, cusBean.getUname());
rs=pst.executeQuery();
while(rs.next()){
	CustomerBean customerBean=new CustomerBean();
	customerBean.setStatus(rs.getString(1));
	
	cb.add(customerBean);
}

} catch(Exception e){
e.printStackTrace();
}
for(CustomerBean cus:cb){
System.out.println(cus.getStatus());
}
return cb;

}
public static ArrayList<CustomerBean> selectVehicle() throws SQLException{
	   
    ArrayList<CustomerBean> cb=new ArrayList<CustomerBean>();
       try{
           
           con=getDbConnection();
       pst=con.prepareStatement("select * from rto_vehicle");
      rs=pst.executeQuery();
       while(rs.next()){
        CustomerBean customerBean=new CustomerBean();
        customerBean.setVtype(rs.getString(2));
        customerBean.setVclass(rs.getString(3));
        customerBean.setVmaker(rs.getString(4));
        customerBean.setVname(rs.getString(5));
        customerBean.setVcolor(rs.getString(6));
        customerBean.setVdealer(rs.getString(7));
        cb.add(customerBean);
       }
       
   } catch(Exception e){
       e.printStackTrace();
   }
   return cb;
       
}
}


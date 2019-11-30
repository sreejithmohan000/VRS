package rtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rtobeans.AdminBean;
import rtobeans.DealerBean;
import rtobeans.RtoBean;

public class DealerDao {
	static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs=null;
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
	//-----------Add Vehicle---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 12/11/2019
	  	 * @version: 1.0
	  	 * @purpose: add vehicle
	  	 * @param  : rtoBean
	  	 * @return : boolean flag
	  	 */
    public static boolean insertVehicle(DealerBean dealerBean) throws SQLException{
	      
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("insert into rto_vehicle(v_type,v_class,v_maker,v_name,v_color,v_dealer)values(?,?,?,?,?,?)");
	      
	      pst.setString(1,dealerBean.getVtype());
	      pst.setString(2,dealerBean.getVclass());
	      pst.setString(3, dealerBean.getVmaker());
	      pst.setString(4, dealerBean.getVname()); 
	      pst.setString(5,dealerBean.getVcolor());
	      pst.setString(6,dealerBean.getUname());
	      pst.executeUpdate();
	      flag=true;
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return flag;
	      
	  }
     
  //-----------Approve Temporary Registration---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 16/11/2019
	  	 * @version: 1.0
	  	 * @purpose: approve temporary registration
	  	 * @param  : dealerBean
	  	 * @return : boolean flag
	  	 */
    public static boolean approveTemporary1(DealerBean dealerBean){
 	   try{

 	          con=getDbConnection();
 	      pst=con.prepareStatement("update rto_tempreg set t_regdate=?,t_tempno=?,t_status='approved' where t_id=?");
 	      pst.setDate(1,dealerBean.getDate());
 	      pst.setString(2,dealerBean.getTempno());
 	      pst.setInt(3,dealerBean.getId()); 
 	     pst.executeUpdate();
 	     flag=true;
 		   
 	   }
 	   catch(Exception e){
 		      e.printStackTrace();
 		  }
 		  return flag;
 		      
    }
    
    public static ArrayList<DealerBean> displayNewBooking() throws SQLException{
    	
    	ArrayList<DealerBean> db=new ArrayList<DealerBean>();
        try{
            
            con=getDbConnection();
        pst=con.prepareStatement("select * from rto_tempreg where t_status='processing'");
       rs=pst.executeQuery();
        while(rs.next()){
        	DealerBean dealerBean=new DealerBean();
        	dealerBean.setId(rs.getInt(1));
        	dealerBean.setDate(rs.getDate(2));
        	dealerBean.setVname(rs.getString(4));
        	dealerBean.setVtype(rs.getString(5));
        	dealerBean.setVclass(rs.getString(6));
        	dealerBean.setVmaker(rs.getString(7));
        	dealerBean.setVdealer(rs.getString(8));
        	dealerBean.setUname(rs.getString(12));
        	 	
        	db.add(dealerBean);
        }
        
    } catch(Exception e){
        e.printStackTrace();
    }
    return db;
        
    }
    
  //-----------Approve Temporary Registration---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 16/11/2019
	  	 * @version: 1.0
	  	 * @purpose: approve temporary registration
	  	 * @param  : dealerBean
	  	 * @return : boolean flag
	  	 */
  public static boolean approveTemporary(DealerBean dealerBean){
	   try{

	          con=getDbConnection();
	      pst=con.prepareStatement("update rto_tempreg set t_regdate=?,t_tempno=?,t_status='approved',t_chasisno=?,t_engineno=? where t_id=?");
	      pst.setDate(1,dealerBean.getDate());
	      pst.setString(2,dealerBean.getTempno());
	     pst.setString(3,dealerBean.getChno());
	    pst.setString(4,dealerBean.getEno());
	      pst.setInt(5,dealerBean.getId()); 
	     pst.executeUpdate();
	     flag=true;
		   
	   }
	   catch(Exception e){
		      e.printStackTrace();
		  }
		  return flag;
		      
  }
  
  public static ArrayList<DealerBean> displayNewBooking(String name) throws SQLException{
  	
  	ArrayList<DealerBean> db=new ArrayList<DealerBean>();
      try{
          
          con=getDbConnection();
      pst=con.prepareStatement("select * from rto_tempreg where t_status='processing' and t_dealer=?");
      pst.setString(1, name);
     rs=pst.executeQuery();
      while(rs.next()){
      	DealerBean dealerBean=new DealerBean();
      	dealerBean.setId(rs.getInt(1));
      	dealerBean.setDate(rs.getDate(2));
      	dealerBean.setVname(rs.getString(4));
      	dealerBean.setVtype(rs.getString(5));
      	dealerBean.setVclass(rs.getString(6));
      	dealerBean.setVmaker(rs.getString(7));
      	dealerBean.setVdealer(rs.getString(8));
      	dealerBean.setUname(rs.getString(12));
      	 	
      	db.add(dealerBean);
      }
      
  } catch(Exception e){
      e.printStackTrace();
  }
  return db;
      
  }
  
//----------View Vehicle---------//
  /**
	 *
	 * @author : VRS 
	 * @date   : 15/11/2019
	 * @version: 1.0
	 * @purpose: view dealer
	 * @param  : Nothing
	 * @return : db
	 
	 */
    
    public static ArrayList<DealerBean> viewVehicle(DealerBean dealerBean1) throws SQLException{
      	
      	ArrayList<DealerBean> db=new ArrayList<DealerBean>();
          try{
              
              con=getDbConnection();
          pst=con.prepareStatement("select * from rto_vehicle where v_dealer=?");
          pst.setString(1,dealerBean1.getUname());
         rs=pst.executeQuery();
          while(rs.next()){
        	  DealerBean dealerBean=new DealerBean();
        	  //loginBean.setUid(rs.getInt(1));
        	  dealerBean.setId(rs.getInt(1));
        	  dealerBean.setVtype(rs.getString(2));
        	  dealerBean.setVclass(rs.getString(3));
        	  dealerBean.setVmaker(rs.getString(4));
        	  dealerBean.setVname(rs.getString(5));
        	  dealerBean.setVcolor(rs.getString(6));
        	  
          	db.add(dealerBean);
          }
          
      } catch(Exception e){
          e.printStackTrace();
      }
      return db;
          
      }
    
  //-----------Delete Vehicle---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: delete vehicle
	  	 * @param  : adminBean
	  	 * @return : flag
	  	 
	  	 */
	  public static boolean deleteVehicle(DealerBean dealerBean) throws SQLException{
	  	
	  	
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("delete from rto_vehicle where v_id=?");
	      pst.setInt(1, dealerBean.getId());
	     pst.executeQuery();
	     flag=true;
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return flag;
	      
	  }
	  
	  /**
		 *
		 * @author : VRS
		 * @date   : 15/11/2019
		 * @version: 1.0
		 * @purpose: update vehicle 
		 * @param  : adminBean
		 * @return : Boolean
		 
		 */
	 public static boolean updateVehicle(DealerBean dealerBean) throws SQLException{
	     
	         
	        con=getDbConnection();
	        pst=con.prepareStatement("update rto_vehicle set v_type=?,v_class=?,v_maker=?,v_name=?,v_color=? where v_id=?");
	        pst.setString(1,dealerBean.getVtype());
	        pst.setString(2,dealerBean.getVclass()); 
	        pst.setString(3,dealerBean.getVmaker());
	        pst.setString(4,dealerBean.getVname());
	        pst.setString(5,dealerBean.getVcolor());
	        pst.setInt(6,dealerBean.getId()); 
	        
	        pst.executeUpdate();
	        flag=true;
	 return flag;
	     
	}

    
}

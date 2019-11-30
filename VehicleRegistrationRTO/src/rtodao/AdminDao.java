package rtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rtobeans.AdminBean;
import rtobeans.NumberPlateBean;
import rtobeans.PermanentRegBean;
import rtobeans.RtoBean;

public class AdminDao {
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
			   
		  }	catch(ClassNotFoundException  ex){
				 ex.printStackTrace();
			}catch(SQLException e)		{
				e.printStackTrace();
			}
			return con;
	    }
	  
	//-----------View Daily Report---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: View Daily Report
	  	 * @param  : adminBean
	  	 * @return : alist
	  	 */
	  public static ArrayList<AdminBean> viewDailyReport(AdminBean adminbean)throws SQLException{
			con = getDbConnection();
			pst = con.prepareStatement("select o.p_apply_date,o.p_approve_date,o.p_permanent_number,o.p_username,i.t_vtype,i.t_vmaker from rto_permanent_reg o inner join rto_tempreg i on o.p_username=i.t_username where o.p_approve_date=to_date('"+adminbean.getCurrentDate()+"','yyyy/mm/dd') and i.t_status='processing'");
			rs = pst.executeQuery();
			ArrayList<AdminBean> alist = new ArrayList<AdminBean>();
			while(rs.next()){
				AdminBean rbean = new AdminBean();
				rbean.setFromDate(rs.getDate(1));
				rbean.setToDate(rs.getDate(2));
				rbean.setPermanantNumber(rs.getString(3));
				rbean.setUserName(rs.getString(4));
				rbean.setVehicleType(rs.getString(5));
				rbean.setVehicleMaker(rs.getString(6));
				alist.add(rbean);
			}
			return alist;
		}
	//-----------View Monthly Report---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: View Monthly Report
	  	 * @param  : adminBean
	  	 * @return : alist
	  	 */
	  public static ArrayList<AdminBean> viewMonthlyReport(AdminBean adminbean)throws SQLException{
			con = getDbConnection();
			//System.out.println("******************>>>>>>>>>>>from"+adminbean.getFromDate());
			pst = con.prepareStatement("select o.p_apply_date,o.p_approve_date,o.p_permanent_number,o.p_username,i.t_vtype,i.t_vmaker from rto_permanent_reg o inner join rto_tempreg i on o.p_username=i.t_username where o.p_approve_date between to_date('"+adminbean.getFromDate()+"','yyyy/mm/dd') and to_date('"+adminbean.getToDate()+"','yyyy/mm/dd') and o.p_status='approved'");
			rs = pst.executeQuery();
			ArrayList<AdminBean> alist = new ArrayList<AdminBean>();
			while(rs.next()){
				AdminBean adminbean1 = new AdminBean();
				adminbean1.setFromDate(rs.getDate(1));
				adminbean1.setToDate(rs.getDate(2));
				adminbean1.setPermanantNumber(rs.getString(3));
				adminbean1.setUserName(rs.getString(4));
				adminbean1.setVehicleType(rs.getString(5));
				adminbean1.setVehicleMaker(rs.getString(6));
				alist.add(adminbean1);
				
			}
			return alist;
			
		}
	//-----------Add Dealer---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 06/11/2019
	  	 * @version: 1.0
	  	 * @purpose: Add Dealer
	  	 * @param  : adminBean
	  	 * @return : boolean flag
	  	 */
    public static boolean addDealer(AdminBean adminBean) throws SQLException{
	      
	      
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("insert into rto_dealer(d_name,d_address,d_idproof,d_idproofno,d_mob,d_email,d_username)values(?,?,?,?,?,?,?)");
	      pst.setString(1, adminBean.getName()); 
	      pst.setString(2,adminBean.getAddress());
	      pst.setString(3,adminBean.getIdproof());
	      pst.setString(4,adminBean.getIdproofno());
	      pst.setString(5,adminBean.getMob());
	      pst.setString(6,adminBean.getEmail());
	      pst.setString(7,adminBean.getUname());
	      pst.executeUpdate();
	      flag=true;

	  return flag;
	      
	  }
    
  //-----------login insert dealer---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: login insert
	  	 * @param  : rtoBean
	  	 * @return : boolean flag
	  	 */
  public static boolean LoginDealer(AdminBean adminBean) throws SQLException{
	      
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("insert into rto_login(l_username,l_password,l_role,r_id)values(?,?,'dealer',?)");
	      pst.setString(1, adminBean.getUname()); 
	      pst.setString(2,adminBean.getUpswd());
	      pst.setInt(3,adminBean.getId());
	      pst.executeUpdate();
	      flag=true;
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return flag;
	      
	  }
  
	//----------View Dealer---------//
	  /**
		 *
		 * @author : VRS 
		 * @date   : 15/11/2019
		 * @version: 1.0
		 * @purpose: view dealer
		 * @param  : Nothing
		 * @return : ab
		 
		 */
	    
	    public static ArrayList<AdminBean> viewDealer() throws SQLException{
	      	
	      	ArrayList<AdminBean> ab=new ArrayList<AdminBean>();
	          try{
	              
	              con=getDbConnection();
	          pst=con.prepareStatement("select * from rto_dealer");
	         rs=pst.executeQuery();
	          while(rs.next()){
	        	  AdminBean adminBean=new AdminBean();
	        	  //loginBean.setUid(rs.getInt(1));
	        	  adminBean.setName(rs.getString(2));
	        	  adminBean.setAddress(rs.getString(3));
	        	  adminBean.setIdproof(rs.getString(4));
	        	  adminBean.setIdproofno(rs.getString(5));
	        	  adminBean.setMob(rs.getString(6));
	        	  adminBean.setEmail(rs.getString(7));
	        	  adminBean.setUname(rs.getString(8));
	          	ab.add(adminBean);
	          }
	          
	      } catch(Exception e){
	          e.printStackTrace();
	      }
	      return ab;
	          
	      }
	    /**
		 *
		 * @author : VRS
		 * @date   : 15/11/2019
		 * @version: 1.0
		 * @purpose: update dealer 
		 * @param  : adminBean
		 * @return : Boolean
		 
		 */
	 public static boolean updateDealer(AdminBean adminBean) throws SQLException{
	     
	         
	        con=getDbConnection();
	        pst=con.prepareStatement("update rto_dealer set d_name=?,d_address=?,d_idproof=?,d_idproofno=?,d_mob=?,d_email=? where d_username=?");
	        pst.setString(1,adminBean.getName());
	        pst.setString(2,adminBean.getAddress()); 
	        pst.setString(3,adminBean.getIdproof());
	        pst.setString(4,adminBean.getIdproofno());
	        pst.setString(5,adminBean.getMob());
	        pst.setString(6,adminBean.getEmail()); 
	        pst.setString(7,adminBean.getUname());
	        pst.executeUpdate();
	        flag=true;
	 return flag;
	     
	}
	 
	 /**
	 *
	 * @author : VRS
	 * @date   : 15/11/2019
	 * @version: 1.0
	 * @purpose: update customer
	 * @param  : adminBean
	 * @return : Boolean
	 
	 */
 public static boolean updateCustomer(AdminBean adminBean) throws SQLException{
     
         
        con=getDbConnection();
        pst=con.prepareStatement("update rto_registration set r_name=?,r_address=?,r_idproof=?,r_idproofno=?,r_mob=?,r_email=? where r_username=?");
        pst.setString(1,adminBean.getName());
        pst.setString(2,adminBean.getAddress()); 
        pst.setString(3,adminBean.getIdproof());
        pst.setString(4,adminBean.getIdproofno());
        pst.setString(5,adminBean.getMob());
        pst.setString(6,adminBean.getEmail()); 
        pst.setString(7,adminBean.getUname());
        pst.executeUpdate();
        flag=true;
 return flag;
     
}
	 
	 //-----------Username check---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 06/11/2019
	  	 * @version: 1.0
	  	 * @purpose: check username
	  	 * @param  : rtoBean
	  	 * @return : boolean flag
	  	 
	  	 */
	  public static ArrayList<AdminBean> checkUname(AdminBean adminBean) throws SQLException{
	  	
	  	ArrayList<AdminBean> ab=new ArrayList<AdminBean>();
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("select l_username from rto_login where l_username=?");
	      pst.setString(1, adminBean.getUname());
	     rs=pst.executeQuery();
	      while(rs.next()){
	      	 adminBean=new AdminBean();
	      	adminBean.setUname(rs.getString(1));
	      	
	      	ab.add(adminBean);
	      }
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return ab;
	      
	  }
	  
	//-----------Get Id---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: get id
	  	 * @param  : adminBean
	  	 * @return : rs
	  	 
	  	 */
	  public static ResultSet selectId(AdminBean adminBean) throws SQLException{
	  	
	  	
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("select d_id from rto_dealer where d_username=?");
	      pst.setString(1, adminBean.getUname());
	     rs=pst.executeQuery();
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return rs;
	      
	  }

	//-----------Delete Dealer---------//
	  /**
	  	 *
	  	 * @author : VRS 
	  	 * @date   : 15/11/2019
	  	 * @version: 1.0
	  	 * @purpose: delete dealer
	  	 * @param  : adminBean
	  	 * @return : flag
	  	 
	  	 */
	  public static boolean deleteDealer(AdminBean adminBean) throws SQLException{
	  	
	  	
	      try{
	          
	          con=getDbConnection();
	      pst=con.prepareStatement("delete from rto_dealer where d_username=?");
	      pst.setString(1, adminBean.getUname());
	     pst.executeQuery();
	     pst=con.prepareStatement("delete from rto_login where l_username=?");
	      pst.setString(1, adminBean.getUname());
	     pst.executeQuery();
	     flag=true;
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return flag;
	      
	  }
	//----------view Customer---------//
	  /**
		 *
		 * @author : VRS 
		 * @date   : 15/11/2019
		 * @version: 1.0
		 * @purpose: view customer
		 * @param  : Nothing
		 * @return : ab
		 
		 */
	    
	    public static ArrayList<AdminBean> viewCustomer() throws SQLException{
	      	
	      	ArrayList<AdminBean> ab=new ArrayList<AdminBean>();
	          try{
	              
	              con=getDbConnection();
	          pst=con.prepareStatement("select * from rto_registration");
	         rs=pst.executeQuery();
	          while(rs.next()){
	        	  AdminBean adminBean=new AdminBean();
	        	  //loginBean.setUid(rs.getInt(1));
	        	  adminBean.setName(rs.getString(2));
	        	  adminBean.setAddress(rs.getString(3));
	        	  adminBean.setIdproof(rs.getString(4));
	        	  adminBean.setIdproofno(rs.getString(5));
	        	  adminBean.setMob(rs.getString(6));
	        	  adminBean.setEmail(rs.getString(7));
	        	  adminBean.setUname(rs.getString(8));
	        	  adminBean.setImg(rs.getString(9));
	          	ab.add(adminBean);
	          }
	          
	      } catch(Exception e){
	          e.printStackTrace();
	      }
	      return ab;
	          
	      }
	  //----------Approve Permanent Registration---------//
		  /**
			 *
			 * @author : VRS 
			 * @date   : 15/11/2019
			 * @version: 1.0
			 * @purpose: view customer
			 * @param  : Nothing
			 * @return : alist
			 
			 */
		    

		public static ArrayList<PermanentRegBean> approvePermanentNumber()throws SQLException{
			con = getDbConnection();
			String st="processing";
			pst = con.prepareStatement("select o.p_id,o.p_apply_date,i.t_vname,i.t_vtype,i.t_vclass,i.t_vmaker,i.t_tempno,i.t_username,r.r_name,r.r_idproof,r.r_idproofno,r.r_mob,o.p_status,r.r_email from rto_permanent_reg o inner join rto_tempreg i on o.p_temp_number=i.t_tempno inner join rto_registration r on o.p_username=r.r_username where o.p_status=?");
			pst.setString(1,st);
			//System.out.println("------------------------------>>>>>>>>>>>>><<<<<<<<<<<<<<---------------------");
			
			rs = pst.executeQuery();
			//System.out.println("------------------------------>>>>>>>>>>>>><<<<<<<<<<<<<<---------------------");
			ArrayList<PermanentRegBean> alist = new ArrayList<PermanentRegBean>();
			while(rs.next()){
				PermanentRegBean pbean = new PermanentRegBean();
				pbean.setpId(rs.getInt(1));
				pbean.setAppliedDate(rs.getDate(2));
				pbean.setVehicleName(rs.getString(3));
				pbean.setVehicleType(rs.getString(4));
				pbean.setVehicleClass(rs.getString(5));
				pbean.setVehicleMaker(rs.getString(6));
				pbean.setTempNo(rs.getString(7));
				pbean.setUname(rs.getString(8));
				pbean.setRegName(rs.getString(9));
				pbean.setIdProof(rs.getString(10));
				pbean.setIdProofNo(rs.getString(11));
				pbean.setRegMob(rs.getString(12));
				pbean.setStatus(rs.getString(13));
				pbean.setEmail(rs.getString(14));
				alist.add(pbean);
			}
			
			return alist;
		}
		
		 //----------UPdate Permanent Status---------//
		  /**
			 *
			 * @author : VRS 
			 * @date   : 15/11/2019
			 * @version: 1.0
			 * @purpose: UPdate Permanent Status
			 * @param  : pbean
			 * @return : alist
			 
			 */
		public static boolean updatePermanentDet(PermanentRegBean pbean)throws SQLException{
			con = getDbConnection();
			pst = con.prepareStatement("update rto_permanent_reg set p_approve_date=?,p_permanent_number=?,p_status='Approved' where p_id=?");
			pst.setDate(1, pbean.getApprovedDate());
			pst.setString(2, pbean.getPermanentNo());
			pst.setInt(3, pbean.getpId());
			pst.executeUpdate();
			flag=true;
			return flag;
		}
		
		 //----------Get ---------//
		  /**
			 *
			 * @author : VRS 
			 * @date   : 15/11/2019
			 * @version: 1.0
			 * @purpose: UPdate Permanent Status
			 * @param  : pbean
			 * @return : alist
			 
			 */
		
		public static ArrayList<NumberPlateBean> getNumberPlateDet()throws SQLException{
			con = getDbConnection();
			pst = con.prepareStatement("select * from rto_number_plate");
			rs = pst.executeQuery();
			ArrayList<NumberPlateBean> alist = new ArrayList<NumberPlateBean>();
			while(rs.next()){
				NumberPlateBean npbean = new NumberPlateBean();
				npbean.setNumber(rs.getInt(3));
				npbean.setLetter(rs.getInt(2));
				alist.add(npbean);
				
			}
			return alist;
		}
		
		 //----------UPdate Permanent Status---------//
		  /**
			 *
			 * @author : VRS 
			 * @date   : 15/11/2019
			 * @version: 1.0
			 * @purpose: UPdate Permanent Status
			 * @param  : pbean
			 * @return : alist
			 
			 */
		
		public static boolean updateNumberPlate(NumberPlateBean nplate)throws SQLException{
			con = getDbConnection();
			pst = con.prepareStatement("update rto_number_plate set n_letter=?,n_number=? where n_id=1 ");
			pst.setInt(1,nplate.getLetter());
			System.out.println("11111111111111111111111111111111-:"+nplate.getLetter());
			pst.setInt(2,nplate.getNumber());
			pst.executeUpdate();
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-:"+nplate.getNumber());
			
			return flag;
			
		}
		//-----------Delete Customer---------//
		  /**
		  	 *
		  	 * @author : VRS 
		  	 * @date   : 15/11/2019
		  	 * @version: 1.0
		  	 * @purpose: delete customer
		  	 * @param  : adminBean
		  	 * @return : flag
		  	 
		  	 */
		  public static boolean deleteCustomer(AdminBean adminBean) throws SQLException{
		  	
		  	
		      try{
		          
		          con=getDbConnection();
		      pst=con.prepareStatement("delete from rto_registration where r_username=?");
		      pst.setString(1, adminBean.getUname());
		     pst.executeQuery();
		     pst=con.prepareStatement("delete from rto_login where l_username=?");
		      pst.setString(1, adminBean.getUname());
		     pst.executeQuery();
		     flag=true;
		  } catch(Exception e){
		      e.printStackTrace();
		  }
		  return flag;
		      
		  }
		  
		//-----------Expiry date Remainder by email---------//
		  /**
		  	 *
		  	 * @author : VRS 
		  	 * @date   : 15/11/2019
		  	 * @version: 1.0
		  	 * @purpose: Expiry date Remainder by email
		  	 * @param  : adminBean
		  	 * @return : flag
		  	 
		  	 */
		  public static String getEmailAdress(String un) throws SQLException{
			  con = getDbConnection();
			  pst = con.prepareStatement("select r_email from rto_registration where r_username=?");
			  pst.setString(1, un);
			  rs = pst.executeQuery();
			  String uname="";
			  while(rs.next()){
			  uname = rs.getString(1);
			  }
			  System.out.println("emailer test----------------<><><><><>"+uname);
			  return uname;
			  }


}

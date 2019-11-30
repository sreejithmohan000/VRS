package rtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import rtobeans.RtoBean;
import rtodao.DBDAO;


public class RtoDAO {
	static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs=null;
	  static boolean flag=false;
	  
	//----------get-database-connection---------//
	  /**
		 *
		 * @author : VRS 
		 * @date   : 06/11/2019
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
	 
	  //-----------SignUp user---------//
		  /**
		  	 *
		  	 * @author : VRS 
		  	 * @date   : 06/11/2019
		  	 * @version: 1.0
		  	 * @purpose: signup
		  	 * @param  : rtoBean
		  	 * @return : boolean flag
		  	 */
	    public static boolean signUp(RtoBean rtoBean) throws SQLException{
		      
		      try{
		          
		          con=getDbConnection();
		      pst=con.prepareStatement("insert into rto_registration(r_name,r_gender,r_idproof,r_idproofno,r_mob,r_email,r_username,img,r_address)values(?,?,?,?,?,?,?,?,?)");
		      pst.setString(1, rtoBean.getName()); 
		      pst.setString(2,rtoBean.getGender());
		      pst.setString(3,rtoBean.getIdproof());
		      pst.setString(4,rtoBean.getIdproofno());
		      pst.setString(5,rtoBean.getMob());
		      pst.setString(6,rtoBean.getEmail());
		      pst.setString(7,rtoBean.getUname());
		      pst.setString(8,rtoBean.getImg());
		      pst.setString(9, rtoBean.getAdd());

		      pst.executeUpdate();
		      flag=true;
		  } catch(Exception e){
		      e.printStackTrace();
		  }
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
		  public static ArrayList<RtoBean> checkUname(RtoBean rtoBean) throws SQLException{
		  	
		  	ArrayList<RtoBean> rb=new ArrayList<RtoBean>();
		      try{
		          
		          con=getDbConnection();
		      pst=con.prepareStatement("select l_username from rto_login where l_username=?");
		      pst.setString(1, rtoBean.getUname());
		     rs=pst.executeQuery();
		      while(rs.next()){
		      	 rtoBean=new RtoBean();
		      	rtoBean.setUname(rs.getString(1));
		      	
		      	rb.add(rtoBean);
		      }
		  } catch(Exception e){
		      e.printStackTrace();
		  }
		  return rb;
		      
		  }
		  
		//-----------login insert---------//
		  /**
		  	 *
		  	 * @author : VRS 
		  	 * @date   : 06/11/2019
		  	 * @version: 1.0
		  	 * @purpose: login insert
		  	 * @param  : rtoBean
		  	 * @return : boolean flag
		  	 */
	    public static boolean Login(RtoBean rtoBean) throws SQLException{
		      
		      try{
		          
		          con=getDbConnection();
		      pst=con.prepareStatement("insert into rto_login(l_username,l_password,l_role,r_id)values(?,?,'user',?)");
		      pst.setString(1, rtoBean.getUname()); 
		      pst.setString(2,rtoBean.getUpswd());
		      pst.setInt(3,rtoBean.getId());
		      pst.executeUpdate();
		      flag=true;
		  } catch(Exception e){
		      e.printStackTrace();
		  }
		  return flag;
		      
		  }
	    
	  //-----------Get Id---------//
		  /**
		  	 *
		  	 * @author : VRS 
		  	 * @date   : 06/11/2019
		  	 * @version: 1.0
		  	 * @purpose: get id
		  	 * @param  : rtoBean
		  	 * @return : rs
		  	 
		  	 */
		  public static ResultSet selectId(RtoBean rtoBean) throws SQLException{
		  	
		  	
		      try{
		          
		          con=getDbConnection();
		      pst=con.prepareStatement("select r_id from rto_registration where r_username=?");
		      pst.setString(1, rtoBean.getUname());
		     rs=pst.executeQuery();
		     
		   
		     // while(rs.next()){
		      	 //userBean=new UserBean();
		      	//userBean.setId(rs.getInt(1));
		      	
		      	//ub.add(userBean);
		      //}
		  } catch(Exception e){
		      e.printStackTrace();
		  }
		  return rs;
		      
		  }
		  
		//----------check user role---------//
		  /**
			 *
			 * @author : VRS 
			 * @date   : 07/11/2019
			 * @version: 1.0
			 * @purpose: check role
			 * @param  : uname,pswd
			 * @return : rs
			 
			 */
		    public static ResultSet check(RtoBean rtoBean) throws SQLException{
		    	
		    	
		        try{
		            
		            con=getDbConnection();
		        pst=con.prepareStatement("select * from rto_login where l_username=? and l_password=?");
		        pst.setString(1,rtoBean.getUname());
		        pst.setString(2,rtoBean.getUpswd());
		       rs=pst.executeQuery();
		       
		        
		        
		    } catch(Exception e){
		        e.printStackTrace();
		    }
		    return rs;
		        
		}  
		    //-----------view customer details---------//
		    /**
		     *
		     * @author : VRS
		     * @date   : 12/11/2019
		     * @version: 1.0
		     * @purpose: update Customer details list
		     * @param  : rtoBean
		     * @return : rb
		     
		     */
		    
public static ArrayList<RtoBean> viewCustDetails(RtoBean rtBean) throws SQLException{
		    	
		    	ArrayList<RtoBean> rb=new ArrayList<RtoBean>();
		        try{
		            
		            con=getDbConnection();
		        pst=con.prepareStatement("select r_name,r_mob,r_email,l_password,rto_login.r_id from rto_registration inner join rto_login on rto_registration.r_id=? where rto_login.l_username=?");
		       pst.setInt(1, rtBean.getId());
		       pst.setString(2, rtBean.getUname());
		        rs=pst.executeQuery();
		        while(rs.next()){
		        	RtoBean rtoBean=new RtoBean();
		        	rtoBean.setName(rs.getString(1));
		        	rtoBean.setMob(rs.getString(2));
		        	rtoBean.setEmail(rs.getString(3));
		        	rtoBean.setUpswd(rs.getString(4));
		        	rtoBean.setId(rs.getInt(5));
		        	rb.add(rtoBean);
		        }
		        
		    } catch(Exception e){
		        e.printStackTrace();
		    }
		    return rb;
		        
		    }
		    //-----------update customer details---------//
		    /**
		     *
		     * @author : VRS 
		     * @date   : 12/11/2019
		     * @version: 1.0
		     * @purpose: update Customer details list
		     * @param  : rtoBean
		     * @return : flag
		     
		     */


		    public static boolean updateCustomerDetails(RtoBean rtBean) throws SQLException{
		    	
		    	
		        try{
		            
		            con=getDbConnection();
		        pst=con.prepareStatement("update rto_login set l_password=? where r_id=?");
		      
		       pst.setString(1, rtBean.getUpswd());
		       pst.setInt(2, rtBean.getId());
		        pst.executeUpdate();
		        
		        PreparedStatement ps=con.prepareStatement("update rto_registration set r_name=?,r_mob=?,r_email=? where r_id=?");
		        ps.setString(1, rtBean.getName());
		        ps.setString(2, rtBean.getMob());
		        ps.setString(3, rtBean.getEmail());
			       ps.setInt(4, rtBean.getId());
			       ps.executeUpdate();
			       flag=true;
			       
			        
		    } catch(Exception e){
		        e.printStackTrace();
		    }
		    return flag;
		        
		    }
}

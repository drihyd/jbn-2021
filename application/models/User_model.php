<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class User_model extends CI_Model {
	public $status; 

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function __construct() {

		
		
		parent::__construct();
		$this->load->database();
		
	}
	
	/**
	 * create_user function.
	 * 
	 * @access public
	 * @param mixed $username
	 * @param mixed $email
	 * @param mixed $password
	 * @return bool true on success, false on failure
	 */
	public function create_user($name, $email, $password,$phone) {
		
		$data = array(
			'name'   => $name,
			'email'      => $email,
			'phone'      => $phone,
			'password'   => $this->hash_password($password),
			'date' => date('Y-m-d H:i:s'),
		);
		
		return $this->db->insert('customers', $data);
		
	}
	public function update_user($name,$phone,$customer_email) {
		
		$data = array(
			'name'   => $name,
			'phone'      => $phone,
			'last_update'=> date('Y-m-d H:i:s'),
		);
		$this->db->where('email', $customer_email);		
		$this->db->update('customers', $data);
			
	}

public function _update($data,$where) {
		$this->db->where($where);		
		$this->db->update('customers', $data);
			
	}
	public function _reset_password($password,$customer_email) {
		
		$data = array(
			'password'   => $this->hash_password($password),
			'last_update'=> date('Y-m-d H:i:s'),
		);
		$this->db->where('email', $customer_email);		
		$this->db->update('customers', $data);
			
	}
	
	/**
	 * resolve_user_login function.
	 * 
	 * @access public
	 * @param mixed $username
	 * @param mixed $password
	 * @return bool true on success, false on failure
	 */
	public function resolve_user_login($username, $password) {
		
		$this->db->select('password');
		$this->db->from('customers');
		$this->db->where('email', $username);
		$hash = $this->db->get()->row('password');
		
		return $this->verify_password_hash($password, $hash);
		
	}
	
	/**
	 * get_user_id_from_username function.
	 * 
	 * @access public
	 * @param mixed $username
	 * @return int the user id
	 */
	public function get_user_id_from_username($username) {
		
		$this->db->select('id');
		$this->db->from('customers');
		$this->db->where('email', $username);
		return $this->db->get()->row('id');
		
	}
	
	/**
	 * get_user function.
	 * 
	 * @access public
	 * @param mixed $user_id
	 * @return object the user object
	 */
	public function get_user($user_id) {
		
	
		$this->db->where('id', $user_id);
		$result = $this->db->get_where('customers');
		if ($result->num_rows() >0) {

			return  $result->num_rows() >1 ? $result->result(): $result->row();
		}else{
			return  false;	
		}	
	/*	return $this->db->get()->row();*/
		
	}
	
	/**
	 * hash_password function.
	 * 
	 * @access private
	 * @param mixed $password
	 * @return string|bool could be a string on success, or bool false on failure
	 */
	public function hash_password($password) {
		
		return password_hash($password, PASSWORD_BCRYPT);
		
	}
	
	/**
	 * verify_password_hash function.
	 * 
	 * @access private
	 * @param mixed $password
	 * @param mixed $hash
	 * @return bool
	 */
	public function verify_password_hash($password, $hash) {
		
		return password_verify($password, $hash);
		
	}
	public function isDuplicate($email)
    {     
        $this->db->get_where('users', array('UserEmail' => $email), 1);
        return $this->db->affected_rows() > 0 ? TRUE : FALSE;         
    }
    public function checkLogin($post)
    {
        // $this->load->library('password');       
        $this->db->select('*');
        $this->db->where('UserEmail', $post['UserEmail']);
        $query = $this->db->get('users');
        $userInfo = $query->row();
        
        if(!$this->password->validate_password($post['UserPassword'], $userInfo->UserPassword)){
            // error_log('Unsuccessful login attempt('.$post['email'].')');
            return false; 
        }
        
        // $this->updateLoginTime($userInfo->UserID);
        // unset($userInfo->UserPassword);
        return $userInfo; 
    }
    // public function updateLoginTime($id)
    // {
    //     $this->db->where('UserID', $id);
    //     $this->db->update('users', array('UserLastLoginIP' => date('Y-m-d h:i:s A')));
    //     return;
    // }
	function validate($Email,$Password){
	    $this->db->where('UserEmail',$Email);
	    $this->db->where('UserPassword',$Password);
	    $result = $this->db->get('users');
	    return $result;	
 	 }

 	 public function is_newsletter_Duplicate($email)
    {     
        $this->db->get_where('newsletter', array('email' => $email));
        return $this->db->affected_rows() > 0 ? TRUE : FALSE;         
    }
    public function getUserInfoByEmail($email)
    {
        $q = $this->db->get_where('users', array('UserEmail' => $email), 1);  
        if($this->db->affected_rows() > 0){
            $row = $q->row();
            return $row;
        }else{
            error_log('no user found getUserInfo('.$email.')');
            return false;
        }
    }
	public function insertToken($user_id)
    {   
        $token = substr(sha1(rand()), 0, 30); 
        $date = date('Y-m-d');
        
        $string = array(
                'token'=> $token,
                'User_ID'=>$user_id,
                'created'=>$date
            );
        $query = $this->db->insert_string('tokens',$string);
        $this->db->query($query);
        return $token . $user_id;
        
    }
    
    public function isTokenValid($token)
    {
       $tkn = substr($token,0,30);
       $uid = substr($token,30);      
       
        $q = $this->db->get_where('tokens', array(
            'tokens.token' => $tkn, 
            'tokens.User_ID' => $uid), 1);                         
               
        if($this->db->affected_rows() > 0){
            $row = $q->row();             
            
            $created = $row->created;
            $createdTS = strtotime($created);
            $today = date('Y-m-d'); 
            $todayTS = strtotime($today);
            
            if($createdTS != $todayTS){
                return false;
            }
            
            $user_info = $this->getUserInfo($row->User_ID);
            return $user_info;
            
        }else{
            return false;
        }
        
    }
    public function getUserInfo($id)
    {
        $q = $this->db->get_where('users', array('UserID' => $id), 1);  
        if($this->db->affected_rows() > 0){
            $row = $q->row();
            // echo '<pre>'; print_r($row); exit();
            return $row;
        }else{
            error_log('no user found getUserInfo('.$id.')');
            return false;
        }
    }
    public function updatepassword($post)
    {   
        $this->db->where('UserID', $post['UserID']);
        $this->db->update('users', array('UserPassword' => $post['password'])); 
        $success = $this->db->affected_rows(); 
        
        if(!$success){
            error_log('Unable to update password('.$post['UserID'].')');
            return false;
        }        
        return true;
    } 
}

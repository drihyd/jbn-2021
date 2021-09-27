<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('login_model');
    }
    public function index(){

    	$data['page_title'] = 'Login';
        $data['page'] = 'pages/login';

        $this->load->view('manage-template', $data);
    }
    function auth(){
    	$this->form_validation->set_rules('Email','Email','trim|required');
        $this->form_validation->set_rules('Password','Password','trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Login';
        	$data['page'] = 'pages/login';
        	$this->load->view('manage-template', $data);
        }else{

			$Email    = $this->input->post('Email',TRUE);
			$Password = md5($this->input->post('Password',TRUE));
			$validate = $this->login_model->validate($Email,$Password);
			if($validate->num_rows() > 0){
			    $data  = $validate->row_array();
			    $Email  = $data['Email'];
                $AdminID  = $data['AdminID'];
			    $FirstName = $data['FirstName'];
			    $LastName = $data['LastName'];
                $Address = $data['Address'];
                $RoleID = $data['RoleID'];
                $Status = $data['Status'];
                $Phone = $data['Phone'];
                $profile_pic_path = $data['profile_pic_path'];

			    $sesdata = array(
			        'FirstName'=> $FirstName,
                    'LastName'=> $LastName,
                    'EmailVerified'=> 1,
                    'Phone'=> $Phone,
                    'Address'=> $Address,
                    'RoleID'=> $RoleID,
                    'Status'=> $Status,
			        'Email'=> $Email,
                    'userid'=> $AdminID,
                    'profile_pic_path'=> $profile_pic_path,
			        'logged_in'=> TRUE
			    );
			    $this->session->set_userdata($sesdata);
                $Email =$this->session->userdata('Email');
                $auth['LastLogin'] =  date('Y-m-d H:i:s');
                $auth['ip'] =  $this->input->ip_address();
                $this->core->update('admin_user',$auth,array("Email"=>$Email));
			    redirect('dashboard');

			}else{
			    $this->session->set_flashdata('msg','Username or Password is Wrong');
			    redirect('login');
			}
		}
	}
 
  	public function logout(){
      	$this->session->sess_destroy();
      	$this->session->set_flashdata('msg','successfully Loggedout..!');
      	redirect('login');
  	}

   public function changepassword($AdminID=NULL)
    {
    	$userid=$this->session->userdata('userid');
    	$Admin_user = $this->core->get('admin_user',$userid);
        $this->admin_user=$this->core->get('admin_user',array('Email'=>$_SESSION['Email']))[0];

    	$data['page_title'] = 'Change password';
    	$data['page'] = 'pages/change_password';
    	$this->form_validation->set_rules('old_password','Old password','trim|required|max_length[20]');
        $this->form_validation->set_rules('new_password','New password','required|max_length[20]');
        $this->form_validation->set_rules('re_new_password','Confirm new password','required|matches[new_password]|max_length[20]');
        if($this->form_validation->run() == false) {
            $data['page'] = 'pages/change_password';
            $this->load->view('manage-template', $data);
        }
        else {

           $userid=$this->session->userdata('userid');
        	$Admin_user = $this->core->get('admin_user',array("AdminID",$userid));

            $oldpass =$this->input->post('old_password');           
            $Existing_Password=$Admin_user[0]->Password;              
                
               if($Existing_Password != md5($oldpass)) {

                    $this->form_validation->set_message('password_check', 'The {field} does not match');
                    $this->session->set_flashdata('error', 'Password updation failed');
                    redirect('login/changepassword');
                    
                }else{
                    
                    $AdminID = $userid;
                    $newpass = $this->input->post('new_password');
                    $this->core->update('admin_user', array('Password' => md5($newpass)),array("AdminID",$AdminID));
                    $this->session->set_flashdata('success_changepassowrd', 'Password successfully changed.');   
                    redirect('login');
                }
			$this->load->view('manage-template', $data);
        }	
    }
    public function profile()
    {   
        $data['page_title'] = 'Profile';
        $userid=$this->session->userdata('userid');
        $data['profileinfo']=$this->core->get('admin_user',$userid);
        echo '<pre>'; print_r($data); exit();
        $this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required');
        $this->form_validation->set_rules('LastName', 'LastName', 'trim|required');
        $this->form_validation->set_rules('Phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('Address', 'Address', 'trim|required');
            
        $this->form_validation->set_error_delimiters('<div class="error">', '</div>');

        if ($this->form_validation->run() === FALSE) {
            $data['page'] = 'pages/profile_view';
            $this->load->view('student-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());

            $profile_data = array();

            $profile_data['FirstName']  = $post_fields['FirstName'];
            $profile_data['LastName']       = $post_fields['LastName'];
            $profile_data['Phone']    = $post_fields['Phone'];
            $profile_data['Address']   = $post_fields['Address'];

            // $where = array('user_id'=>$this->user_id);

            if ($addresses_id = $this->parent->get_address_id($this->user_id)) {

                $add_where = array('id'=>$addresses_id);
                if(!$this->core->update('addresses', $add_data, $add_where)) {
                    $this->session->set_flashdata('address_update', 'Address updation failed');
                }
            }else{
                // $add_data['user_id'] = $this->user_id;
                if($addresses_id = $this->core->insert('addresses', $add_data)) {
                    $parent_data['addresses_id'] = $addresses_id;
                }else{
                    $this->session->set_flashdata('address_update', 'Address updation failed');
                }
            }

            $user_data['fath_fname'] = $post_fields['fath_fname'];
            $user_data['fath_lname'] = $post_fields['fath_lname'];
            $user_data['moth_fname'] = $post_fields['moth_fname'];
            $user_data['moth_lname'] = $post_fields['moth_lname'];

            $where = array('user_id', $this->user_id);
              
            if(!$this->core->update('users', $user_data, array('id'=>$this->user_id))){
                $this->session->flashdata('error', 'User information updation failed');
            }

            $parent_data['email']       = $post_fields['email'];
            $parent_data['mobile']      = $post_fields['mobile'];
            $parent_data['alt_mobile']  = $post_fields['alt_mobile'];
            $parent_data['occupation']  = $post_fields['occupation'];

            $where = array('user_id'=> $this->user_id);
            // echo '<pre>'; print_r($where); exit();
            if ($this->core->get('parent', $where)) {
                if(!$this->core->update('parent', $parent_data, array('user_id'=>$this->user_id))) {
                    $this->session->set_flashdata('parent_update', 'Parent updation failed');
                }
            }else{
                // $add_data['user_id'] = $this->user_id;
                $parent_data['user_id'] = $this->user_id;
                $parent_data['addresses_id'] = $addresses_id;
                if($this->core->insert('parent', $parent_data)) {
                    $this->session->set_flashdata('address_update', 'Address updation failed');
                }
            }
            redirect(base_url('student/educationalDetails'));
            $this->load->view('student-template', $data);
        }
    }
}
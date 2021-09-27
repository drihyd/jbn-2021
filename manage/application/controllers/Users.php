<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends MY_Controller {

    function __construct(){
        parent::__construct(); 
        $this->load->model('Core_model','core');
        $this->load->model('User_model','user');
        $this->users = $this->core->get('role',array('RoleID!='=>1));

       
    }
    public function index(){

        $data['page_title'] = 'Users';
        $data['page'] = 'users/users_list';
        // $data['userinfo']=$this->core->get('admin_user',array('RoleID!='=>1));
        $data['userinfo'] = $this->user->_Listing();
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function view($AdminID=NULL) {
        $data['page_title'] = 'View User';
        $data['page'] = 'users/view_user';
        $data['userinfo'] = $this->core->get("admin_user", array('AdminID'=>$AdminID))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function add() {

       $data['userinfo']=$this->core->get('admin_user',array('RoleID!='=>1));

        $this->form_validation->set_rules('Email', 'Email', 'required|trim|xss_clean');
        $this->form_validation->set_rules('Password', 'Password', 'trim|required');
        $this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|xss_clean');
        $this->form_validation->set_rules('Phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('RoleID', 'Role', 'trim|required');

        
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/users.js';
            $data['page_title'] = 'Add Category';
            $data['page'] = 'users/add_user';
            
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $user_data = array();

            $user_data['Email']     = $post_fields['Email'];
            $user_data['Password'] = md5($post_fields['Password']);
            $user_data['FirstName']     = $post_fields['FirstName'];
            $user_data['LastName']     = $post_fields['LastName'];
            $user_data['Phone']         = $post_fields['Phone'];
            $user_data['Address']   = $post_fields['Address'];
            $user_data['RoleID']      = $post_fields['RoleID'];
            

            if ($this->core->insert('admin_user',$user_data)) {
                $this->session->set_flashdata('success', 'User added successfully');
                redirect('users');
            }else{
                $this->session->set_flashdata('error', 'User inserted failed');
                redirect('users/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    // public function edit($AdminID = NULL) {
    //     $data['include_js'][] = '/assets/js/users.js';
    //     $data['page_title'] = 'Edit User';
    //     $data['page'] = 'users/edit_user';
    //     $data['userinfo'] = $this->core->get("admin_user", array('AdminID'=>$AdminID))[0];
    //     // echo '<pre>'; print_r($data); exit();
    //     $this->load->view('manage-template', $data);
    // }
    public function edit($id = NULL)
    {

        $AdminID = $this->input->post('AdminID');
        $this->form_validation->set_rules('Email', 'Email', 'required|trim|xss_clean');
        $this->form_validation->set_rules('Password', 'Password', 'trim|required');
        $this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|xss_clean');
        $this->form_validation->set_rules('Phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('RoleID', 'RoleID', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['include_js'][] = '/assets/js/users.js';
            $data['page_title'] = 'Edit User';
            $data['page'] = 'users/edit_user';
            $data['userinfo'] = $this->core->get("admin_user", array('AdminID'=>$id))[0];
        // echo '<pre>'; print_r($data); exit();
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            
            $user_data = array();

            $user_data['Email']         = $post_fields['Email'];
            $user_data['Password']      = md5($post_fields['Password']);
            $user_data['FirstName']     = $post_fields['FirstName'];
            $user_data['LastName']      = $post_fields['LastName'];
            $user_data['Phone']         = $post_fields['Phone'];
            $user_data['Address']       = $post_fields['Address'];
            $user_data['RoleID']          = $post_fields['RoleID'];
            
        }
            if ($this->core->update('admin_user',$user_data,array('AdminID'=>$AdminID))) {
                $this->session->set_flashdata('success', 'User updated successfully');
                redirect('users');
            }else{
                $this->session->set_flashdata('error', 'User updation failed');
               redirect('users/edit/'.$AdminID);
            }
        $this->load->view('manage-template', $data);
    }
    public function delete($AdminID=NULL)
    {
        $result = $this->core->delete("admin_user", array('AdminID'=>$AdminID));
        if($result)
        {
            $this->session->set_flashdata('success', 'User deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'User deletion failed');
        }
    
    redirect('users'); 
    }

    public function profile($AdminID=NULL) {
        $data['page_title'] = 'Profile';
        $data['page'] = 'pages/view_profile';
        $userid=$this->session->userdata('userid');
        $data['profileinfo'] = $this->core->get('admin_user',array('AdminID'=>$userid))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function edit_profile($userid=NULL) {
        $data['page_title'] = 'Edit Profile';
        $data['page'] = 'pages/edit_profile';
        $userid=$this->session->userdata('userid');
        $data['profileinfo'] = $this->core->get('admin_user',array('AdminID'=>$userid))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->form_validation->set_rules('Email', 'Email', 'required|trim|xss_clean');
        $this->form_validation->set_rules('FirstName', 'FirstName', 'trim|required|xss_clean');
        $this->form_validation->set_rules('Phone', 'Phone', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Profile';
            $data['page'] = 'pages/edit_profile';
            $this->load->view('manage-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            // $path = '../uploads';
            // $config['upload_path'] = $path;
            // $config['allowed_types'] = 'jpg|png|jpeg|gif';
            // $config['remove_spaces'] = TRUE;
            // $config['overwrite'] = TRUE;
            // $config['file_name'] = $post_fields['profile_pic_path'];
            // $this->load->library('upload', $config);
            // $this->upload->initialize($config);   
                   
            $profile_data = array();

            $profile_data['Email'] = $post_fields['Email'];   
            $profile_data['FirstName'] = $post_fields['FirstName'];
            $profile_data['LastName'] = $post_fields['LastName'];
            $profile_data['Phone'] = $post_fields['Phone'];
            $profile_data['Address'] = $post_fields['Address'];
            if (isset($_FILES['profile_pic_path']['name'])) { 
                $path = '../uploads';
                $config['upload_path'] = $path;
                $config['allowed_types'] = 'jpg|png|jpeg|gif';
                $config['remove_spaces'] = TRUE;
                $this->load->library('upload', $config);
                $this->upload->initialize($config);   
                if (!$this->upload->do_upload('profile_pic_path')) {
                $error = array('error' => $this->upload->display_errors());
                } else {
                $upload_data = array('upload_data' => $this->upload->data());
                $import_file = $upload_data['upload_data']['file_name'];
                $inputFileName = $path .'/'. $import_file;              
                $profile_data['profile_pic_path'] = $inputFileName;
                //unlink('./product_images/'.$products[0]->Thumbnail);
                }
            }
           
            
             if ($this->core->update('admin_user',$profile_data, array('AdminID'=>$userid))) {
                $this->session->set_flashdata('success', 'Profile updated successfully');
                redirect('users/profile');
            }else{
                $this->session->set_flashdata('error', 'Profile updation failed');
               // redirect('users/edit/'.$userid);
            }
        }
           
        $this->load->view('manage-template', $data);
    }
}
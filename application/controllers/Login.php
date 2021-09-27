<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {
    function __construct(){
        parent::__construct(); 
        // $this->status =$this->config->item('UserEmailVerified');       
    }
   function index()
    {
        if(isset($_SESSION['anaya_user_data']) && $_SESSION['anaya_user_data'] != '') {
        redirect('home');
        }
        else {
        }
        $this->auth();
    }
    public function auth(){
        $this->form_validation->set_rules('UserEmail','Email','trim|required|valid_email');
        $this->form_validation->set_rules('UserPassword','Password','trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
            $data['page_title'] = 'Login';
            $data['login_form'] = $this->load->view('layouts/login',"",true);
            $data['page'] = 'login';
            $this->load->view('anaya-template', $data);
        }else{

            $Email    = $this->input->post('UserEmail',TRUE);
            $Password = md5($this->input->post('UserPassword',TRUE));
            $validate = $this->user->validate($Email,$Password);
            if($validate->num_rows() > 0){
                $data  = $validate->row_array();
                $Email  = $data['UserEmail'];
                

                $sesdata = array(     
                    'UserEmailVerified'=> 1,
                    'UserEmail'=> $Email,
                    'logged_in'=> TRUE
                );
                //$this->session->set_userdata($sesdata);
               // $Email =$this->session->userdata('UserEmail');
                $auth['UserLastLoginDate'] =  date('Y-m-d H:i:s');
                $auth['UserLastLoginIP'] =  $this->input->ip_address();
                $this->core->update('users',$auth,array("UserEmail"=>$Email));

                    $where = array('UserEmail'=>$Email);
                    if ($userdata = $this->core->get('users', $where)) {
                        session_login($userdata);
                        $this->session->set_flashdata('success', 'You have successfully logged in.');
                       redirect('home');
                    }
                    else
                    {
                        $this->session->set_flashdata('error','Oops something went wrong');
                        redirect('login');
                    }
               
            }else{
                $this->session->set_flashdata('error','Username or Password is Wrong');
                redirect('login');
            }
        }
    }
    public function register(){

        if(isset($_SESSION['anaya_user_data']) && $_SESSION['anaya_user_data'] != '') {
             redirect('home');
        }
        else {
        }
        $this->form_validation->set_rules('UserEmail', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('UserPassword','New password','required|max_length[20]');
        $this->form_validation->set_rules('confirm_password','Confirm new password','required|matches[UserPassword]|max_length[20]');
        $this->form_validation->set_rules('UserGender','Gender','required');
        $this->form_validation->set_rules('UserPhone', 'Mobile Number ', 'required|regex_match[/^[0-9]{10}$/]'); //{10} for 10 digits number
                       
            if ($this->form_validation->run() == FALSE) {   
                $data['page'] = 'user_register';
                $data['page_title'] = 'Home | Anaya Jewellery';
                $data['login_form'] = $this->load->view('layouts/login',"",true);
                $this->load->view('anaya-template', $data);  
            }else{
                if($this->user->isDuplicate($this->input->post('UserEmail'))){
                    // $this->session->set_flashdata('flash_message', 'User email already exists');
                    $this->session->set_flashdata('error', 'User email already exists.');
                    redirect(site_url().'login/register');
                }
                else{ 
                    $post_fields = $this->security->xss_clean($this->input->post());
                    $user_data = array();
                    $user_data['UserFirstName']     = $post_fields['UserFirstName'];
                    $user_data['UserEmail']     = $post_fields['UserEmail'];
                    $user_data['UserPassword']     = md5($post_fields['UserPassword']);
                    $user_data['UserGender']     = $post_fields['UserGender'];
                    $user_data['UserPhone']     = $post_fields['UserPhone'];

                    $user_data['UserIP']=$this->input->ip_address();
                    if ($this->core->insert('users',$user_data)){
                        //$this->session->set_flashdata('success', 'Your Email Registered successfully please login to continue');
                        $this->session->set_flashdata('success', 'You have successfully registered');
                        $where_condition = array('UserEmail'=>$post_fields['UserEmail']);
                         if($userdata = $this->core->get('users', $where_condition)){
                           session_login($userdata);  


                        /*Registration mail*/
                        $email_variables=array(
                            "dear_name"=>$post_fields['UserFirstName'],
                        );
                        $reg_mail_body = $this->load->view('email_templates/registration',$email_variables,true);
                        $mail_params=array(
                            "to_address"=>$post_fields['UserEmail'],
                            "to_name"=>$post_fields['UserFirstName'],
                            "subject"=>"Welcome Mail",
                            "body_message"=>$reg_mail_body,
                        );
                        $this->send_registration_mail($mail_params);                        
                        /*End*/
                        }
                        else{
                        }
                        redirect('login');
                    }else{
                        $this->session->set_flashdata('error', 'Registration failed');
                        redirect('login/register');
                    }
                }
                $this->load->view('anaya-template', $data);
            }
        }
    // public function forgot_password(){
    //     $data['page'] = 'reset_password';
    //     $data['page_title'] = 'Home | Anaya Jewellery';
    //     $this->load->view('anaya-template', $data);
    // }
    public function forgot_password()
        {
            $this->form_validation->set_rules('UserEmail', 'Email', 'required|valid_email'); 
            if($this->form_validation->run() == FALSE) {
                $data['page'] = 'reset_password';
                $data['page_title'] = 'Home | Anaya Jewellery';    
            }else{
                $data['page'] = 'reset_password';
                $data['page_title'] = 'Home | Anaya Jewellery';
                $email = $this->input->post('UserEmail');  
                $clean = $this->security->xss_clean($email);
                $userInfo = $this->user->getUserInfoByEmail($clean); 

                // echo '<pre>'; print_r($userInfo); exit();
                if(!$userInfo){
                    $this->session->set_flashdata('error', 'We cant find your email address');
                    redirect(site_url().'login/forgot_password');
                }   
                if($userInfo->UserEmailVerified != 1){ //if status is not approved
                    $this->session->set_flashdata('error', 'Your account is not in approved status');
                    redirect(site_url().'login/forgot_password');
                }
                //build token 
                $token = $this->user->insertToken($userInfo->UserID);
                if ($token) {
                    $this->session->set_flashdata('success', 'Reset password link sent to mail successfully');
                    $qstring = $this->base64url_encode($token);                  
                    $url = site_url() . 'login/reset_password/token/' . $qstring;
                    $link = '<a href="' . $url . '">' . $url . '</a>'; 
                    $message = '';                     
                    $message .= '<strong>A password reset has been requested for this email account</strong><br>';
                    $message .= '<strong>Please click:</strong> ' . $link;

                    echo '<pre>'; print_r($message); exit();

                    /*Forgot_Password mail*/
                        // $email_variables=array(
                        //     "dear_name"=>$userInfo->UserFirstName,
                        // );
                        // $reg_mail_body = $this->load->view('email_templates/registration',$email_variables,true);
                        // $mail_params=array(
                        //     "to_address"=>$email,
                        //     "to_name"=>$userInfo->UserFirstName,
                        //     "subject"=>"Welcome Mail",
                        //     "body_message"=>$reg_mail_body,
                        //     "message"=>$message,
                        // );
                        // $this->send_forgot_mail($mail_params);                        
                        /*End*/
                }else{
                    $this->session->set_flashdata('error', 'Failed to send');
                    redirect(site_url().'login/forgot_password');

                }            
            }
          $this->load->view('anaya-template', $data);  
        }
    // public function reset_password(){
    //     $data['page'] = 'reset_password';
    //     $data['page_title'] = 'Home | Anaya Jewellary';
    //     $this->load->view('anaya-template', $data);
    // }
    public function reset_password()
        {
            $token = $this->base64url_decode($this->uri->segment(4));                  
            $cleanToken = $this->security->xss_clean($token);
            $user_info = $this->user->isTokenValid($cleanToken); //either false or array();    

            // echo '<pre>'; print_r($user_info); exit();           
            if(!$user_info){
                $this->session->set_flashdata('error', 'Token is invalid or expired');
                redirect(site_url().'login');
            }            
            $data = array(
                'firstName'=> $user_info->UserFirstName, 
                'email'=>$user_info->UserEmail, 
               'UserID'=>$user_info->UserID, 
                'token'=>$this->base64url_encode($token)
            );
            // echo '<pre>'; print_r($data); exit();
            $this->form_validation->set_rules('password', 'Password', 'required|min_length[5]');
            $this->form_validation->set_rules('passconf', 'Password Confirmation', 'required|matches[password]');              
            if ($this->form_validation->run() == FALSE) {   
                $data['page'] = 'reset_confirm_password';
                $data['page_title'] = 'Home | Anaya Jewellary';
                // $this->load->view('anaya-template', $data);
            }else{                   
                // $this->load->library('password');                 
                $post = $this->input->post(NULL, TRUE);                
                $cleanPost = $this->security->xss_clean($post);                
                $md5 = md5($cleanPost['password']);                
                $cleanPost['password'] = $md5;
                $cleanPost['UserID'] = $user_info->UserID;
                unset($cleanPost['passconf']);                
                if(!$this->user->updatepassword($cleanPost)){
                    $this->session->set_flashdata('error', 'There was a problem updating your password');
                }else{
                    $this->session->set_flashdata('success', 'Your password has been updated. You may now login');
                }
                redirect(site_url().'login');                
            }
            $this->load->view('anaya-template', $data);
        }
    public function base64url_encode($data) { 
      return rtrim(strtr(base64_encode($data), '+/', '-_'), '='); 
    } 
    public function base64url_decode($data) { 
      return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT)); 
    }
    public function logout(){      
        session_destroy();  
        $this->session->set_flashdata('success', 'Successfully Loggedout..!');
        // $this->session->set_flashdata('msg','successfully Loggedout..!');
        redirect(site_url());
    }


public function send_registration_mail($params){
        if($params['to_address']) {
            send_smtp($params['to_address'],$params['to_name'],$params['subject'],$params['body_message']);
        }
    }
    public function send_forgot_mail($params){
        if($params['to_address']) {
            send_smtp($params['to_address'],$params['to_name'],$params['subject'],$params['body_message'],$params['message']);
        }
    }
}
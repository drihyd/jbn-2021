<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Newsletter extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->helper('string'); 
    }

    public function subscribe()
    {

$email=$this->input->post('email');

if($email){

            if($this->user->is_newsletter_Duplicate($email)){
                echo json_encode(array('code'=>103,'error_msg'=>'User email already exists.'));               
            }
            else{ 

                $newletter_data = array();
                $newletter_data['email']=$email;                
                if ($this->core->insert('newsletter',$newletter_data)) {
                    
                    
                         echo json_encode(array('code'=>200,'error_msg'=>'You have been subscribed. Thank you'));
                         /*Newletter is success mail*/
                                $view_file_params=array(
                                "dear_name"=>'Jayaraju',
                                
                                );
                                $payment_mail_body = $this->load->view('email_templates/newsletter_success',$view_file_params,true);
                                $mail_params=array(
                                "to_address"=>$email,
                                "to_name"=>'Jayaraju',
                                "subject"=>"News Letter",
                                "body_message"=>$payment_mail_body,
                                );
                                $this->send_mail_notification($mail_params);
                }else{
                    echo json_encode(array('code'=>103,'error_msg'=>'Subscription failed'));   
                }
            }
        }
        else
        {
           echo json_encode(array('code'=>103,'error_msg'=>'Something went wrong.'));   
        }        
        exit();
    }
    public function unsubscribe($email=NULL)
    {
        
        $data['newletter']=$this->core->get('newsletter',array('email'=>$email));
        echo '<pre>'; print_r($data); exit();
        $newletter_data = array();
        $newletter_data['status']     = 0;
        
        if ($this->core->update('newsletter',$newletter_data)) {
            $this->session->set_flashdata('newletter_success', 'You have been UnSubscribed Thank you..!');
            redirect(site_url());
        }else{
            $this->session->set_flashdata('newletter_error', 'UnSubscribed failed..!');
            redirect(site_url());
        }
    }
    public function send_mail_notification($params){
        if($params['to_address']) {
            send_smtp($params['to_address'],$params['to_name'],$params['subject'],$params['body_message']);
        }
    }
    public function subscribe_test()
    {

$email=$this->input->post('email');

if($email){

            if($this->user->is_newsletter_Duplicate($email)){
              $res =  'User email already exists.'; 
              die($res);              
            }
            else{ 

                $newletter_data = array();
                $newletter_data['email']=$email;                
                if ($this->core->insert('newsletter',$newletter_data)) {

                    /*Newletter is success mail*/
                                $view_file_params=array(
                                "dear_name"=>'Jayaraju',
                                
                                );
                                $payment_mail_body = $this->load->view('email_templates/newsletter_success',$view_file_params,true);
                                $mail_params=array(
                                "to_address"=>$email,
                                "to_name"=>'Jayaraju',
                                "subject"=>"News Letter",
                                "body_message"=>$payment_mail_body,
                                );
                                $this->send_mail_notification($mail_params);
                    
                      $res = 'You have been subscribed. Thank you';
                      die($res);

                }else{
                   $res ='Subscription failed'; 
                   die($res);  
                }
            }
        }
        else
        {
            $res = 'Something went worng.';
            die($res);  
        }        
        
        
    }

}


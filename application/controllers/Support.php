<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Support extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Mail','mail',TRUE);
        

    }

    public function index()
    {


        //send($mailContent=false,$toaddress=false,$toname=false);
       

        

        // echo $mesg = $this->load->view('email_templates/registration',$data,true);

        // $this->mail->send($mesg,"jayaraju@deepredink.com","Jayaraju");


        // die();
        $this->form_validation->set_rules('issue_type', 'Issue', 'trim|required');
        $this->form_validation->set_rules('name', 'Name', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('comments', 'Comments', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page'] = 'support';
            $data['page_title'] = 'Support | Anaya Jewellery';
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $support_data = array();
            $support_data['issue_type']     = $post_fields['issue_type'];
            $support_data['name']           = $post_fields['name'];
            $support_data['email']          = $post_fields['email'];
            $support_data['phone']          = $post_fields['phone'];
            $support_data['comments']       = $post_fields['comments'];

            if ($this->core->insert('support',$support_data)) {

                $data=array('name'=>$post_fields['name'],'email'=>$post_fields['email']);
                $mesg = $this->load->view('email_templates/registration',$data,true);
                //$this->mail->send($mesg,$post_fields['email'],$post_fields['name']);

          

                $this->session->set_flashdata('success', 'Your Request successfully submitted');
                redirect('support');
            }else{
                $this->session->set_flashdata('error', 'Request submission failed');
                redirect('support');
            }
        }
        $this->load->view('anaya-template', $data);
    }
   

}


<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_us extends MY_Controller {

    function __construct(){
        parent::__construct();
        

    }

    public function index()
    {

        $this->form_validation->set_rules('name', 'Name', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
        $this->form_validation->set_rules('subject', 'Subject', 'trim|required');
        $this->form_validation->set_rules('comments', 'Comments', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['page'] = 'contact_us';
            $data['page_title'] = 'Contact Us | Anaya Jewellery';
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $contact_data = array();
            $contact_data['name']           = $post_fields['name'];
            $contact_data['email']          = $post_fields['email'];
            $contact_data['phone']          = $post_fields['phone'];
            $contact_data['subject']        = $post_fields['subject'];
            $contact_data['comments']       = $post_fields['comments'];
            $contact_data['appointment_type']       = $post_fields['appointment_type'];

            if ($this->core->insert('contact_us',$contact_data)) {
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


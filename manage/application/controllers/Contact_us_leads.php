<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_us_leads extends MY_Controller {

    function __construct(){
        parent::__construct();
        

    }
    public function index(){

        $data['page'] = 'leads/contact_us_leads_list';
        $data['page_title'] = 'Contact Us Leads';
        $data['contact_us_leads']=$this->core->get('contact_us');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }

    public function delete($id=NULL)
    {
        $result = $this->core->delete("contact_us", array('id'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Contact us Lead deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Contact us Lead deletion failed');
        }
    
    redirect('contact_us_leads'); 
    }
}
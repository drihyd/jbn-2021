<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Newsletter_leads extends MY_Controller {

    function __construct(){
        parent::__construct();
        

    }
    public function index(){

        $data['page'] = 'leads/newsletter_leads_list';
        $data['page_title'] = 'Newsletter Leads';
        $data['newsletter_leads']=$this->core->get('newsletter');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }

    public function delete($id=NULL)
    {
        $result = $this->core->delete("newsletter", array('id'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Newsletter Lead deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Newsletter Lead deletion failed');
        }
    
    redirect('newsletter_leads'); 
    }
}
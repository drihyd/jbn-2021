<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Support_leads extends MY_Controller {

    function __construct(){
        parent::__construct();
        
        $this->status = $this->core->get_enum_values('support','status');

        // echo '<pre>'; print_r($this->status); exit();

    }
    public function index(){

        $data['page'] = 'leads/support_leads_list';
        $data['page_title'] = 'Support Leads';
        $data['support_leads']=$this->core->get('support');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function view($id=NULL){
        $data['page'] = 'leads/support_leads_reply';
        $data['page_title'] = 'view';
        $data['support_leads']=$this->core->get('support',array('id'=>$id))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }

    public function submit()
    {
        $support_lead_id = $this->input->post('support_lead_id');
        $this->form_validation->set_rules('reply', 'Reply', 'trim|required');
        
        if ($this->form_validation->run() === FALSE) {
            $data['page'] = 'leads/support_leads_reply';
            $data['page_title'] = 'view';
            $data['support_leads']=$this->core->get('support',array('id'=>$id))[0];
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $support_data = array();
            $support_data['reply']      = $post_fields['reply'];
            $support_data['reply_date'] = date('Y-m-d H:i:s');
            $support_data['status'] = $post_fields['status'];;
            
            if ($this->core->update('support',$support_data,array('id'=>$support_lead_id))) {
                $this->session->set_flashdata('success', 'Your Reply successfully submitted');
                redirect('support_leads');
            }else{
                $this->session->set_flashdata('error', 'Reply submission failed');
                redirect('support_leads/view');
            }
        }
        $this->load->view('manage-template', $data);
    }

    public function delete($id=NULL)
    {
        $result = $this->core->delete("support", array('id'=>$id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Support Lead deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Support Lead deletion failed');
        }
    
    redirect('support_leads'); 
    }
}


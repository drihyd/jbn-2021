<?php


class BannersController extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('banners');
        $this->load->library('session');
    }
    /*
    function for manage Banners.
    return all Bannerss.
    created by your name
    created at 20-08-20.
    */
    public function manageBanners() { 	
		$data['page_title'] = 'Manage Banners';
        $data['page'] = 'banners/manage-banners';	
		$data["bannerss"] = $this->banners->getAll();	
		$this->load->view('manage-template', $data);	
        //$this->load->view('products/manage-products', $data);
	
    }
    /*
    function for  add Banners get
    created by your name
    created at 20-08-20.
    */
    public function addBanners() {
        $data['include_js'][] = '/assets/js/banners.js';		
		$data['page_title'] = 'Add Banner';
        $data['page'] = 'banners/add-banners';		
		$this->load->view('manage-template', $data);
    }
    /*
    function for add Banners post
    created by your name
    created at 20-08-20.
    */
    public function addBannersPost() {
		
        $data['Heading_One'] = $this->security->xss_clean($this->input->post('Heading_One'));
        $data['Heading_Two'] = $this->security->xss_clean($this->input->post('Heading_Two'));
        $data['Button_Name'] = $this->security->xss_clean($this->input->post('Button_Name'));
        $data['Call_to_action_URL'] = $this->security->xss_clean($this->input->post('Call_to_action_URL'));
        $data['Order_By'] = $this->security->xss_clean($this->input->post('Order_By'));
        $data['Description'] = $this->security->xss_clean($this->input->post('Description'));
		$data['Panel_Type'] = $this->security->xss_clean($this->input->post('Panel_Type'));
        $data['Added_On'] = date('Y-m-d h:i:s');
        $data['is_full_width_banner'] = $this->security->xss_clean($this->input->post('is_full_width_banner'));
		
		  if (isset($_FILES['Banner_image']['name'])) {           
	
			$path = 'banner_images';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   
                   
            if (!$this->upload->do_upload('Banner_image')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $upload_data = array('upload_data' => $this->upload->data());
				$import_file = $upload_data['upload_data']['file_name'];
				$inputFileName = $path .'/'. $import_file;				
				$data['Banner_image'] = $inputFileName;
            }
		} 	
    $this->banners->insert($data);
        $this->session->set_flashdata('success', 'Banners added Successfully');
        redirect('manage-banners');
    }
    /*
    function for edit Banners get
    returns  Banners by id.
    created by your name
    created at 20-08-20.
    */
    public function editBanners($banners_id) {
            $data['include_js'][] = '/assets/js/banners.js';
			$data['banners_id'] = $banners_id;
			$data['page_title'] = 'Edit Banner';
			$data['page'] = 'banners/edit-banners';
			$data['banners'] = $this->banners->getDataById($banners_id);
			$this->load->view('manage-template', $data);
	}
    /*
    function for edit Banners post
    created by your name
    created at 20-08-20.
    */
    public function editBannersPost() {
        $banners_id = $this->security->xss_clean($this->input->post('banners_id'));
        $banners = $this->banners->getDataById($banners_id);
        $data['Heading_One'] = $this->security->xss_clean($this->input->post('Heading_One'));
        $data['Heading_Two'] = $this->security->xss_clean($this->input->post('Heading_Two'));
        $data['Button_Name'] = $this->security->xss_clean($this->input->post('Button_Name'));
        $data['Call_to_action_URL'] = $this->security->xss_clean($this->input->post('Call_to_action_URL'));
        $data['Order_By'] = $this->security->xss_clean($this->input->post('Order_By'));
		$data['Description'] = $this->security->xss_clean($this->input->post('Description'));
		$data['Panel_Type'] = $this->security->xss_clean($this->input->post('Panel_Type'));
        $data['is_full_width_banner'] = $this->security->xss_clean($this->input->post('is_full_width_banner'));
        
		if (isset($_FILES['Banner_image']['name'])) { 	
			$path = 'banner_images';
            $config['upload_path'] = $path;
            $config['allowed_types'] = 'jpg|png|jpeg|gif';
            $config['remove_spaces'] = TRUE;
            $this->load->library('upload', $config);
            $this->upload->initialize($config);   
                   
            if (!$this->upload->do_upload('Banner_image')) {
                $error = array('error' => $this->upload->display_errors());
            } else {
                $upload_data = array('upload_data' => $this->upload->data());
				$import_file = $upload_data['upload_data']['file_name'];
				$inputFileName = $path .'/'. $import_file;				
				$data['Banner_image'] = $inputFileName;
            }			
        } 		
		$edit = $this->banners->update($banners_id,$data);
        if ($edit) {
            $this->session->set_flashdata('success', 'Banners Updated');
            redirect('manage-banners');
        }
    }
    /*
    function for view Banners get
    created by your name
    created at 20-08-20.
    */
    public function viewBanners($banners_id) {
        $data['banners_id'] = $banners_id;
        $data['banners'] = $this->banners->getDataById($banners_id);
        $this->load->view('banners/view-banners', $data);
    }
    /*
    function for delete Banners    created by your name
    created at 20-08-20.
    */
    public function deleteBanners($banners_id) {
        $delete = $this->banners->delete($banners_id);
        $this->session->set_flashdata('success', 'banners deleted');
        redirect('manage-banners');
    }
    /*
    function for activation and deactivation of Banners.
    created by your name
    created at 20-08-20.
    */
    public function changeStatusBanners($banners_id) {
        $edit = $this->banners->changeStatus($banners_id);
        $this->session->set_flashdata('success', 'banners '.$edit.' Successfully');
        redirect('manage-banners');
    }
    
}
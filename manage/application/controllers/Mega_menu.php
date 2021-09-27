<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mega_menu extends MY_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('Multi_menu_model','menu');
       
    }
    public function index(){

        $data['page_title'] = 'Menu';
        $data['page'] = 'menu/menu_list';
        $data['menuinfo']=$this->core->get('menu');
        $data['menu_item_info']=$this->core->get('menu_items');
        $this->load->view('manage-template', $data);
    }
    
    public function view($menu_id)
    {
        $data['page_title'] = 'Menu Items';
        $data['page'] = 'menu/multi_menu_item_list';
        $data['m_id'] = $menu_id;
        // $data['menu_items']=$this->menu->get_list();
        $data['menu_items']=$this->core->get('menu_items', array('m_id', $menu_id));
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
        public function modify($menu_id)
    {
        $data['page_title'] = 'Edit Menu';
        $data['page'] = 'menu/modify-menu';
        $data['menu_id'] = $menu_id;
        $data['menu'] = $this->core->get("menu", array('m_id'=>$menu_id))[0];
        
        
        // $data['include_js'][] = 'https://www.jqueryscript.net/demo/Drag-Drop-Menu-Builder-For-Bootstrap/bs-iconpicker/js/iconset/iconset-fontawesome-4.2.0.min.js';
        $data['include_js'][] = 'https://www.jqueryscript.net/demo/Drag-Drop-Menu-Builder-For-Bootstrap/bs-iconpicker/js/bootstrap-iconpicker.min.js'; 
        $data['include_js'][] = '/manage-assets/js/jquery-menu-editor.js';
        $data['include_js'][] = '/assets/js/mega_menu.js';
        $menu_tree = $data['menu_tree'] = $this->menu->get_menu_tree($menu_id);
        $menu_list = $data['menu_list'] = $this->menu->get_menu_list($menu_id);
        $this->load->view('manage-template', $data);
    }
    public function update()
    {
        $data = $response = array();
       $post_fields = $this->security->xss_clean($this->input->post());
       if($this->core->delete('menu_items', array('m_id'=>$post_fields['m_id']))){
            $m_id = $data['m_id'] = $post_fields['m_id'];
            $menu_list = json_decode($post_fields['list']);
            foreach ( $menu_list as $key => $item) {
                $data['m_item_name'] = $item->text; 
                $data['m_item_url'] =$item->href; 
                $data['is_nav_dropdown']    = isset($item->is_nav_dropdown)?$item->is_nav_dropdown:'yes';
                $data['is_display']    = isset($item->is_display)?$item->is_display:'yes';
               $data['parent_id'] = 0; 

               $insert_id = $this->core->insert('menu_items', $data);
               if (!empty($item->children)) {
                   $this->add_children_items($m_id, $insert_id, $item->children);
               }
            }
            $response['status'] = 'success';
            $response['error'] = 'Enjoy...!!!...Good night';
       }else{
            $response['status'] = 'failed';
            $response['error'] = 'Previous menu items are not deleted';
       }

       echo json_encode($response);
       exit();

    }
    
    public function add_children_items($m_id, $parent_id, $items){
        $data['m_id'] = $m_id;
        $data['parent_id'] = $parent_id;
        foreach ($items as $key => $item) {
            $data['m_item_name'] = $item->text; 
            $data['m_item_url'] = $item->href;     
           $insert_id = $this->core->insert('menu_items', $data);
            if (isset($item->children)) {
               $this->add_children_items($m_id, $insert_id, $item->children);
           }
        }
        return;
    }
    public function modify_menu($menu_id)
    {
        $data['page_title'] = 'Edit Menu';
        $data['page'] = 'menu/modify-menu-html';
        $data['menu_id'] = $menu_id;
        
        if ($this->form_validation->run() === FALSE) {
            
            // $data['menu'] = $this->core->get("menu", array('m_id'=>$menu_id))[0];
            // $menu_tree = $data['menu_tree'] = $this->menu->get_menu_tree($menu_id);
            // $menu_list = $data['menu_list'] = $this->menu->get_menu_list($menu_id);

            $this->load->view('manage-template', $data);
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());

            echo '<pre><ui>'; print_r($post_fields);
            echo '<ui>';
             exit();

           
            if ($this->core->update('menu',$menu_data,array('m_id'=>$MenuID))) {
                $this->session->set_flashdata('success', 'Menu updated successfully');
                redirect('menu');
            }else{
                $this->session->set_flashdata('error', 'Category updation failed');
               redirect('menu/edit/'.$m_id);
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    public function add(){
        $this->form_validation->set_rules('m_name', 'Name', 'required|trim|xss_clean');
        
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Add Menu';
            $data['page'] = 'menu/add_menu';
            
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $menu_data = array();
            $menu_data['m_name']     = $post_fields['m_name'];
            
            

            if ($this->core->insert('menu',$menu_data)) {
                $this->session->set_flashdata('success', 'Menu added successfully');
                redirect('menu');
            }else{
                $this->session->set_flashdata('error', 'Menu inserted failed');
                redirect('menu/add');
            }
        }
        $this->load->view('manage-template', $data);
    }
    
    public function edit($m_id = NULL) {

        $data['page_title'] = 'Edit Menu';
        $data['page'] = 'menu/edit_menu';
        $data['menuinfo'] = $this->core->get("menu", array('m_id'=>$m_id))[0];

        // echo '<pre>'; print_r($data); exit();

        $this->load->view('manage-template', $data);
    }
    public function edit_menu()
    {

        $data['page_title'] = 'Edit Menu';
        $MenuID = $this->input->post('MenuID');
        $this->form_validation->set_rules('m_name', 'Name', 'required|trim|xss_clean');
        
        if ($this->form_validation->run() === FALSE) {
            $this->edit();
        }else{
            $post_fields = $this->security->xss_clean($this->input->post());
            $menu_data = array();
            $menu_data['m_name']     = $post_fields['m_name'];
            

            if ($this->core->update('menu',$menu_data,array('m_id'=>$MenuID))) {
                $this->session->set_flashdata('success', 'Menu updated successfully');
                redirect('menu');
            }else{
                $this->session->set_flashdata('error', 'Category updation failed');
               redirect('menu/edit/'.$m_id);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($m_id=NULL)
    {
        $result = $this->core->delete("menu", array('m_id'=>$m_id));
        if($result)
        {
            $this->session->set_flashdata('success', 'Menu deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Menu deletion failed');
        }
    
    redirect('menu'); 
    }

    public function menu_items($menu_id)
    {
            
    }
    public function add_menu_item($menu_id)
    {
            
    }
    public function edit_menu_items($menu_id, $menu_item_id)
    {

            
    }
    public function delete_menu_items($menu_id, $menu_item_id)
    {
                    
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu_items extends MY_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('Menu_model','menu');
        $this->menus = $this->core->get('menu_items');
        
    }
    public function index(){
        $data['page_title'] = 'Menu Items';
        $data['page'] = 'menu/menu_item_list';
        // $data['menu_items']=$this->menu->get_list();
        $data['menu_items']=$this->core->get('menu_items');
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function add($menu_id){
        $data['menu_items'] = $this->core->get('menu_items', array('m_id'=>$menu_id));
        $this->form_validation->set_rules('m_item_name', 'Name', 'required|trim|xss_clean');
                
        if ($this->form_validation->run() === FALSE) {
            $data['m_id'] = $menu_id;
            $data['page_title'] = 'Add Menu Item';
            $data['page'] = 'menu/add_menu_item';
            
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $menu_data = array();
            $menu_data['m_item_name']    = $post_fields['m_item_name'];
            $menu_data['m_id']           = $post_fields['m_id'];
            $menu_data['parent_id']      = $post_fields['parent_id'];
            $menu_data['m_item_url']     = $post_fields['m_item_url'];
            $menu_data['m_item_desc']    = $post_fields['m_item_desc'];

            if ($this->core->insert('menu_items',$menu_data)) {
                $this->session->set_flashdata('success', 'MenuItem added successfully');
                redirect('menu');
            }else{
                $this->session->set_flashdata('error', 'MenuItem inserted failed');
                redirect("menu_items/add/$menu_id");
            }
        }
        $this->load->view('manage-template', $data);
    }

    // public function view(){
    //     $data['page_title'] = 'Edit Menu Item';
    //     $data['page'] = 'menu/menu_item_list';
    //     $data['menu_item_info'] = $this->core->get("menu_items");
    // }
    
    public function edit($menu_id, $m_item_id) {
        $data['page_title'] = 'Edit Item';
        $data['m_id'] = $menu_id;
        $data['page'] = 'menu/edit_menu_item';
        
        $data['menu_items'] = $this->menu->get_menu_items($menu_id, $menu_item_id);

        echo '<pre>'; print_r($data); exit();
        $data['menu_item'] = $this->core->get('menu_items',array('m_item_id'=>$m_item_id))[0];
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function edit_menu($m_id=true)
    {
        $data['page_title'] = 'Edit Menu';
        $data['menu_items'] = $this->core->get('menu_items',array('m_id'=>$m_id))[0];
        $menu_ItemID = $this->input->post('menu_ItemID');
        $this->form_validation->set_rules('m_item_name', 'Name', 'required|trim|xss_clean');
        
        if ($this->form_validation->run() === FALSE) {
            $data['page_title'] = 'Edit Menu Item';
        $data['page'] = 'menu/edit_menu_item';
        $data['menu_items'] = $this->core->get('menu_items',array('m_id'=>$m_id))[0];
        $data['m_id'] = $m_id;
        $this->load->view('manage-template', $data);
        }else{
            // $data['m_id'] = $menu_id;
            $post_fields = $this->security->xss_clean($this->input->post());
            $menu_data = array();
            $menu_data['m_item_name']    = $post_fields['m_item_name'];
            $menu_data['m_id']           = $post_fields['m_id'];
            $menu_data['parent_id']      = $post_fields['parent_id'];
            $menu_data['m_item_url']     = $post_fields['m_item_url'];
            $menu_data['m_item_desc']    = $post_fields['m_item_desc'];

            echo '<pre>'; print_r($post_fields); exit();

            if ($this->core->update('menu_items',$menu_data,array('m_item_id'=>$menu_ItemID))) {
                $this->session->set_flashdata('success', 'MenuItem updated successfully');
                redirect('menu_items');
            }else{
                $this->session->set_flashdata('error', 'Menu Item updation failed');
               redirect('menu_items/edit/'.$m_item_id);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function delete($m_item_id=NULL)
    {
        $result = $this->core->delete("menu_items", array('m_item_id'=>$m_item_id));
        if($result)
        {
            $this->session->set_flashdata('success', 'MenuItem deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'MenuItem deletion failed');
        }
    
    redirect('menu_items'); 
    }
}
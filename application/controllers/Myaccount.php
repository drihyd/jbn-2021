<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Myaccount extends MY_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('Myaccount_model','myaccount');
        $this->user_id = $_SESSION['anaya_user_data']->UserID;

        // echo '<pre>'; print_r($this->user_id); exit();
         

    }
    public function index()
    {
        $data['page_title'] = ' Myaccount | Anaya Jewellery';
        $data['breadcrumb_item'] = 'My Account';
        $data['seo'] = $this->core->get('seo_content', array('page'=>'home'));
        $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
        $data['page'] = 'my_account/my_orders';
        $user_id     = $_SESSION['anaya_user_data']->UserID;
        $data['orderinfo'] = $this->myaccount->get_orders($this->user_id);
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('anaya-template', $data);
    }
    public function invoice($order_id){

        $data['page_title'] = 'Invoice for order -'.$order_id;
        $data['order'] = $this->myaccount->get_order_details($order_id);
        $data['page'] = 'my_account/invoice';
        // echo '<pre>'; print_r($data); exit();
        // $this->load->view('pages/my_account/invoice', $data);
        $this->load->view('anaya-template', $data);
    }
    public function orders($orderid=NULL)
    {
        $data['breadcrumb_item'] = 'My Orders';
        $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
        $data['page'] = 'my_account/my_orders';
        $data['page_title'] = ' Myaccount | Anaya Jewellery';
        $data['orderinfo'] = $this->myaccount->get_orders($this->user_id);
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('anaya-template', $data);
    }
    public function orders_details($orderid=NULL)
    {
        $data['breadcrumb_item'] = 'My Orders Details';
        $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
        $data['page'] = 'my_account/my_order_details';
        $data['page_title'] = ' Myaccount | Anaya Jewellery';
        $data['order_details_info'] = $this->myaccount->get_order_details_id($orderid);
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('anaya-template', $data);
    }
    public function saved_addresses()
    {
        $data['breadcrumb_item'] = 'Saved Addresses';
        $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
        $data['page'] = 'my_account/saved_addresses';
        $data['page_title'] = ' Myaccount | Anaya Jewellery';
        $data['save_addresses'] = $this->core->get('address_master',array('UserID'=>$this->user_id));
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('anaya-template', $data);
    }
    public function my_wishlist()
    {
        $data['breadcrumb_item'] = 'My Wishlist';
        $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
        $data['page'] = 'my_account/wishlist';
        $data['page_title'] = ' Myaccount | Anaya Jewellery';
        $data['wishlist_details'] = $this->myaccount->get_wishlistetails($this->user_id);
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('anaya-template', $data);
    }
    public function change_password($userid=NULL)
    {
        $user_value_id = $this->core->get('users',array('UserID'=>$this->user_id));
        $this->form_validation->set_rules('old_password','Old password','trim|required');
        $this->form_validation->set_rules('new_password','New password','required');
        $this->form_validation->set_rules('confirm_password','Confirm new password','required|matches[new_password]|max_length[20]');
        if($this->form_validation->run() === false) {
            $data['breadcrumb_item'] = 'Change Password';
            $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
            $data['page'] = 'my_account/change_password';
            $data['page_title'] = ' Myaccount | Anaya Jewellery';
            // $this->load->view('anaya-template', $data);
        }
        else {
            

            $user_value_id = $this->core->get('users',array('UserID'=>$this->user_id));
            $oldpass = md5($this->input->post('old_password'));     
                
               if($user_value_id->UserPassword!=$oldpass){
                    $this->session->set_flashdata('error', 'Password updation failed');
                    redirect('myaccount/change_password');  
                }else{ 
                    $newpass = $this->input->post('new_password');
                    if ($this->core->update('users',array('UserPassword'=>md5($newpass)),array('UserID'=>$this->user_id))) {
                        $this->session->set_flashdata('success', 'Password successfully changed. Please Login again');
                        redirect('myaccount/change_password','refresh');
                    }    
                    redirect('myaccount/change_password');
                }  
        }
        $this->load->view('anaya-template', $data);
    }
    public function add_address()
    {
        $this->form_validation->set_rules('Fullname', 'Full Name', 'trim|required');
        $this->form_validation->set_rules('Address1', 'Address1', 'trim|required');
        $this->form_validation->set_rules('Address2', 'Address2', 'trim|required');
        $this->form_validation->set_rules('LandMark', 'LandMark', 'trim|required');
        $this->form_validation->set_rules('City', 'City', 'trim|required');
        $this->form_validation->set_rules('Pincode', 'Pincode', 'trim|required');
        $this->form_validation->set_rules('Country', 'Country', 'trim|required');
        $this->form_validation->set_rules('State', 'State', 'trim|required');
        $this->form_validation->set_rules('Mobile', 'Mobile', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['breadcrumb_item'] = 'Add Address';
            $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
            $data['page'] = 'my_account/add_address';
            $data['page_title'] = ' Myaccount | Anaya Jewellery';
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $address_data = array();
            $address_data['Fullname']     = $post_fields['Fullname'];
            $address_data['Address1']     = $post_fields['Address1'];
            $address_data['Address2']     = $post_fields['Address2'];
            $address_data['LandMark']     = $post_fields['LandMark'];
            $address_data['City']         = $post_fields['City'];
            $address_data['Pincode']      = $post_fields['Pincode'];
            $address_data['Country']      = $post_fields['Country'];
            $address_data['State']        = $post_fields['State'];
            $address_data['Mobile']       = $post_fields['Mobile'];
            $address_data['addtype']      = $post_fields['addtype'];
            if (isset($post_fields['is_default'] )) {
                $address_data['is_default'] = 1;
             }else{
                $address_data['is_default'] = 0; 
             }
            $address_data['UserID']       = $this->user_id;

            if ($this->core->insert('address_master',$address_data)) {
                $this->session->set_flashdata('success', 'Address added successfully..!!');
                redirect('myaccount/saved_addresses');
            }else{
                $this->session->set_flashdata('error', 'Failed to add Address');
                redirect('myaccount/add_address');
            }
        }
        $this->load->view('anaya-template', $data);
    }
    public function edit_address($AddressID=NULL)
    {
        $data['save_addresses'] = $this->core->get('address_master',array('AddressID'=>$AddressID));
        // echo '<pre>'; print_r($data); 
        $AddressID = $this->input->post('AddressID');
        $this->form_validation->set_rules('Fullname', 'Full Name', 'trim|required');
        $this->form_validation->set_rules('Address1', 'Address1', 'trim|required');
        $this->form_validation->set_rules('Address2', 'Address2', 'trim|required');
        $this->form_validation->set_rules('LandMark', 'LandMark', 'trim|required');
        $this->form_validation->set_rules('City', 'City', 'trim|required');
        $this->form_validation->set_rules('Pincode', 'Pincode', 'trim|required');
        $this->form_validation->set_rules('Country', 'Country', 'trim|required');
        $this->form_validation->set_rules('State', 'State', 'trim|required');
        $this->form_validation->set_rules('Mobile', 'Mobile', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            $data['breadcrumb_item'] = 'Add Address';
            $data['page_title'] = ' Myaccount | Anaya Jewellery';
            $data['myaccount_sidenav'] = $this->load->view('pages/my_account/my_account_side_nav',"",true);
            $data['page'] = 'my_account/edit_address';
            // echo '<pre>'; print_r($data); exit();
        }else{
//echo '<pre>'; print_r($data); exit();
            $post_fields = $this->security->xss_clean($this->input->post());
            $address_data = array();
            $address_data['Fullname']     = $post_fields['Fullname'];
            $address_data['Address1']     = $post_fields['Address1'];
            $address_data['Address2']     = $post_fields['Address2'];
            $address_data['LandMark']     = $post_fields['LandMark'];
            $address_data['City']         = $post_fields['City'];
            $address_data['Pincode']      = $post_fields['Pincode'];
            $address_data['Country']      = $post_fields['Country'];
            $address_data['State']        = $post_fields['State'];
            $address_data['Mobile']       = $post_fields['Mobile'];
            $address_data['addtype']      = $post_fields['addtype'];
            if (isset($post_fields['is_default'] )) {
                $address_data['is_default'] = 1;
             }else{
                $address_data['is_default'] = 0; 
             }
            $address_data['UserID']       = $this->user_id;

            if ($this->core->update('address_master',$address_data,array('AddressID'=>$AddressID))) {
                $this->session->set_flashdata('success', 'Address updated successfully..!!');
                redirect('myaccount/saved_addresses');
            }else{
                $this->session->set_flashdata('error', 'Failed to update the Address');
                redirect('myaccount/edit_address/'.$AddressID);
            }
        }
        $this->load->view('anaya-template', $data);
    }
    public function delete($AddressID=NULL)
    {
        $result = $this->core->delete("address_master", array('AddressID'=>$AddressID));
        if($result)
        {
            $this->session->set_flashdata('success', 'Address deleted successfully');
        }
        else
        {
            $this->session->set_flashdata('error', 'Address deletion failed');
        }
    
    redirect('myaccount/saved_addresses'); 
    }

    
    
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Orders extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_order_model','datatable');
        $this->load->model('Ajax_orders_status_model','orders_status');
        $this->load->model('Core_model','core');
        $this->load->model('Orders_model','orders');
        // $this->order_status = $this->core->get_enum_values('order','Order_status'); 
        $this->delivery_partners= $this->core->get('delivery_partners');
        // echo '<pre>'; print_r($this->order_status); exit();
    }
    public function index(){

        $data['page_title'] = 'Recent Orders (1 Week)';
        $data['page'] = 'orders/view_orders';
        $this->load->view('manage-template', $data);
    }
    public function status($status=NULL){

        $data['page_title'] = ucwords($status).' '.'Orders';
        $data['page'] = 'orders/orders_status';
        $data['status'] = $status;


        // echo '<pre>'; print_r($data); exit();

        $this->load->view('manage-template', $data);
    }
    public function invoice($order_id){

        $data['page_title'] = 'Invoice for order -'.$order_id;
        $data['order'] = $this->orders->get_order_details($order_id);
        $data['page'] = 'orders/invoice1';
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function today(){

        $data['page_title'] = "Today Orders";
        $data['page'] = 'orders/today_orders';

        $this->load->view('manage-template', $data);
    }
    public function month(){

        $data['page_title'] = 'Monthly Orders';
        $data['page'] = 'orders/monthly_orders';
        $data['order'] = $this->orders->get_count_month();
        
        $month              = date('m', time());
        $data['month_name'] = date('F', time());
        $data['month_name'] = date('F', strtotime($month - date('m', time()) . ' month'));
        $data['Year'] = date('Y',time());
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function from_to(){

        $data['page_title'] = 'From -To Orders';
        $data['page'] = 'orders/from_to_orders';
        $this->load->view('manage-template', $data);
    }
    public function ajax_list($value=NULL){
        // die('hello');

        $table="order";
        $list = $this->datatable->get_datatables($table,$value);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = isset($_POST['start']) ? $_POST['start']:"";
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = $sno;
            // $row[] = $item->o_Order_Number;
            $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->o_Order_Number</a></u>";

            $row[] = ucwords($item->order_shipname);
            // $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_id</a></u>";
            
            // $row[] = ucwords($item->order_email);
            $row[] = $item->order_email;
            // $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_email</a></u>";
            if ($item->order_phone) {
                $row[] = $item->user_phone;
            }elseif ($item->o_shipping_Mobile) {
                $row[] = $item->o_shipping_Mobile;
            }else{
                 $row[] = $item->user_phone;   
            }
           
            $row[] = date("d-m-Y", strtotime($item->order_date));
            if ($item->order_status == "shipped to") {
                $row[] = '<b>Status: </b>'.ucwords($item->order_status).'</br>'.'<b>Shipped By: </b>'.$item->dp_name.'</br>'.'<b>AWB No: </b>'.$item->o_shipped_traking_no;
            }else{
                $row[] = ucwords($item->order_status);
            }
            $row[] = sprintf('%0.2f',$item->p_amount);
            
            
            $row[] = "<a href=".base_url()."orders/view/".$item->order_id."><i class='fa fa-info-circle'></i><span> Info</span></a>";
            // <a href=".base_url()."orders/invoice/".$item->order_id."> <u>Invoice</u></a>
            $data[] = $row;
            $sno++;
        }
 
        $output = array(
                        "draw" => isset($_POST['draw']) ? $_POST['draw']:"",
                        "recordsTotal" => $this->datatable->count_all($table),
                        "recordsFiltered" => $this->datatable->count_filtered($table),
                        "data" => $data,
                );
         // echo '<pre>'; print_r($output); exit();
         echo json_encode($output);
         exit();
    }
    public function ajax_orders_status_list($value=NULL,$status=NULL){
        // die('hello');

        $table="order";
        $list = $this->orders_status->get_datatables($table,$value,$status);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = isset($_POST['start']) ? $_POST['start']:"";
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = $sno;
            // $row[] = $item->o_Order_Number;
            $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->o_Order_Number</a></u>";

            $row[] = ucwords($item->order_shipname);
            // $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_id</a></u>";
            
            // $row[] = ucwords($item->order_email);
            $row[] = $item->order_email;
            // $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_email</a></u>";
            if ($item->order_phone) {
                $row[] = $item->user_phone;
            }elseif ($item->o_shipping_Mobile) {
                $row[] = $item->o_shipping_Mobile;
            }else{
                 $row[] = $item->user_phone;   
            }
           
            $row[] = date("d-m-Y", strtotime($item->order_date));
            if ($item->order_status == "shipped to") {
                $row[] = '<b>Status: </b>'.ucwords($item->order_status).'</br>'.'<b>Shipped By: </b>'.$item->dp_name.'</br>'.'<b>AWB No: </b>'.$item->o_shipped_traking_no;
            }else{
                $row[] = ucwords($item->order_status);
            }
            $row[] = sprintf('%0.2f',$item->p_amount);
            
            
            $row[] = "<a href=".base_url()."orders/view/".$item->order_id."><i class='fa fa-info-circle'></i><span> Info</span></a>";
            // <a href=".base_url()."orders/invoice/".$item->order_id."> <u>Invoice</u></a>
            $data[] = $row;
            $sno++;
        }
 
        $output = array(
                        "draw" => isset($_POST['draw']) ? $_POST['draw']:"",
                        "recordsTotal" => $this->orders_status->count_all($table),
                        "recordsFiltered" => $this->orders_status->count_filtered($table),
                        "data" => $data,
                );
         // echo '<pre>'; print_r($output); exit();
         echo json_encode($output);
         exit();
    }
    public function view($OrderlD=NULL) {
        $data['page_title'] = 'Order Details';
        $data['page'] = 'orders/single_order_view';
        $data['include_js'][] = '/assets/js/order_status.js';
        $data['Order_details'] = $this->orders->get_order_details($OrderlD);

        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
        // die();
    }
    public function update_status()
    {
        
        $order_status_id = $this->input->post('order_status_id');

        $data['Order_details'] = $this->orders->get_order_details($order_status_id);

        // echo '<pre>'; print_r($data); exit();

        $this->form_validation->set_rules('Order_status', 'Order_status', 'trim|required');
        
        if ($this->form_validation->run() === FALSE) {
            $data['Order_details_status'] = $this->core->get('order',array('OrderlD',$OrderlD))[0];
            // $data['include_js'][] = '/assets/js/order_status.js';
            $this->view();
        }else{
$order_status_id = $this->input->post('order_status_id');
$Order_details = $this->orders->get_order_details($order_status_id);
// echo '<pre>'; print_r($data); exit();
            $post_fields = $this->security->xss_clean($this->input->post());
            $order_status = array();

            if ($post_fields['Order_status'] == "dispatched") {
                $order_status['Order_status'] = $post_fields['Order_status'];
                $order_status['shipped_by_id'] = $post_fields['shipped_by_id'];
                $order_status['shipped_traking_no'] = $post_fields['shipped_traking_no'];
                $order_status['shipping_to_date'] = $post_fields['shipping_to_date'];
                $order_status['cancelled_remarks'] = '';

            }elseif ($post_fields['Order_status'] == "cancelled") {
                $order_status['Order_status'] = $post_fields['Order_status'];
                $order_status['cancelled_remarks'] = $post_fields['cancelled_remarks'];
                $order_status['shipped_by_id'] = '';
                $order_status['shipped_traking_no'] = '';
                $order_status['shipping_to_date'] = '';
            }
            else{

                $order_status['Order_status'] = $post_fields['Order_status'];
                // $order_status['shipped_by_id'] = '';
                // $order_status['shipped_traking_no'] = '';
                // $order_status['shipping_to_date'] = '';
                // $order_status['cancelled_remarks'] = '';
            }
            
            
            if ($this->core->update('order',$order_status,array('OrderlD'=>$order_status_id))) {

                $order_status['OrderlD'] = $Order_details->order_id;
                $order_status['UserlD'] = $Order_details->user_id;
                $order_status['PaymentID'] = $Order_details->p_PaymentID;
                $order_status['OrderEmall'] = $Order_details->order_email;
                $order_status['OrderShipName'] = $Order_details->order_shipname;
                $order_status['OrderDate'] = $Order_details->order_date;
                $order_status['shipped_by_id'] = $Order_details->o_shipped_by_id;
                $order_status['shipped_traking_no'] = $Order_details->o_shipped_traking_no;
                $order_status['shipping_to_date'] = $Order_details->o_shipping_to_date;
                $order_status['cancelled_remarks'] = $Order_details->cancelled_remarks;


                $this->core->insert('order_status_log',$order_status);
                $this->session->set_flashdata('status_success', 'Order Status updated Successfully');
                redirect('orders/view/'.$order_status_id);
            }else{
                $this->session->set_flashdata('status_error', 'Order Status updation failed');
                redirect('orders/view/'.$order_status_id);
            }
        }
        $this->load->view('manage-template', $data);
    }
    public function update_shipping_status($OrderlD=NULL)
    {
        
        $order_status_id = $this->input->post('order_shipping_id');
        $data['Order_details'] = $this->orders->get_order_details($OrderlD);
        // $this->form_validation->set_rules('shipped_by_id', 'Shipped By', 'trim|required');
        // $this->form_validation->set_rules('shipped_traking_no', 'shipped_traking_no', 'trim|required');
        // $this->form_validation->set_rules('shipping_to_date', 'shipping_to_date', 'trim|required');
        
        // if ($this->form_validation->run() === FALSE) {
        //     $data['Order_details_status'] = $this->core->get('order',array('OrderlD',$OrderlD))[0];
        //     $this->view();
        // }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $shipping_status = array();
            
            $shipping_status['shipped_by_id'] = $post_fields['shipped_by_id'];
            $shipping_status['shipped_traking_no'] = $post_fields['shipped_traking_no'];
            $shipping_status['shipping_to_date'] = $post_fields['shipping_to_date'];

            $this->core->update('order',$shipping_status,array('OrderlD'=>$order_status_id));
            
            // if ($this->core->update('order',$shipping_status,array('OrderlD'=>$order_shipping_id))) {
            //     $this->session->set_flashdata('status_success', 'Order Shipped By updated Successfully');
            //     
            // }else{
            //     $this->session->set_flashdata('status_error', 'Order Shipped By updation failed');
            //     redirect('orders/view/'.$order_shipping_id);
            // }
            redirect('orders/view/'.$order_status_id);
        // }

        // $this->load->view('manage-template', $data);
    }
    public function ajax_orderdetails_list($id=NULL){
        // die('hello');

        $table="order_details";
        $list = $this->datatable->get_datatables($table,$id);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = isset($_POST['start']) ? $_POST['start']:"";
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_id</a></u>";
            $row[] = $item->order_amount;
            $row[] = ucwords($item->order_shipname);
            // $row[] = ucwords($item->order_email);
            $row[] = "<u><a href=".base_url()."orders/view/".$item->order_id.">$item->order_email</a></u>";
            $row[] = $item->order_phone;
            $row[] = $item->order_date;
            $row[] = $item->order_status;

            $row[] = "<a href=".base_url()."orders/view/".$item->order_id."><i class='fa fa-file-text-o'></i></a>  <a href=".base_url()."orders/invoice/".$item->order_id."> <u>Invoice</u></a>";
            $data[] = $row;
            $sno++;
        }
 
        $output = array(
                        "draw" => isset($_POST['draw']) ? $_POST['draw']:"",
                        "recordsTotal" => $this->datatable->count_all($table),
                        "recordsFiltered" => $this->datatable->count_filtered($table),
                        "data" => $data,
                );
         // echo '<pre>'; print_r($output); exit();
         echo json_encode($output);
         exit();
    }
   

    
}
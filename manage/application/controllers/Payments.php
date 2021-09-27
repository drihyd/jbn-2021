<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payments extends MY_Controller {

    function __construct(){
        parent::__construct();

        $this->load->model('Ajax_payments_model','datatable');
        $this->load->model('Core_model','core');
        $this->load->model('Orders_model','orders');
        // $this->order_status = $this->core->get_enum_values('order','Order_status'); 

        // echo '<pre>'; print_r($this->order_status); exit();
    }
    public function index(){

        $data['page_title'] = 'Recent Payments (1 Week)';
        $data['page'] = 'payments/view_payments';
        $this->load->view('manage-template', $data);
    }
    public function invoice($order_id){

        $data['page_title'] = 'Invoice for order -'.$order_id;
        $data['oreder'] = $this->orders->get_order_details($order_id);
        $this->load->view('orders/invoice', $data);
    }
    public function today(){

        $data['page_title'] = "Today Payments";
        $data['page'] = 'payments/today_payments';
        $this->load->view('manage-template', $data);
    }
    public function month(){

        $data['page_title'] = 'Monthly Payments';
        $data['page'] = 'payments/monthly_payments';
        // $data['order'] = $this->orders->get_count_month();
        
        $month              = date('m', time());
        $data['month_name'] = date('F', time());
        $data['month_name'] = date('F', strtotime($month - date('m', time()) . ' month'));
        $data['Year'] = date('Y',time());
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
    }
    public function from_to(){

        $data['page_title'] = 'From - To Payments';
        $data['page'] = 'payments/from_to_payments';
        $this->load->view('manage-template', $data);
    }
    public function ajax_list($value=NULL){
        // die('hello');

        $table="payments";
        $list = $this->datatable->get_datatables($table,$value);
        // echo '<pre>'; print_r($list); exit();
        
        $data = array();
        $no = isset($_POST['start']) ? $_POST['start']:"";
        $sno=1;
        foreach ($list as $item) {
            $no++;
            $row = array();
            $row[] = $sno;
             // $row[] = $item->o_OrderlD;
             $row[] = "<u><a href=".base_url()."orders/view/".$item->o_OrderlD.">$item->o_Order_Number</a></u>";
            $row[] = $item->p_PaymentID;
           
            $row[] = ucwords($item->u_UserFirstName.' '.$item->u_UserLastName);
            
            $row[] = $item->p_emailid;
            $row[] = $item->p_contact_number;
            $row[] = date("d-m-Y", strtotime($item->p_payment_date));
            if ($item->p_PaymentStatus=="authorized") {
                $row[] = 'Paid';
            }else{
                $row[] = 'Failed';
            }
            // $row[] = $item->p_PaymentStatus;
            $row[] = sprintf('%0.2f',$item->p_amount);
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
    public function view($OrderlD=NULL) {
        $data['page_title'] = 'Order Details';
        $data['page'] = 'orders/single_order_view';
        $data['Order_details'] = $this->orders->get_order_details($OrderlD);
        // echo '<pre>'; print_r($data); exit();
        $this->load->view('manage-template', $data);
        // die();
    }
    public function update_status()
    {
        
        $order_status_id = $this->input->post('order_status_id');
        $this->form_validation->set_rules('Order_status', 'Order_status', 'trim|required');
        
        if ($this->form_validation->run() === FALSE) {
            $data['Order_details_status'] = $this->core->get('order',array('OrderlD',$OrderlD))[0];
            $this->view();
        }else{

            $post_fields = $this->security->xss_clean($this->input->post());
            $order_status = array();
            $order_status['Order_status'] = $post_fields['Order_status'];
            
            if ($this->core->update('order',$order_status,array('OrderlD'=>$order_status_id))) {
                $this->session->set_flashdata('status_success', 'Order Status updated Successfully');
                redirect('orders/view/'.$order_status_id);
            }else{
                $this->session->set_flashdata('status_error', 'Order Status updation failed');
                redirect('orders/view/'.$order_status_id);
            }
        }
        $this->load->view('manage-template', $data);
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

            $row[] = "<a href=".base_url()."orders/view/".$item->order_id."><i class='fa fa-eye'></i></a>";
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
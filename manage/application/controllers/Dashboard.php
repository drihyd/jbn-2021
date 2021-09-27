<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    function __construct(){
        parent::__construct();
        $this->info =$this->session->userdata();
        $data['info']= $this->core->get('admin_user',array('AdminID'))[0];
        $this->load->model('dashboard_model', 'dashboard');
        
    }
    public function index(){       
        $data['today_summary'] = $this->dashboard->get_order_summary();

        $data['month_summary'] = $this->dashboard->get_order_summary(date('01-m-Y'));
        $m = date('m');
        if ($m/4 <= 1) {
            $start = 01;
            $end = 04;
        }elseif($m/4 > 1 && $m/4 <= 2){
            $start = 05;
            $end = 8;
        }else{
            $start = 9;
            $end = 12;
        }
        $from = date("01-$start-Y");
        $to = date("01-$end-Y");
        $data['quarter_summary'] = $this->dashboard->get_order_summary($from, $to);
        $data['year_summary'] = $this->dashboard->get_order_summary(date('01-01-Y'));
    	$data['page_title'] = 'Dashboard';
        $data['page'] = 'dashboard';   
        // echo '<pre>'; print_r($data); exit();

        $this->load->view('manage-template', $data);
    }
}
<?php
defined('BASEPATH') OR EXIT();

class MY_Controller extends CI_controller {

	// public $AdminID;
	
	function __construct() {
		parent::__construct();

		$this->require_login();
		$this->load->model('Goldprice_model','gold_price');

		$this->admin_user=$this->core->get('admin_user',array('Email'=>$_SESSION['Email']))[0];

		$this->goldprice=$this->gold_price->lastData()[0];

		// echo '<pre>'; print_r($this->admin_user); exit();

		//  if (!isset($this->session->AdminID) ){
		// 	$this->session->set_userdata('AdminID', 1);
		// }
		
		// $this->_set_defaults();
		// $this->_run_prime_procedures();	
		// require_once 'settings.php';		
		//$this->_run_prime_procedures();

		// if ($this->router->class != 'login') {

		// // 	// if (isset($this->session->user_id)) {
		// // 	// 	$this->student_general_info= $this->core->get_student_general_info($this->session->user_id);
		// // 	// 	$this->student_photo= $this->core->get_student_photo($this->session->user_id);
		// // 	// 	$this->course_preference = $this->core->get_course_pref_info($this->session->user_id);
		// // 	// 	$this->load->model('Progressbar_model','progress',TRUE);
		// // 	// 	$this->progress_percentage=$this->progress->get_progress_info($this->session->user_id);
		// // 	// 	$this->load->model('Print_model');
		// // 	// 	$this->payment_details=$this->Print_model->get_payment_details($this->session->user_id);
		// 		$this->AdminID = $this->session->AdminID;
		// 	}else{
		// 		redirect('login','refresh');
		// 	}
		// }
	}

	// public function index()
 //    {

 //        $data['page_title'] =$data['page'] = $this->router->class;
 //        $this->load->view('manage-template', $data);
 //    }

	
	# ------------------------------------------------------------------
	# INTERFACE FUNCTIONS
	# ------------------------------------------------------------------
	
	public function restrict_access($allowed_types = array()) {
		if( ! is_array($allowed_types)) {
			die('restrict_access parameter not an array.');
		}
		array_push($allowed_types, 'super-admin');
		
		$user_type = $this->session->user_type;
		if( ! in_array($user_type, $allowed_types)) {
			die('Access denied!');
			//redirect('access_error', 'refresh');
		}
		
		return;
	}
	
	public function require_login() {
		if( ! $this->is_logged_in()) {
			$current_url = rawurlencode(current_url());
			redirect("login", 'refresh');
		}
		
		return;
	}
	
	public function is_logged_in() {	
		$logged_in = $this->session->logged_in;
		if (!$logged_in) {
			if (session_status() == PHP_SESSION_ACTIVE) {
				session_destroy();
			}
			
			return FALSE;
		}		
		return TRUE;		
	}
	
	
			public function get_Categories() {
	
		return "Hello Venkat";
	}
	
	
/*	public function get_seo_content($page_name) {
		require_once('seo_content.php');
		return in_array($page_name, $SEO_CONTENT_MASTER)? $SEO_CONTENT_MASTER[$page_name]: $SEO_CONTENT_MASTER['default'];
	}
	*/
	
	# ------------------------------------------------------------------
	# UTILITY FUNCTIONS
	# ------------------------------------------------------------------
	
	private function _set_defaults() {
		date_default_timezone_set('Asia/Kolkata');
		setlocale(LC_MONETARY, 'en_IN');
		ini_set('max_execution_time', 0); 
		ini_set('memory_limit','2048M');
	}
	
	private function _run_prime_procedures() {
		collect_visitor_data();
		$this->_ban_rogue_ips();
		$this->_ban_all_bots();
		
		return;
	}
	
	private function _ban_rogue_ips() {
		$ip_whitelist = array(
			'183.82.2.56', // DRI Office
			'183.82.108.67' // SK Retail Office
		);

		if(ENVIRONMENT == 'development') {
			array_push($ip_whitelist, '::1');
		}
		
		$visitor_data = session_get_visitor_data();
		$visitor_ip = $visitor_data['visitor_ip'];
	
		if( ! in_array($visitor_ip, $ip_whitelist)) {
			die('page not found');
			exit();
		}
		
		return;
	}
	
	private function _ban_all_bots() {
		$visitor_data = session_get_visitor_data();
		if($visitor_data['visitor_is_bot']) {
			die('page not found');
			exit();
		}
		
		return;
	}
	
	


	/*private function _gen_pdf($html, $paper='A4')
    {
        $this->load->library('mpdf60/mpdf');               
        $mpdf=new mPDF('utf-8',$paper);
        $mpdf->WriteHTML($html);
        $mpdf->Output();
    }*/
	
}

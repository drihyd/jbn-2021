<?php

defined('BASEPATH') OR EXIT();

class MY_Controller extends CI_controller {

	

	function __construct() {

		parent::__construct();



		$this->_set_defaults();
		//$this->session->set_flashdata('success', '');
		//$this->session->set_flashdata('error', '');

	


		// $this->_run_prime_procedures();	


		// $this->nav_menu = $this->menu->get_nav_menu_dropdown(1);
		// $this->nav_menu = $this->menu->get_nav_menu_dropdown(1);
		$this->nav_jbn_menu = $this->core->get('menu_items',array('m_id'=>3));
		$this->primary_menu = $this->core->get('menu_items',array('m_id'=>1));
		$this->footer_menu = $this->core->get('menu_items',array('m_id'=>2));

		require_once 'settings.php';				

		//$this->_run_prime_procedures();



		$controller = $this->uri->segment(1);
		//generates random number 

	if (isset($_SESSION['anaya_user_data'])) {
		$this->loggedin = $_SESSION['anaya_logged_in'];
		$this->customer = $_SESSION['anaya_user_data'];   
		define("MY_SESSION_ID",$this->customer->UserID);
    }
    else{    		
		
			define("MY_SESSION_ID",session_id());
			$this->customer = MY_SESSION_ID; 
    }



	}



	

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
		$logged_in = $this->session->zap_logged_in;

		if (!$logged_in) {

			if (session_status() == PHP_SESSION_ACTIVE) {

				session_destroy();

			}

			

			return FALSE;

		}		

		return TRUE;		

	}

	

	

	public function get_seo_content($page_name) {

		require_once('seo_content.php');

		return in_array($page_name, $SEO_CONTENT_MASTER)? $SEO_CONTENT_MASTER[$page_name]: $SEO_CONTENT_MASTER['default'];

	}

	

	

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



	private function _gen_pdf($html, $paper='A4')

    {

        $this->load->library('mpdf60/mpdf');               

        $mpdf=new mPDF('utf-8',$paper);

        $mpdf->WriteHTML($html);

        $mpdf->Output();

    }

    function loadViews($viewName = NULL, $headerInfo = NULL, $pageInfo = NULL, $footerInfo = NULL){

        $this->load->view('includes/header', $headerInfo);
        $this->load->view('includes/navigation');
       	$this->load->view($viewName, $pageInfo);
        $this->load->view('includes/footer',$footerInfo);

    }

       function loadViews_single_page($viewName = NULL, $headerInfo = NULL, $pageInfo = NULL, $footerInfo = NULL){

        $this->load->view('includes/hide_header', $headerInfo);
        $this->load->view('includes/hide_navigation');
       	$this->load->view($viewName, $pageInfo);
        $this->load->view('includes/hide_footer',$footerInfo);

    }

    function print_prev($string=NULL)

    {

    	echo "<prev>";

    	print_r($string);

    	echo "</prev>";

    }

    public function count_cart(){
    if ($this->loggedin){
     $p = $data['products'] = $this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
     $this->count_cart_item=$this->purchase_cart->get_cart_with_customer_id($this->customer->UserID);
     $data['sub_total_data']=$this->get_summary_prices($data['products']);
    }else{
     $p = $data['products'] = $this->purchase_cart->get_cart_items();
     $data['sub_total_data']=$this->get_summary_prices($data['products']);
    }  
    }   	

}


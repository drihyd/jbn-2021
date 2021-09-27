<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**

* 

*/

class Core_model extends CI_Model
{	

	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function insert($table = '', $set = NULL)
	{
		if ($table=='' || $set === NULL) return false;
		if ($this->db->insert($table, $set)) {
			return $this->db->insert_id();
		}
		return false;
	}

	public function update($table = '', $set, $where, $limit = NULL)
	{
		if ($table=='' || $set === NULL || $where === NULL) return false;
		if ($this->get($table, $where))
		return $this->db->update($table, $set, $where, $limit);	
		else return false;
	}


	public function delete($table = '', $where = NULL, $limit = NULL)
	{

		if ($table=='' || $where == NULL) return false;

		return $this->db->delete($table, $where, $limit);		

	}


	public function get($table='', $where=NULL, $limit=NULL, $offset=NULL)
	{

		if ($table=='') return false;
		$result = $this->db->get_where($table, $where, $limit, $offset);

		//echo '<pre>'; print_r($result->num_rows()); exit();
		if ($result->num_rows() >0) {
			return $result->result();
		}else{
			return  false;	
		}	

	}
	public function get_row($table='', $where=NULL, $limit=NULL, $offset=NULL)
	{
		if ($table=='' || $where == NULL) return false;
		$result = $this->db->get_where($table, $where);
		//echo '<pre>'; print_r($result->num_rows()); exit();
		if ($result->num_rows() ===1) {
			return $result->row();
		}else{
			return  false;	
		}	

	}

	public function get_order_by($table='', $where=null, $order_by=null,  $direction = 'ASC', $limit=NULL, $offset=NULL)
	{

		if ($table=='') return false;
		
		$this->db->from($table);
		if (isset($where) && is_array($where) && count($where) > 0) {
			$this->db->where($where);
		}
		$result = $this->db->order_by($order_by, $direction)->limit($limit, $offset)->get();

		//echo '<pre>'; print_r($result->num_rows()); exit();
		if ($result->num_rows() >0) {
			return $result->result();
		}else{
			return  false;	
		}	

	}


	public function where_in($table='', $where=NULL, $key = NULL, $values = NULL, $escape = NULL)
	{
			$this->db->select('*');
			$this->db->from( $table);
			if (isset($where) && is_array($where) && count($where) > 0) {
				$this->db->where($where);
			}
			$this->db->where_in($key, $values);	

			$result = $this->db->get();

		if ($result->num_rows() >0) {
			return ($result->num_rows() == 1) ? $result->row() : $result->result();
		}else{
			return  false;	
		}
	}

	public function get_enum_values($table, $field )
	{
	    $type = $this->db->query( "SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'" )->row( 0 )->Type;
	    preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
	    $enum = explode("','", $matches[1]);
	    
	    return $enum;	  
	}

	public function upload_files($path, $files)
    {
        $config = array(
            'upload_path'   => $path,
            'allowed_types' => 'jpg|png|jpeg|pdf|',
            'overwrite'     => false,                       
        );

        $this->load->library('upload', $config);

        $images = array();

        foreach ($files as $file) {
            $_FILES['image']= $file;
            $this->upload->initialize($config);

            if ($this->upload->do_upload('image')) {
                $images[] =$this->upload->data();
            //     print_r($images);
            //     die();
            } else {
                 $images['failed'][] = $file;
            }
        }
        return $images;
    }
    public function upload_single_file($path, $file, $file_name='')
    {
        $config = array(
            'upload_path'   => $path,
            'allowed_types' => 'jpg|png|jpeg|pdf|',
            'overwrite'     => true,   
			// 'encrypt_name'=>TRUE                   
        );
        if (!empty($file_name)) {
        	$config['file_name'] = $file_name;
        }
        $this->load->library('upload', $config);
        $_FILES['image']= $file;
        $this->upload->initialize($config);
        if ($this->upload->do_upload('image')) {
            return $this->upload->data('file_name');
        } else {
             return false;
        }
    }

    public function getWithId($table, $column, $id)
	{
		$where = array($column=>$id);
		$row = $this->db->get_where($table, $where);

		return  ($row->num_rows() == 1) ? $row->row() : false;
	}

	public function generateExcel($action, $headings, $data)
	{		
		
		if (!is_array($data) || !(count($data) > 0) || $data == false) {
			$this->session->set_flashdata('error', 'Data not available');
			return;
		}

		$user = $this->session->zap_user;

		# Include PHPExcel Libraries
		require './application/' . 'libraries/PHPExcel.php';
		require  './application/'. 'libraries/PHPExcel/IOFactory.php';
		# Have an array to store the excel data rows

		$excel_data = array(); 
		$no_columns = count($headings);
		$cols =  $no_columns;
		$title = $excel_data = array(); 

		$title[] = "$action Report";

		while ($cols > 1) {
			$title[] = "";  
		   $cols--; 
		}	
		
		# Loop through the data you want to write into the excel sheet
		# and push it into the excel data array
		$excel_data[] = $title;
		$excel_data[] = $headings;

		foreach ($data as $data_row) {
			$excel_data[] = array_values($data_row);
		}
		// echo '<pre> '. print_r($excel_data, true ); exit();
		//ob_clean();
		
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->getProperties()->setCreator("MEC"); # change this
		$objPHPExcel->getProperties()->setLastModifiedBy("$user"); # change this
		$objPHPExcel->getProperties()->setTitle("Report"); # change this
		$objPHPExcel->getProperties()->setSubject("Report"); # change this
		$objPHPExcel->getProperties()->setDescription("Report Details"); # change this
		$objPHPExcel->getActiveSheet()->fromArray($excel_data, null, 'A1');
		header("Content-Type: application/xlsx");
		header("Content-Disposition: attachment; filename=$action Report Data.xlsx"); # change this
		header("Pragma: no-cache");
		header("Expires: 0");
		// Redirect output to a client’s web browser (Excel2007)
		/*header('Content-Type: application/octet-stream');
		header("Content-Disposition: attachment;filename=$action Report Data.xlsx");
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: no-cache'); // HTTP/1.0*/
		$highestColumn = $objPHPExcel->getActiveSheet()->getHighestDataColumn();
		$nCols = PHPExcel_Cell::columnIndexFromString($highestColumn);
		
		foreach (range(0, $nCols) as $col) {
			$objPHPExcel->getActiveSheet()->getColumnDimensionByColumn($col)->setWidth(30);                
		}
		$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
		// ob_end_clean();
		if ($objWriter->save('php://output')) {
			return true;
			echo 'Success';
			//redirect('products', 'refresh');
		}else{
			return false;
			echo 'failed';
			//$this->session->set_flashdata('error', 'Stock Import failed');
			//redirect('products', 'refresh');
		}
	}
	
	public function createPath($path) {
        if (is_dir($path)) return true;
        $prev_path = substr($path, 0, strrpos($path, '/', -2) + 1 );
        $return = $this->createPath($prev_path);
        return ($return && is_writable($prev_path)) ? mkdir($path) : false;
    }

    public function get_student_general_info($id)
    {
        $this->db->select('u.id as user_pk_id,u.first_name,u.last_name,u.mobile,u.alt_mobile,u.dob,u.pob,u.email,u.gender,u.nationality,u.blood_group,u.religion,u.created,u.addresses_id, a.address_1,a.address_2,a.city,a.pincode,a.district,s.id as state,s.name as state_name,c.id as country,c.name as country_name,r.ind_nri_status,r.category,r.other_source,r.source,r.co_curricular,r.preferred_loc,r.phc,r.application_number,d.file_location, d.doc_name, d.document_type,d.document_no')
        ->from('users u')
        ->join('addresses a', 'u.addresses_id = a.id','left')        
        ->join('state s', 's.id = a.state_id','left')      
        ->join('country c', 'c.id = s.country_id','left')
        ->join('registration r', 'u.id = r.user_id','left')
        ->join('document d', 'd.user_id = u.id','left')
        // ->where('d.document_type = "proof"')
        ->where('u.id = '.$id); 
        $query = $this->db->get();
        return $query->row(); 
    }
    public function get_student_photo($id)
    {
        $this->db->select('d.file_location, d.doc_name, d.document_type,d.document_no')
        ->from('users u')
        ->join('document d', 'd.user_id = u.id')
        ->where('d.document_type = "photo"')
        ->where('u.id = '.$id); 
        $query = $this->db->get();
        return  ($query->num_rows() == 1) ? $query->row() : false;
    }
    public function get_course_pref_info($id)
    {
        $this->db->select('d.id as dep_id, d.name, d.code, c.id as co_id,c.code as course_code, o.course_id, o.department_id, o.user_id, o.preferred_order')
            ->from('course_pref_order o')
            ->join('department d','o.department_id  = d.id')
            ->join('course c','o.course_id  = c.id')
            ->where('o.user_id = '.$id); 
            $query = $this->db->get();
        return $query->row();
    }
    public function _get_Lists($Table=false,$where=false) {
            $this->db->select('*');
            $this->db->from($Table);
            if($where!="")
            {
                $this->db->where($where);
            }
            $this->db->order_by('name asc');
            $query = $this->db->get();
            if ( $query->num_rows() > 0 )
            {
            $row = $query->result();
            return $row;
            }
        }
	

	/*public function check_existance($)

	{

		$this->db->get()	

	}*/

	

}
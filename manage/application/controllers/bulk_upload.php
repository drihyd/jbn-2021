<?php
 if (!defined('BASEPATH'))
	exit('No direct script access allowed');
class bulk_upload extends CI_Controller {
	function __construct() {
		parent::__construct();
		$this->load->model('mdl_categories');
		$this->load->helper(array(
			'form',
			'email_helper',
			'page_initiater_helper'
		));
		$this->standard_colors = array(
			'blue',
			'red',
			'yellow',
			'green',
			'violet',
			'orange',
			'gray',
			'cream',
			'black',
			'white',
			'pink',
			'brown',
			'multicolor',
			'silver',
			'gold',
			'peach',
			'maroon',
			'beige',
			'purple',
			'rust',
		);
		
		$this->standard_fabrics = array(
			'chanderi',
			'georgette',
			'net',
			'chiffon',
			'crepe',
			'cotton',
			'silk',
			'linen',
			'rayon',
			'jute',
			'satin',
			'banaras',
			'shimmer',
			'kota',
			'brasso',
		);
	}
	
	function index() {
		redirect('bulk_upload/download', 'refresh');
	}
	
	function download() {
		if ($this->session->userdata('logged_in')) {
			$session_data       = $this->session->userdata('logged_in');
			$data['username']   = $session_data['username'];
			$data['user_type']  = $session_data['type'];
			$data['user_email'] = $session_data['email'];
			
			$data['page_name']  = 'Bulk Upload';
			$data['page_title'] = 'Download XLSX File';
			
			$data['sidebar_element']    = 'side-bulk-upload';
			$data['sidebar_subelement'] = 'side-bulk-upload-download';
			
			$categories = $this->mdl_categories->get('id');
			if ($categories->num_rows() == 0) {
				redirect('404', 'refresh');
			} else {
				$categories = $categories->result();
			}
			
			$data['categories'] = $categories;
			
			$this->load->view('header', $data);
			$this->load->view('bulk_upload_download_view', $data);
			$this->load->view('footer', $data);
		} else {
			redirect('login', 'refresh');
		}
	}
	
	function generate_csv() {
	    
	    	require APPPATH . 'controllers/class/PHPExcel.php';
		require_once APPPATH . 'controllers/class/PHPExcel/IOFactory.php';
	    

		$data                       = initiate_page();
		$data['page_name']          = 'Bulk Download';
		$data['page_title']         = 'Bulk Download';
		$data['sidebar_element']    = 'side-bulk-upload';
		$data['sidebar_subelement'] = 'side-bulk-upload-download';
		$data['seo_title']          = 'Bulk Download';
		$data['seo_description']    = '';
		$data['seo_keywords']       = '';
		
		

		
		$category = $this->input->post('uploadCategory');
		
		$check = $this->db->get_where('categories', array(
			'id' => $category
		));
		if ($check->num_rows() == 0) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Please choose a valid category</div>");
			redirect('bulk_upload/download', 'refresh');
		}
		
		$category         = $check->row();
		$data['category'] = $category;
		
		


		$sql = "
		SELECT `products`.*,
			group_concat( DISTINCT CONCAT(`skus`.`sku_code`, ',', `skus`.`size`, ',', `skus`.`price`, ',', `skus`.`price_inr`, ',', `skus`.`price_usd`, ',', `skus`.`stock`) SEPARATOR '||') as 'sku_array',
			group_concat(DISTINCT CONCAT(`product_attrs`.`attribute_name`, ';', `product_attrs`.`attribute_value`) SEPARATOR '||') as 'attribute_array'
		FROM (`products`)
			LEFT OUTER JOIN `skus` ON `skus`.`product_id` = `products`.`id`
			LEFT OUTER JOIN `product_attrs` ON `product_attrs`.`product_id` = `products`.`id`
		WHERE `products`.`cat_id` = {$category->id}
			GROUP BY `products`.`id` ";
		
		
	
		$check = $this->db->query($sql);
		
		$products = array();
		if ($check->num_rows() > 0) {
			$products = $check->result();
		}
	

		$attribute_ids = explode(',', $category->applicable_attributes);
		if (count($attribute_ids) > 0) {
			$this->db->where_in('id', $attribute_ids);
			$check                 = $this->db->get('attributes');
			$applicable_attributes = array();
			$attribute_names       = array();
			
			if ($check->num_rows() > 0) {
				$applicable_attributes = $check->result();
			}
			
			foreach ($applicable_attributes as $attribute) {
				array_push($attribute_names, strtolower($attribute->attr_name));
			}
			
		} else {
			$attribute_names = array();
		}
		
	
	
		
		
		$excel_data = array();
		
		$csv_headings = array(
			'category_name',
			'sub_category_name',
			'product_code',
			'product_name',
			'product_description',
			'unstitched (yes/no)',
			'price_inr',
			'price_usd'	
		);

		$size_columns = array();

		$size_columns = $this->mdl_categories->get_size_columns($category->slug);
		
		

		$csv_headings = array_merge($csv_headings, $size_columns, $attribute_names);		
	
		array_push($excel_data, $csv_headings);
	
		$data_body = array();
		
		$category_name     = strtolower($category->name);
		$sub_category_name = '';
		
	
		
	
		foreach ($products as $product) {
			
			$row = array();
			
			$skus       = explode('||', $product->sku_array);
			$attributes = explode('||', $product->attribute_array);
			
			
			
			$category_name       = $category_name;
			$sub_category_name   = $sub_category_name;
			$product_code        = $product->code;
			$product_name        = strtolower($product->name);
			$product_description = $product->desc;
			if ($product->unstitched) {
				$product_unstitched = 'yes';
			} else {
				$product_unstitched = 'no';
			}
			$price_inr = $product->price_inr;
			$price_usd = $product->price_usd;
			
		

		$sizes_columns = $this->mdl_categories->get_size_columns($category->slug);

		

		foreach ($sizes_columns as $key => $column) {
			if (strpos($column, 'price') !== false) {
			    ${$column} = 0;
			}else{
				${$column} = '';
			}
		}
		
	
			foreach ($skus as $sku) {
				$sku = explode(',', $sku);
				
				$sku_code      = $sku[0];
				$sku_size      = $sku[1];
				$sku_price     = $sku[2];
				$sku_price_inr = $sku[3];
				$sku_price_usd = $sku[4];
				$sku_stock     = $sku[5];
				
				if ($category->slug == 'kids-wear'){					
					if (strpos(strtolower($sku_size), 'kid') === 0) {
						$sku_size = strtolower($sku_size);
					}else{
						$sku_size = 'kid_'.$sku_size;
					}					
				}
				$test = array();

				$test[] = $code_variable      = strtolower($sku_size) . '_size_SKU_code';
				$test[] =$price_variable     = strtolower($sku_size) . '_size_SKU_price';
				$test[] =$price_inr_variable = strtolower($sku_size) . '_size_SKU_price_inr';
				$test[] =$price_usd_variable = strtolower($sku_size) . '_size_SKU_price_usd';
				$test[] =$stock_variable     = strtolower($sku_size) . '_size_SKU_stock';
						
				if ($sku_code != '0') {
					
					${$code_variable}      = $sku_code;
					${$price_variable}     = $sku_price;
					${$price_inr_variable} = $sku_price_inr;
					${$price_usd_variable} = $sku_price_usd;
					${$stock_variable}     = $sku_stock;
					
				}
				
			}
			
			array_push($row, 
				#pushing below fields into $row:
				$category_name,
				$sub_category_name,
				$product_code,
				$product_name,
				$product_description,
				$product_unstitched,
				$price_inr,
				$price_usd		
				
			);

			$size_columns = array();
			$size_columns = $this->mdl_categories->get_size_columns($category->slug);

	        foreach ($size_columns as $key => $column) {
	            $row[] = ${$column};
	        }

			$attribute_index     = array();
			$attribute_name_list = array();
			foreach ($attributes as $attribute) {
				
				$attribute = explode(';', $attribute);
				
				$attribute_name  = $attribute[0];
				$attribute_value = $attribute[1];
				
				array_push($attribute_name_list, trim(strtolower($attribute_name)));
				$attribute_index[trim(strtolower($attribute_name))] = $attribute_value;
			}
			
			foreach ($attribute_names as $name) {
				$name = trim(strtolower($name));
				if (in_array($name, $attribute_name_list)) {
					array_push($row, $attribute_index[$name]);
				} else {
					array_push($row, '');
				}
			}
			
			array_push($excel_data, $row);
			
		}
		
	
		//print_r($excel_data);
		



				
	
		
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->getProperties()->setCreator("Taruni");
		$objPHPExcel->getProperties()->setLastModifiedBy("Taruni");
		$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
		$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");
		$objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");
		
		$objPHPExcel->getActiveSheet()->fromArray($excel_data, null, 'A1');
		
		
		header("Content-Type: application/xlsx");
		header("Content-Disposition: attachment; filename=Taruni_{$category->name}_products_list.xlsx");
		header("Pragma: no-cache");
		header("Expires: 0");
		
		
		
		
		$highestColumn = $objPHPExcel->getActiveSheet()->getHighestDataColumn();
		$nCols         = PHPExcel_Cell::columnIndexFromString($highestColumn);
		
		foreach (range(0, $nCols) as $col) {
			$objPHPExcel->getActiveSheet()->getColumnDimensionByColumn($col)->setWidth(30);
		}
		
		$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
		$objWriter->save('php://output');
		exit();
		
   	}
   	
   	

	
	function upload() {

		//if ($this->session->userdata('logged_in')) {
			$session_data       = $this->session->userdata('logged_in');
			$data['username']   = $session_data['username'];
			$data['user_type']  = $session_data['type'];
			$data['user_email'] = $session_data['email'];
			
			$data['page_name'] = 'products';
			
			$data['sidebar_element']    = 'side-bulk-upload';
			$data['sidebar_subelement'] = 'side-bulk-upload-upload';
			
			$categories = $this->mdl_categories->get('id');
			if ($categories->num_rows() == 0) {
				redirect('404', 'refresh');
			} else {
				$categories = $categories->result();
			}
			
			$data['categories'] = $categories;
			
			$data['page_title'] = 'Upload xlsx';
			
			$this->load->view('header', $data);
			$this->load->view('bulk_upload_upload_view', $data);
			$this->load->view('footer', $data);
			/*
		} else {
			redirect('login', 'refresh');
		}
		*/
	}
	
	function import_bulk_data() {
		//if ($this->session->userdata('logged_in')) {
			$session_data       = $this->session->userdata('logged_in');
			$data['username']   = $session_data['username'];
			$data['user_type']  = $session_data['type'];
			$data['user_email'] = $session_data['email'];
			
			$data['page_name'] = 'products';
			
			$data['sidebar_element']    = 'side-bulk-upload';
			$data['sidebar_subelement'] = 'side-bulk-upload-upload';
			
			$uploadCategory = $this->input->post('uploadCategory', true);
			
			$query = $this->db->get_where('categories', array(
				'id' => $uploadCategory
			));
			if ($query->num_rows() == 0) {
				$this->session->set_flashdata('form-after-message', "<div class='alert alert-danger alert-dismissible fade in' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button><strong>Error! Invalid Category.</strong></div>");
				redirect("bulk_upload/upload");
			}
			
			$data['uploadCategory'] = $uploadCategory;
			
			$config['upload_path']   = '../assets/uploads/bulk_upload';
			$config['allowed_types'] = '*';
			$config['file_name']     = 'bulk_upload.xlsx';
			$config['overwrite']     = TRUE;
			
			$this->load->library('upload', $config);
			if ($_FILES['bulkUploadFile']['size'] == 0):
			//redirect('404', 'refresh');
				$this->session->set_flashdata('form-after-message', "<div class='alert alert-danger alert-dismissible fade in' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button><strong>Error! Please upload a file.</strong></div>");
				redirect("bulk_upload/upload");
			endif;
			
			if (!$this->upload->do_upload('bulkUploadFile')) {
				$data['uploadErrors'] = $this->upload->display_errors();
				//echo $data['uploadErrors'] . '<br />';
				//echo "<a href='{$this->config->base_url() }products/edit/{$id}?tab=productpics'>Please try again</a>";
				$this->session->set_flashdata('form-after-message', "<div class='alert alert-danger alert-dismissible fade in' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button><strong>{$this->upload->display_errors()}</strong></div>");
				redirect("bulk_upload/upload");
			} else {
				$res = $this->upload->data();
				// $this->session->set_flashdata('form-after-message', "<div class='alert alert-success alert-dismissible fade in' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button><strong>File uploaded successfully.</strong></div>");
				redirect("bulk_upload/import_to_db/{$uploadCategory}", 'refresh');
				// $this->import_to_db($uploadCategory);
			}
			
		/*	
		} else {
			redirect('login', 'refresh');
		}
		*/
	}
	
	function import_to_db($category_id) {
		$data                       = initiate_page();
		$data['page_name']          = 'Bulk Upload';
		$data['page_title']         = 'Bulk Upload';
		$data['sidebar_element']    = 'side-bulk-upload';
		$data['sidebar_subelement'] = 'side-bulk-upload';
		$data['seo_title']          = 'Bulk Upload';
		$data['seo_description']    = '';
		$data['seo_keywords']       = '';
		
		$check = $this->db->get_where('categories', array(
			'id' => $category_id
		));
		if ($check->num_rows() == 0) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! Invalid Category</div>");
			redirect('bulk_upload/upload');
		}
		
		$category               = $check->row();
		$data['uploadCategory'] = $category;
		
		$path     = '../assets/uploads/bulk_upload/bulk_upload.xlsx';
		$path_csv = '../assets/uploads/bulk_upload/bulk_upload.csv';
		
		require APPPATH . 'controllers/class/PHPExcel.php';
		require_once APPPATH . 'controllers/class/PHPExcel/IOFactory.php';
		$objPHPExcel = PHPExcel_IOFactory::load($path);
		$writer      = PHPExcel_IOFactory::createWriter($objPHPExcel, 'CSV');
		$writer->save($path_csv);
		$file = $path_csv;
		
		ini_set('auto_detect_line_endings', TRUE);
		$handle = fopen($file, 'r');
		if (($csv_data = fgetcsv($handle)) === FALSE) {
			echo "Cannot read from CSV file: {$file}";
			die();
		}
		
		// get the field structure from the CSV file
		$fields      = array();
		$field_count = 0;
		
		for ($i = 0; $i < count($csv_data); $i++) {
			$field_text = strtolower(trim($csv_data[$i]));
			
			if ($field_text != '') {
				$field_name = substr(preg_replace('/[^0-9a-z]/', '_', $field_text), 0, 100);
				$field_count++;
				$fields[] = $field_name . ' TEXT';
			}
		}
		
		// create temp table with above fields
		$table = 'temp_table';
		$this->load->dbforge();
		$this->dbforge->drop_table($table);
		
		$sql = "CREATE TABLE {$table} (" . implode(',', $fields) . ")";
		$this->db->query($sql);
		$values_array = array();
		while (($csv_data = fgetcsv($handle)) !== FALSE) {
			$values = array();
			for ($i = 0; $i < $field_count; $i++) {
				$values[] = "'" . addslashes(trim($csv_data[$i])) . "'";
			}
			if (($values[0] == "''") OR ($values[0] == NULL)) {
				CONTINUE;
			}
			if (count($values) > 0) {
				array_push($values_array, "(" . implode(',', $values) . ")");
			}
		}
		
		if (count($values_array) == 0) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! The sheet is empty</div>");
			redirect('bulk_upload/upload');
		}
		
		$sql = "INSERT into {$table} VALUES " . implode(',', $values_array);
		$this->db->query($sql);
		
		$sql = "ALTER TABLE {$table} ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST, ADD modification_type TEXT";
		$this->db->query($sql);
		
		fclose($handle);
		ini_set('auto_detect_line_endings', FALSE);
		
		$this->db->truncate('temp_products');
		$this->db->truncate('temp_skus');
		$this->db->truncate('temp_product_attributes');
		
		$products = array();
		$check    = $this->db->get('temp_table');
		if ($check->num_rows() > 0) {
			$products = $check->result();
		}
		
		$table_columns = $this->db->list_fields('temp_table');
		$num_columns   = count($table_columns);
		
		foreach ($products as $product) {
			if (trim(strtolower($product->category_name)) != trim(strtolower($category->name))) {
				$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! The sheet contains a product belonging to category '{$product->category_name}'. Please include products belonging only to the selected category '{$category->name}'</div>");
				redirect('bulk_upload/upload', 'refresh');
			}
		}
		
		$new_products_data = array();
		$products_in_sheet = array();
		
		foreach ($products as $product) {
			
			$modif_status      = 'new';
			$actual_product_id = 0;
			$this->db->select('id');
			$this->db->from('products');
			$this->db->where('code', $product->product_code);
			$check = $this->db->get();
			
			if ($check->num_rows() > 0) {
				$modif_status      = 'existing';
				$actual_product_id = $check->row()->id;
				array_push($products_in_sheet, $actual_product_id);
			}
			
			$unstitched = 1;
			if ($product->unstitched__yes_no_ != 'yes') {
				$unstitched = 0;
			}
			
			$new_data = array();
			
			$new_data[] = "'" . addslashes($actual_product_id) . "'";
			$new_data[] = "'" . addslashes($product->product_name) . "'";
			$new_data[] = "'" . addslashes($product->product_code) . "'";
			$new_data[] = "'" . addslashes($category->id) . "'";
			$new_data[] = "'" . addslashes($product->product_description) . "'";
			$new_data[] = "'" . addslashes($unstitched) . "'";
			$new_data[] = "'" . addslashes($product->price_inr) . "'";
			$new_data[] = "'" . addslashes($product->price_usd) . "'";
			$new_data[] = "'" . addslashes($modif_status) . "'";
			$new_data[] = "'" . addslashes(0) . "'";
			
			array_push($new_products_data, '(' . implode(',', $new_data) . ')');
		}
		
		$sql = "INSERT INTO `temp_products` (`actual_product_id`, `name`, `code`, `cat_id`, `desc`, `unstitched`, `price_inr`, `price_usd`, `modif_status`, `approved`) VALUES " . implode(',', $new_products_data);
		$this->db->query($sql);
		
		$sql   = "SELECT code, COUNT(*) c FROM `temp_products` GROUP BY code HAVING c > 1;";
		$check = $this->db->query($sql);
		
		if ($check->num_rows() > 0) {
			$duplicate_products = "<ul>";
			foreach ($check->result() as $product) {
				$duplicate_products .= "<li>{$product->code} ({$product->c} times)</li>";
			}
			$duplicate_products .= "</ul>";
			
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! Please enter unique Products Codes. The following Products have duplicate codes:<br>{$duplicate_products}</div>");
			redirect('bulk_upload/upload');
		}
		
		$new_skus_data = array();
		
		foreach ($products as $product) {
			
			$temp_product      = $this->db->get_where('temp_products', array(
				'code' => $product->product_code
			))->row();
			$temp_product_id   = $temp_product->id;
			$actual_product_id = $temp_product->actual_product_id;
			
			$sizes = $this->mdl_categories->get_cat_sizes($category->slug);

			foreach ($sizes as $size) {
				
				$pure_size = $size;
				
				//if ($size != 'unstitched') {
					//$size = $size . '_size';
				//}
				$size = $size . '_size';
				
				$sku_variable           = $size . '_sku';
				$code_variable          = $size . '_sku_code';
				$size_variable          = $size . '_sku_size';
				//$price_variable       = $size . '_sku_price';
				$price_inr_variable     = $size . '_sku_price_inr';
				$price_usd_variable     = $size . '_sku_price_usd';
				$stock_variable         = $size . '_sku_stock';
				$product_id_variable    = $size . '_sku_product_id';
				$cat_id_variable        = $size . '_sku_cat_id';
				$modif_status_variable  = $size . '_sku_modif_status';
				$actual_sku_id_variable = 'actual' . $size . '_size_sku_id';
				
				$code = trim($product->$code_variable);
				
				if ($code != '') {
					
					if ($actual_product_id != 0) {
						$this->db->select('id');
						$this->db->from('skus');
						$this->db->where('size', $pure_size);
						$this->db->where('product_id', $actual_product_id);
						$check = $this->db->get();
						if ($check->num_rows() > 0) {
							$$actual_sku_id_variable = $check->row()->id;
							$$modif_status_variable  = 'existing';
						} else {
							$$actual_sku_id_variable = 0;
							$$modif_status_variable  = 'new';
						}
						
					} else {
						$$actual_sku_id_variable = 0;
						$$modif_status_variable  = 'existing';
					}
					
					$$code_variable   = $product->$code_variable;
					$$size_variable   = $pure_size;
					//$$price_variable = $product->$price_variable;
					$$price_inr_variable = $product->$price_inr_variable;
					$$price_usd_variable = $product->$price_usd_variable;
					$$stock_variable  = $product->$stock_variable;
					$$cat_id_variable = $category->id;
					
					$new_data   = array();
					//$new_data[] = "'" . "'";
					$new_data[] = "'" . addslashes($$actual_sku_id_variable) . "'";
					$new_data[] = "'" . addslashes($$code_variable) . "'";
					$new_data[] = "'" . addslashes($temp_product_id) . "'";
					$new_data[] = "'" . addslashes($actual_product_id) . "'";
					$new_data[] = "'" . addslashes($category->id) . "'";
					$new_data[] = "'" . addslashes($pure_size) . "'";
					//$new_data[] = "'" . addslashes($$price_variable) . "'";
					$new_data[] = "'" . addslashes($$price_inr_variable) . "'";
					$new_data[] = "'" . addslashes($$price_usd_variable) . "'";
					$new_data[] = "'" . addslashes($$stock_variable) . "'";
					$new_data[] = "'" . addslashes($$modif_status_variable) . "'";
					$new_data[] = "'" . addslashes(0) . "'";
					
					array_push($new_skus_data, '(' . implode(',', $new_data) . ')');
				}
			}
			
		}
		
		$sql = "INSERT INTO `temp_skus` (`actual_sku_id`, `sku_code`, `temp_product_id`, `actual_product_id`, `cat_id`, `size`, `price_inr`, `price_usd`, `stock`, `modif_status`, `approved`) VALUES " . implode(',', $new_skus_data);
		$this->db->query($sql);
		
		$sql   = "SELECT temp_product_id, sku_code, COUNT(*) c FROM `temp_skus` GROUP BY sku_code HAVING c > 1;";
		$check = $this->db->query($sql);
		
		if ($check->num_rows() > 0) {
			$duplicate_skus = "<ul>";
			foreach ($check->result() as $sku) {
				$duplicate_skus .= "<li>{$sku->sku_code} ({$sku->c} times)</li>";
			}
			$duplicate_skus .= "</ul>";
			
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! Please enter unique SKU codes. The following SKUs have duplicate codes:<br>{$duplicate_skus}</div>");
			redirect('bulk_upload/upload');
		}
		
		$new_attributes_data = array();
		
		$wrong_colors_array  = array();
		$wrong_fabrics_array = array();
		
		foreach ($products as $product) {
			
			$temp_product      = $this->db->get_where('temp_products', array(
				'code' => $product->product_code
			))->row();
			$temp_product_id   = $temp_product->id;
			$actual_product_id = $temp_product->actual_product_id;
			
			$attr_pos = array_search('unstitched_size_sku_price_usd', $table_columns) + 1;
			$nFields  = count($table_columns);
			
			for ($i = $attr_pos; $i < $nFields - 1; $i++) {
				$attribute_name  = str_replace('_', ' ', $table_columns[$i]);
				$attribute_value = $product->$table_columns[$i];
				
				if ($attribute_value == '') {
					CONTINUE;
				}
				
				if ($attribute_name == 'color') {
					$color_check_array = explode(',', $attribute_value);
					foreach ($color_check_array as $color_check) {
						$color_check = trim(strtolower($color_check));
						if (!in_array($color_check, $this->standard_colors)) {
							$message = $category->name . ' ' . $color_check . "\n\n";
							$path    = APPPATH . 'logs/';
							if (!file_exists($path)) {
								mkdir($path, 0755, true);
							}
							$log_file = $path . '/color_logs.log';
							error_log($message, 3, $log_file);
							array_push($wrong_colors_array, $color_check);
						}
					}
				}
				
				if ($attribute_name == 'fabric') {
					$color_check_array = explode(',', $attribute_value);
					foreach ($color_check_array as $color_check) {
						$color_check = trim(strtolower($color_check));
						if (!in_array($color_check, $this->standard_fabrics)) {
							array_push($wrong_fabrics_array, $color_check);
						}
					}
				}
			}
		}
		
		$color_message = '';
		if (count($wrong_colors_array) > 0) {
			$i = 0;
			foreach ($wrong_colors_array as $c) {
				if ($i > 100) {
					BREAK;
				}
				$color_message .= "{$c}, ";
				$i += 1;
			}
		}
		
		if ($color_message != '') {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error!<br>{$color_message}</div>");
			redirect('bulk_upload/upload', 'refresh');
		}
		
		$fabric_message = '';
		if (count($wrong_fabrics_array) > 0) {
			$i = 0;
			foreach ($wrong_fabrics_array as $c) {
				if ($i > 100) {
					BREAK;
				}
				$fabric_message .= "{$c}, ";
				$i += 1;
			}
		}
		
		if ($fabric_message != '') {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error!<br>{$fabric_message}</div>");
			redirect('bulk_upload/upload', 'refresh');
		}
		
		foreach ($products as $product) {
			
			$temp_product      = $this->db->get_where('temp_products', array(
				'code' => $product->product_code
			))->row();
			

			$temp_product_id   = $temp_product->id;
			$actual_product_id = $temp_product->actual_product_id;
			
		
			
			$attr_pos = array_search('unstitched_size_sku_price_usd', $table_columns) + 1;
			$nFields  = count($table_columns);

			for ($i = $attr_pos; $i < $nFields - 1; $i++) {

				$attribute_name  = str_replace('_', ' ', $table_columns[$i]);
				$att_name = $table_columns[$i];

				$attribute_value = $product->$att_name;
				
				if ($attribute_value == '') {
					CONTINUE;
				}
				
				$this->db->select('id');
				$this->db->from('product_attrs');
				$this->db->where('product_id', $actual_product_id);
				$this->db->where('attribute_name', $attribute_name);
				$this->db->where('attribute_value', $attribute_value);
				$check = $this->db->get();
				
				if ($check->num_rows() > 0) {
					$modif_status   = 'existing';
					$actual_attr_id = $check->row()->id;
					
			
				} else {
					$actual_attr_id = 0;
				
				}
			
			
				
				$new_data   = array();
				$new_data[] = "'" . "'";
				$new_data[] = "'" . addslashes($actual_attr_id) . "'";
				$new_data[] = "'" . addslashes($actual_product_id) . "'";
				$new_data[] = "'" . addslashes($temp_product_id) . "'";
				$new_data[] = "'" . addslashes($attribute_name) . "'";
				$new_data[] = "'" . addslashes($attribute_value) . "'";
				
				array_push($new_attributes_data, '(' . implode(',', $new_data) . ')');
				
			}
		
		
			
		}
		

		$sql = "INSERT INTO `temp_product_attributes` VALUES " . implode(',', $new_attributes_data);
		$this->db->query($sql);
		
		$products_in_db = array();
		$this->db->select('id');
		$this->db->where('cat_id', $category->id);
		$check = $this->db->get('products');
		if ($check->num_rows() > 0) {
			foreach ($check->result() as $db_product) {
				array_push($products_in_db, $db_product->id);
			}
		}
		
		$to_be_deleted_ids         = array_diff($products_in_db, $products_in_sheet);
		$data['to_be_deleted_ids'] = $to_be_deleted_ids;
		
		$temp_products = $this->db->get('temp_products');
		if ($temp_products->num_rows() > 0) {
			$temp_products = $temp_products->result();
		}
		$data['temp_products'] = $temp_products;
		
		$temp_skus = $this->db->get('temp_skus');
		if ($temp_skus->num_rows() > 0) {
			$temp_skus = $temp_skus->result();
		}
		$data['temp_skus'] = $temp_skus;
		
		$this->load->view('header', $data);
		$this->load->view('import_to_db_view', $data);
		$this->load->view('footer', $data);
	}
	
	function confirm_import($category_id) {
		
		$data                       = initiate_page();
		$data['page_name']          = 'Import to DB';
		$data['page_title']         = 'Import to DB';
		$data['sidebar_element']    = 'side-bulk-upload';
		$data['sidebar_subelement'] = 'side-bulk-upload';
		$data['seo_title']          = 'Import to DB';
		$data['seo_description']    = '';
		$data['seo_keywords']       = '';
		
		$slug_records = array();
		
		$check = $this->db->get_where('categories', array(
			'id' => $category_id
		));
		if ($check->num_rows() == 0) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! Invalid Category</div>");
			redirect('bulk_upload/upload');
		}
		
		$category               = $check->row();
		$data['uploadCategory'] = $category;
		
		$approvedIDs = $this->input->post('approvedIDs', TRUE);
		
		if ((!is_array($approvedIDs)) OR (empty($approvedIDs))) {
			$this->session->set_flashdata('message', "<div class='alert alert-danger'>Error! No IDs were approved</div>");
			redirect("bulk_upload/import_to_db/{$category->id}");
		}
		
		
		// DELETING PRODUCTS
		
		$products_in_sheet = $this->db->get('temp_products')->result();
		$products_in_db    = $this->db->get_where('products', array(
			'cat_id' => $category->id
		))->result();
		
		$sheet_product_ids = array();
		$db_product_ids    = array();
		
		foreach ($products_in_sheet as $product) {
			array_push($sheet_product_ids, $product->actual_product_id);
		}
		
		foreach ($products_in_db as $product) {
			array_push($db_product_ids, $product->id);
		}
		
		$to_be_deleted_ids = array_diff($db_product_ids, $sheet_product_ids);
		
		if (count($to_be_deleted_ids) > 0) {
			
			$this->db->where_in('product_id', $to_be_deleted_ids);
			$this->db->delete('skus');
			
			$this->db->where_in('product_id', $to_be_deleted_ids);
			$this->db->delete('product_attrs');
			
			$this->db->where_in('product_id', $to_be_deleted_ids);
			$this->db->delete('tagged_products');
			
			$this->db->where_in('product_id', $to_be_deleted_ids);
			$this->db->delete('discounted_products');
			
			$this->db->where_in('id', $to_be_deleted_ids);
			$this->db->delete('products');
			
		}
		
		
		// DELETED SKUs
		
		$skus_in_sheet = $this->db->get('temp_skus')->result();
		$skus_in_db    = $this->db->get_where('skus', array(
			'cat_id' => $category->id
		))->result();
		
		$sheet_sku_ids = array();
		$db_sku_ids    = array();
		
		foreach ($skus_in_sheet as $sku) {
			array_push($sheet_sku_ids, $sku->actual_sku_id);
		}
		
		foreach ($skus_in_db as $sku) {
			array_push($db_sku_ids, $sku->id);
		}
		
		$to_be_deleted_sku_ids = array_diff($db_sku_ids, $sheet_sku_ids);
		
		if (count($to_be_deleted_sku_ids) > 0) {
			$this->db->where_in('id', $to_be_deleted_sku_ids);
			$this->db->delete('skus');
		}
		
		
		// DELETED Attributes
		
		if( ! empty($db_product_ids)) {
			
			$attrs_in_sheet = $this->db->get('temp_product_attributes')->result();
			
			$this->db->where_in('product_id', $db_product_ids);
			$attrs_in_db = $this->db->get('product_attrs')->result();
			
			$sheet_attr_ids = array();
			$db_attr_ids    = array();
			
			foreach ($attrs_in_sheet as $attr) {
				array_push($sheet_attr_ids, $attr->actual_attr_id);
			}
			
			foreach ($attrs_in_db as $attr) {
				array_push($db_attr_ids, $attr->id);
			}
			
			$to_be_deleted_attr_ids = array_diff($db_attr_ids, $sheet_attr_ids);
			
			if (count($to_be_deleted_attr_ids) > 0) {
				$this->db->where_in('id', $to_be_deleted_attr_ids);
				$this->db->delete('product_attrs');
			}
			
		}
		
		// EXISTING PRODUCTS
		
		$existing_products = array();
		$this->db->where('actual_product_id !=', 0);
		$check = $this->db->get('temp_products');
		if ($check->num_rows() > 0) {
			$existing_products = $check->result();
		}
		
		$new_skus_data  = array();
		$new_attrs_data = array();
		
		
		foreach ($existing_products as $product) {
			
			$i         = 2;
			$orig_slug = strtolower(preg_replace("![^a-z0-9]+!i", "-", $product->name));
			$slug      = $orig_slug;
			
			while (($this->db->get_where('products', array(
				'slug' => $slug,
				'id !=' => $product->actual_product_id
			))->num_rows() > 0) OR (in_array($slug, $slug_records))) {
				$slug = $orig_slug . '-' . $i;
				$i += 1;
			}
			array_push($slug_records, $slug);
			
			$this->db->set('slug', $slug);
			$this->db->where('id', $product->id);
			$this->db->update('temp_products');
			
			$this->db->set('slug', $slug);
			$this->db->where('id', $product->actual_product_id);
			$this->db->update('products');
			
			$actual_product_id = $product->actual_product_id;
			
			$skus = array();
			$this->db->where('temp_product_id', $product->id);
			$this->db->where('actual_sku_id', 0);
			$check = $this->db->get('temp_skus');
			if ($check->num_rows() > 0) {
				$skus = $check->result();
				
				foreach ($skus as $sku) {
					
					$new_data   = array();
					$new_data[] = "'" . addslashes($sku->sku_code) . "'";
					$new_data[] = "'" . addslashes($actual_product_id) . "'";
					$new_data[] = "'" . addslashes($sku->cat_id) . "'";
					$new_data[] = "'" . addslashes($sku->size) . "'";
					$new_data[] = "'" . addslashes($sku->price) . "'";
					$new_data[] = "'" . addslashes($sku->price_inr) . "'";
					$new_data[] = "'" . addslashes($sku->price_usd) . "'";
					$new_data[] = "'" . addslashes($sku->stock) . "'";
					
					array_push($new_skus_data, '(' . implode(',', $new_data) . ')');
				}
			}
			
			$attrs = array();
			$this->db->where('temp_product_id', $product->id);
			$this->db->where('actual_attr_id', 0);
			$check = $this->db->get('temp_product_attributes');
			if ($check->num_rows() > 0) {
				
				$attrs = $check->result();
				
				foreach ($attrs as $attr) {
					
					$new_data   = array();
					$new_data[] = "'" . addslashes($actual_product_id) . "'";
					$new_data[] = "'" . addslashes($attr->attribute_name) . "'";
					$new_data[] = "'" . addslashes($attr->attribute_value) . "'";
					
					array_push($new_attrs_data, '(' . implode(',', $new_data) . ')');
				}
				
			}
			
		}
		
		if (count($new_skus_data) > 0) {
			$sql = "INSERT INTO `skus` (`sku_code`, `product_id`, `cat_id`, `size`, `price`, `price_inr`, `price_usd`, `stock`) VALUES " . implode(',', $new_skus_data);
			$this->db->query($sql);
		}
		
		if (count($new_attrs_data) > 0) {
			$sql = "INSERT INTO `product_attrs` (`product_id`, `attribute_name`, `attribute_value`) VALUES " . implode(',', $new_attrs_data);
			$this->db->query($sql);
		}
		
		// UPDATE EXISTING PRODUCTS
		
		$sql = "
			UPDATE
			
			products as p, 
			temp_products as tp 
			
			SET 
				
				p.`name` = tp.name,
				p.`code` = tp.code,
				p.`cat_id` = tp.cat_id,
				p.`desc` = tp.desc,
				p.`unstitched` = tp.unstitched,
				p.`price_inr` = tp.price_inr,
				p.`price_usd` = tp.price_usd,
				p.`slug` = tp.`slug`
				
			WHERE 
				
				p.id = tp.actual_product_id
		
		";
		$this->db->query($sql);
		
		
		// UPDATE EXISTING SKUS
		
		// stock logging
		$existing_skus = array();
		$this->db->where('actual_sku_id !=', 0);
		$check               = $this->db->get('temp_skus');
		$stock_update_data   = array();
		$updated_product_ids = array();
		
		if ($check->num_rows() > 0) {
			
			foreach ($check->result() as $temp_sku) {
				$this->db->where('id', $temp_sku->actual_sku_id);
				$actual_sku = $this->db->get('skus');
				if ($actual_sku->num_rows() == 0) {
					CONTINUE;
				}
				$actual_sku = $actual_sku->row();
				if ($temp_sku->stock != $actual_sku->stock) {
					$new_data   = array();
					$new_data[] = "`modified_by_user_id` = '" . addslashes($data['user_id']) . "'";
					$new_data[] = "`modified_from_ip` = '" . addslashes($this->input->ip_address()) . "'";
					$new_data[] = "`modified_date` = '" . addslashes(date('Y-m-d H:i:s', time())) . "'";
					
					array_push($stock_update_data, implode(',', $new_data));
					array_push($updated_product_ids, $actual_sku->product_id);
				}
			}
			
			if (count($stock_update_data) > 0) {
				$sql = "UPDATE `stock_logs` SET " . $stock_update_data[0] . " WHERE `product_id` in (" . implode(',', $updated_product_ids) . ")";
				$this->db->query($sql);
			}
			
		}
		
		$sql = "
			UPDATE
			
			skus as s, 
			temp_skus as ts 
			
			SET 
				
				s.`sku_code` = ts.sku_code,
				s.`product_id` = ts.actual_product_id,
				s.`cat_id` = ts.cat_id,
				s.`size` = ts.size,
				s.`price` = ts.price,
				s.`price_inr` = ts.price_inr,
				s.`price_usd` = ts.price_usd,
				s.`stock` = ts.`stock`
				
			WHERE 
				
				s.id = ts.actual_sku_id
		
		";
		$this->db->query($sql);
		
		// UPDATE EXISTING ATTRIBUTES
		
		$sql = "
			UPDATE
			
			product_attrs as a, 
			temp_product_attributes as ta 
			
			SET 
				
				a.`attribute_name` = ta.attribute_name,
				a.`attribute_value` = ta.attribute_value
				
			WHERE 
				
				a.id = ta.actual_attr_id
		
		";
		$this->db->query($sql);
		
		
		
		// NEW PRODUCTS
		
		$new_products = array();
		$this->db->where('actual_product_id', 0);
		$check = $this->db->get('temp_products');
		if ($check->num_rows() > 0) {
			$new_products = $check->result();
		}
		
		$new_products_data = array();
		$new_skus_data     = array();
		$new_attrs_data    = array();
		
		if (count($new_products) > 0) {
			foreach ($new_products as $product) {
				
				$i         = 2;
				$orig_slug = strtolower(preg_replace("![^a-z0-9]+!i", "-", $product->name));
				$slug      = $orig_slug;
				
				while (($this->db->get_where('products', array(
					'slug' => $slug
				))->num_rows() > 0) OR (in_array($slug, $slug_records))) {
					$slug = $orig_slug . '-' . $i;
					$i += 1;
				}
				array_push($slug_records, $slug);
				
				$new_data   = array();
				$new_data[] = "'" . addslashes($product->name) . "'";
				$new_data[] = "'" . addslashes($product->code) . "'";
				$new_data[] = "'" . addslashes($product->cat_id) . "'";
				$new_data[] = "'" . addslashes($product->desc) . "'";
				$new_data[] = "'" . addslashes($slug) . "'";
				$new_data[] = "'" . addslashes($product->unstitched) . "'";
				$new_data[] = "'" . addslashes($product->price_inr) . "'";
				$new_data[] = "'" . addslashes($product->price_usd) . "'";
				
				array_push($new_products_data, '(' . implode(',', $new_data) . ')');
				
			}
			
			$sql = "INSERT INTO `products` (`name`, `code`, `cat_id`, `desc`, `slug`, `unstitched`, `price_inr`, `price_usd`) VALUES " . implode(',', $new_products_data);
			$this->db->query($sql);
			
			$new_products_data = array();
			
			foreach ($new_products as $product) {
				
				$this->db->where('name', $product->name);
				$this->db->where('code', $product->code);
				$this->db->where('cat_id', $product->cat_id);
				$check = $this->db->get('products');
				if ($check->num_rows() == 0) {
					CONTINUE;
				}
				$actual_product    = $check->row();
				$actual_product_id = $actual_product->id;
				
				$new_data   = array();
				$new_data[] = "'" . addslashes($actual_product->id) . "'";
				$new_data[] = "'" . addslashes($actual_product->code) . "'";
				$new_data[] = "'" . addslashes(date('Y-m-d H:i:s', time())) . "'";
				$new_data[] = "'" . addslashes($data['user_id']) . "'";
				$new_data[] = "'" . addslashes($this->input->ip_address()) . "'";
				
				array_push($new_products_data, '(' . implode(',', $new_data) . ')');
				
				$skus = array();
				$this->db->where('temp_product_id', $product->id);
				$check = $this->db->get('temp_skus');
				if ($check->num_rows() > 0) {
					$skus = $check->result();
					
					foreach ($skus as $sku) {
						
						$new_data   = array();
						$new_data[] = "'" . addslashes($sku->sku_code) . "'";
						$new_data[] = "'" . addslashes($actual_product_id) . "'";
						$new_data[] = "'" . addslashes($sku->cat_id) . "'";
						$new_data[] = "'" . addslashes($sku->size) . "'";
						$new_data[] = "'" . addslashes($sku->price) . "'";
						$new_data[] = "'" . addslashes($sku->price_inr) . "'";
						$new_data[] = "'" . addslashes($sku->price_usd) . "'";
						$new_data[] = "'" . addslashes($sku->stock) . "'";
						
						array_push($new_skus_data, '(' . implode(',', $new_data) . ')');
					}
				}
				
				
				
				
				$attrs = array();
				$this->db->where('temp_product_id', $product->id);
				$check = $this->db->get('temp_product_attributes');
				if ($check->num_rows() > 0) {
					$attrs = $check->result();
					foreach ($attrs as $attr) {
						
						$new_data   = array();
						$new_data[] = "'" . addslashes($actual_product_id) . "'";
						$new_data[] = "'" . addslashes($attr->attribute_name) . "'";
						$new_data[] = "'" . addslashes($attr->attribute_value) . "'";
						
						array_push($new_attrs_data, '(' . implode(',', $new_data) . ')');
					}
				}
				
			}
			
			if (count($new_skus_data) > 0) {
				$sql = "INSERT INTO `skus` (`sku_code`, `product_id`, `cat_id`, `size`, `price`, `price_inr`, `price_usd`, `stock`) VALUES " . implode(',', $new_skus_data);
				$this->db->query($sql);
			}
			
			if (count($new_attrs_data) > 0) {
				$sql = "INSERT INTO `product_attrs` (`product_id`, `attribute_name`, `attribute_value`) VALUES " . implode(',', $new_attrs_data);
				$this->db->query($sql);
			}
			
			if (count($new_products_data) > 0) {
				$sql = "INSERT INTO `stock_logs` (`product_id`, `product_code`, `added_date`, `added_by_user_id`, `added_from_ip`) VALUES " . implode(',', $new_products_data);
				$this->db->query($sql);
			}
		}
		
		$this->tag_kurtis();
		
		$this->load->view('header', $data);
		$this->load->view('confirm_import_view', $data);
		$this->load->view('footer', $data);
		
	}
	
	function tag_kurtis() {
		$data = initiate_page();
		
		$check = $this->db->get_where('categories', array(
			'slug' => 'kurtis'
		));
		if ($check->num_rows() == 0) {
			return;
		}
		
		$kurtis_cat_id = $check->row()->id;
		
		$kurti_products = array();
		$check          = $this->db->get_where('products', array(
			'cat_id' => $kurtis_cat_id
		));
		if ($check->num_rows() == 0) {
			return;
		}
		
		$kurti_products    = $check->result();
		$kurti_product_ids = array();
		foreach ($kurti_products as $product) {
			array_push($kurti_product_ids, $product->id);
		}
		
		// Silk Kurtis Tag
		$check = $this->db->get_where('tags_register', array(
			'slug' => 'silk-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_tag_id = $check->row()->id;
			
			$tagged_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('tag_id', $silk_kurti_tag_id);
			$check = $this->db->get('tagged_products');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $tagged_product) {
					array_push($tagged_silk_kurtis, $tagged_product->product_id);
				}
				
			}
			
			$all_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('attribute_name', 'fabric');
			$this->db->where_in('attribute_value', array(
				'silk',
				'raw silk',
				'dupion silk',
				'chanderi silk',
				'cotton silk'
			));
			$check = $this->db->get('product_attrs');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $product) {
					array_push($all_silk_kurtis, $product->product_id);
				}
			}
			
			$untagged_silk_kurtis = array_diff($all_silk_kurtis, $tagged_silk_kurtis);
			
			$new_tags_data = array();
			if (count($untagged_silk_kurtis) > 0) {
				foreach ($untagged_silk_kurtis as $product_id) {
					array_push($new_tags_data, '(' . $silk_kurti_tag_id . ',' . $product_id . ')');
				}
				
				$sql = "INSERT INTO `tagged_products` (`tag_id`, `product_id`) VALUES " . implode(',', $new_tags_data);
				$this->db->query($sql);
			}
		}
		
		// Cotton Kurtis Tag
		$check = $this->db->get_where('tags_register', array(
			'slug' => 'cotton-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_tag_id = $check->row()->id;
			
			$tagged_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('tag_id', $silk_kurti_tag_id);
			$check = $this->db->get('tagged_products');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $tagged_product) {
					array_push($tagged_silk_kurtis, $tagged_product->product_id);
				}
				
			}
			
			$all_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('attribute_name', 'fabric');
			$this->db->where_in('attribute_value', array(
				'cotton',
				'linen cotton',
				'cotton jackard',
				'smoot cotton',
				'smooth cotton',
				'rayon cotton',
				'lenin cotton',
				'net & cotton',
				'chanderi cotton',
				'riyan cotton',
				'kota cotton',
				'jute cotton',
				'soft cotton'
			));
			$check = $this->db->get('product_attrs');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $product) {
					array_push($all_silk_kurtis, $product->product_id);
				}
			}
			
			$untagged_silk_kurtis = array_diff($all_silk_kurtis, $tagged_silk_kurtis);
			
			$new_tags_data = array();
			if (count($untagged_silk_kurtis) > 0) {
				foreach ($untagged_silk_kurtis as $product_id) {
					array_push($new_tags_data, '(' . $silk_kurti_tag_id . ',' . $product_id . ')');
				}
				
				$sql = "INSERT INTO `tagged_products` (`tag_id`, `product_id`) VALUES " . implode(',', $new_tags_data);
				$this->db->query($sql);
			}
		}
		
		// Georgette Kurtis Tag
		$check = $this->db->get_where('tags_register', array(
			'slug' => 'georgette-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_tag_id = $check->row()->id;
			
			$tagged_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('tag_id', $silk_kurti_tag_id);
			$check = $this->db->get('tagged_products');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $tagged_product) {
					array_push($tagged_silk_kurtis, $tagged_product->product_id);
				}
				
			}
			
			$all_silk_kurtis = array();
			$this->db->where_in('product_id', $kurti_product_ids);
			$this->db->where('attribute_name', 'fabric');
			$this->db->where_in('attribute_value', array(
				'georgette',
				'georgeete'
			));
			$check = $this->db->get('product_attrs');
			if ($check->num_rows() > 0) {
				foreach ($check->result() as $product) {
					array_push($all_silk_kurtis, $product->product_id);
				}
			}
			
			$untagged_silk_kurtis = array_diff($all_silk_kurtis, $tagged_silk_kurtis);
			
			$new_tags_data = array();
			if (count($untagged_silk_kurtis) > 0) {
				foreach ($untagged_silk_kurtis as $product_id) {
					array_push($new_tags_data, '(' . $silk_kurti_tag_id . ',' . $product_id . ')');
				}
				
				$sql = "INSERT INTO `tagged_products` (`tag_id`, `product_id`) VALUES " . implode(',', $new_tags_data);
				$this->db->query($sql);
			}
		}
		
	}
	
	function categorize_kurtis() {
		
		$data = initiate_page();
		
		// MOVING SILK KURTIS
		$check = $this->db->get_where('categories', array(
			'slug' => 'silk-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_cat_id = $check->row()->id;
			
			$check = $this->db->get_where('tags_register', array(
				'slug' => 'silk-kurtis'
			));
			if ($check->num_rows() > 0) {
				$silk_tag_id = $check->row()->id;
				
				$silk_tagged_kurti_ids = array();
				$check                 = $this->db->get_where('tagged_products', array(
					'tag_id' => $silk_tag_id
				));
				if ($check->num_rows > 0) {
					foreach ($check->result() as $product) {
						array_push($silk_tagged_kurti_ids, $product->product_id);
					}
					
					if (count($silk_tagged_kurti_ids) > 0) {
						$this->db->where_in('id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('products');
						
						$this->db->where_in('product_id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('skus');
					}
				}
			}
		}
		
		// MOVING COTTON KURTIS
		$check = $this->db->get_where('categories', array(
			'slug' => 'cotton-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_cat_id = $check->row()->id;
			
			$check = $this->db->get_where('tags_register', array(
				'slug' => 'cotton-kurtis'
			));
			if ($check->num_rows() > 0) {
				$silk_tag_id = $check->row()->id;
				
				$silk_tagged_kurti_ids = array();
				$check                 = $this->db->get_where('tagged_products', array(
					'tag_id' => $silk_tag_id
				));
				if ($check->num_rows > 0) {
					foreach ($check->result() as $product) {
						array_push($silk_tagged_kurti_ids, $product->product_id);
					}
					
					if (count($silk_tagged_kurti_ids) > 0) {
						$this->db->where_in('id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('products');
						
						$this->db->where_in('product_id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('skus');
					}
				}
			}
		}
		
		// MOVING GEORGETTE KURTIS
		$check = $this->db->get_where('categories', array(
			'slug' => 'georgette-kurtis'
		));
		if ($check->num_rows() > 0) {
			$silk_kurti_cat_id = $check->row()->id;
			
			$check = $this->db->get_where('tags_register', array(
				'slug' => 'georgette-kurtis'
			));
			if ($check->num_rows() > 0) {
				$silk_tag_id = $check->row()->id;
				
				$silk_tagged_kurti_ids = array();
				$check                 = $this->db->get_where('tagged_products', array(
					'tag_id' => $silk_tag_id
				));
				if ($check->num_rows > 0) {
					foreach ($check->result() as $product) {
						array_push($silk_tagged_kurti_ids, $product->product_id);
					}
					
					if (count($silk_tagged_kurti_ids) > 0) {
						$this->db->where_in('id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('products');
						
						$this->db->where_in('product_id', $silk_tagged_kurti_ids);
						$this->db->set('cat_id', $silk_kurti_cat_id);
						$this->db->update('skus');
					}
				}
			}
		}
	}
}

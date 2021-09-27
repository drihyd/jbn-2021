<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

/** Include PHPExcel */

if ( ! function_exists('generateExcel')) {

	function generateExcel($action, $headings, $data) {
        
       if (!is_array($data) || !(count($data) > 0) || $data == false) {
			$this->session->set_flashdata('error', 'Data not available');
			return;
		}
		$ci = &get_instance();
		$user = $ci->session->zap_user;

		# Include PHPExcel Libraries
		require  APPPATH. 'libraries/PHPExcel.php';
		require  APPPATH. 'libraries/PHPExcel/IOFactory.php';
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
		  // echo '<pre> '. print_r(APPPATH, true ); exit();
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
		$highestColumn = $objPHPExcel->getActiveSheet()->getHighestDataColumn();
		$nCols = PHPExcel_Cell::columnIndexFromString($highestColumn);
		
		foreach (range(0, $nCols) as $col) {
			$objPHPExcel->getActiveSheet()->getColumnDimensionByColumn($col)->setWidth(30);                
		}
		$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
		
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

		
		// if (!file_exists("./reports/report-".date('d-m-Y').".xlsx")) {
		// 	$file = './reports/report-'.date('d-m-Y').'.xlsx'; 
  //           $myfile = fopen($file, "w");           
  //           fclose($myfile);

  //           $objPHPExcel = PHPExcel_IOFactory::load("./reports/".$action." report-".date('d-m-Y').".xlsx");
		// 	$objPHPExcel->setActiveSheetIndex(0);
		// 	$row = $objPHPExcel->getActiveSheet()->getHighestRow();

		// 	$i =0;
		// 	while ($cols > 0) {
		// 	   $objPHPExcel->getActiveSheet()->SetCellValue($alphas[$i].$row, $headings[$i]);
		// 	   $cols--; 
		// 	   $i++;
		// 	}
		
		// 	$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
		// 	$objWriter->save("./reports/".$action." report-".date('d-m-Y').".xlsx");
		// }

		// $objPHPExcel = PHPExcel_IOFactory::load("./reports/".$action." report-".date('d-m-Y').".xlsx");
		// $objPHPExcel->setActiveSheetIndex(0);
		// $row = $objPHPExcel->getActiveSheet()->getHighestRow()+1;
		
		// $cols =  $no_columns;
		// $i =0;
		// while ($cols > 0) {
		//    $objPHPExcel->getActiveSheet()->SetCellValue($alphas[$i].$row, $data[$i]);
		//    $cols--; 
		//    $i++;
		// }
	
		// $objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
		// $objWriter->save("./reports/".$action." report-".date('d-m-Y').".xlsx");

    }   

}

?>
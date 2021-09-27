<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if (! function_exists('send_smtp'))
{
	function send_smtp($tomail,$toname,$subject,$message){
		require_once(APPPATH . "libraries/phpmail/class.phpmailer.php");	
		$frommail="info@whitethoughtsdemos.com";
		$fromname="Anaya jewelry";
		 $url = 'https://api.elasticemail.com/v2/email/send';
    	try{
    	        $post = array('from' => $frommail,
    			'fromName' => $fromname,
    			'apikey' => '89CA77AECA9FAACD3D8B3C68C9AA16273CED2F297D4B175DF3B17329E5DF92F6748AFB9EB4C0410E15D45074A9210FED',
    			'subject' => $subject,
    			'to' => $tomail,
    			'bodyHtml' => $message,
    			'isTransactional' => true);
    			$ch = curl_init();
    			curl_setopt_array($ch, array(
    	            CURLOPT_URL => $url,
    				CURLOPT_POST => true,
    				CURLOPT_POSTFIELDS => $post,
    	            CURLOPT_RETURNTRANSFER => true,
    	            CURLOPT_HEADER => false,
    				CURLOPT_SSL_VERIFYPEER => false
    	        ));
    	        $result=curl_exec ($ch);
    	        curl_close ($ch);
    	        return $result;	
    	}
    	catch(Exception $ex){            
    	  return $ex->getMessage();
    	}
	} 

 function php_mail($frommail,$fromname,$tomail,$toname,$subject,$message,$cc)
	{

		$headers = array("MIME-Version: 1.0",	"Content-type: text/html", "From: {$frommail}", "Reply-To: {$frommail}");
		if($cc != '') {
			array_push($headers, $cc);
		}
		if($bcc_string != '') {
			array_push($headers, $bcc_string);
		}
		array_push($headers, "X-mailer: PHP/" . phpversion());
		$headers = implode("\r\n", $headers);
			mail($tomail , $subject , $message, $headers);

	}
}
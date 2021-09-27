<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if (! function_exists('send_smtp'))
{
	function send_smtp($tomail,$toname,$subject,$message){        

	
		$frommail="info@whitethoughtsdemos.com";
		$fromname="Anaya jewelry";
		 $url = 'https://api.elasticemail.com/v2/email/send';

        php_mail($frommail,$fromname,$tomail,$toname,$subject,$message,"");
    
    /*	try{
    	        $post = array('from' => $frommail,
    			'fromName' => $fromname,
    			'apikey' => '50422515C952D567BD19319527FF57012A794D2EE98AFD438AFC2EFF7D3B8B1C7A2DB233BE0CF4AEEDCEDE95A911EE63',
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
           
    	}*/
	} 

 function php_mail($frommail,$fromname,$tomail,$toname,$subject,$message,$cc=False)
	{

$to = $tomail;
$subject = $subject;
$from = 'ranjith@deepredink.com';
 
// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
 
// Create email headers
$headers .= 'From: '.$from."\r\n".
    'Reply-To: '.$from."\r\n" .
    'X-Mailer: PHP/' . phpversion();
 
// Compose a simple HTML email message
$message = $message;

 
// Sending email
if(mail($to, $subject, $message, $headers)){
    //echo 'Your mail has been sent successfully.';
} else{
    //echo 'Unable to send email. Please try again.';
}



	}
}
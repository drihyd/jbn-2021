<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (! function_exists('send_email'))
{
	
	function send_api_email($from, $from_name, $to, $to_name, $subject, $message, $plain_text_message='', $cc_emails=null, $bcc_emails=null) {
		
		$msgTo = $to;
		$to = array($to);
		
		if($cc_emails != NULL) {
			$to = array_merge($to, $cc_emails);
		} else {
			$cc_emails = array();
		}
		
		if($bcc_emails != NULL) {
			$to = array_merge($to, $bcc_emails);
		} else {
			$bcc_emails = array();
		}
		
		$mailstatus = _send_api_email($from, $from_name, $to, $to_name, $subject, $message, $plain_text_message, $cc_emails, $bcc_emails, TRUE, $msgTo);
		$mailstatus = json_decode($mailstatus, TRUE);
		
		if($mailstatus['success'] != 1) {
			
			$cc_string = '';
			if(count($cc_array > 0)) {
				$cc_string  = 'Cc: ';
				$cc_string .= implode(',', $cc_array);
			}
			$bcc_string = '';
			if(count($bcc_array > 0)) {
				$bcc_string  = 'Bcc: ';
				$bcc_string .= implode(',', $bcc_array);
			}
			$headers = array("MIME-Version: 1.0",	"Content-type: text/html", "From: {$from}", "Reply-To: {$from}");
			if($cc_string != '') {
				array_push($headers, $cc_string);
			}
			if($bcc_string != '') {
				array_push($headers, $bcc_string);
			}
			array_push($headers, "X-mailer: PHP/" . PHP_VERSION);
			$headers = implode("\r\n", $headers);
			mail($to , $subject , $message, $headers);
			return TRUE;
		}
	}

	function _send_api_email($from, $from_name, $to, $to_name, $subject, $message, $plain_text_message, $cc_emails=null, $bcc_emails=null, $isTransactional=TRUE, $msgTo) {
		
		$url = 'https://api.elasticemail.com/v2/email/send';
		
		try {
			
			$post = array(
				'from'            => $from,
				'fromName'        => $from_name,
				'apikey'          => '3af2ca54-68d2-4c8c-846d-73cf1a5f1d16',
				'subject'         => $subject,
				'to'              => implode(',', $to),
				'msgTo'           => $msgTo,
				'msgCC'           => implode(',', $cc_emails),
				//'msgBcc'          => implode(',', $bcc_emails),
				'bodyHtml'        => $message,
				'bodyText'        => $plain_text_message,
				'isTransactional' => $isTransactional,
			);
			
			$ch = curl_init();
			curl_setopt_array($ch, array(
				CURLOPT_URL            => $url,
				CURLOPT_POST           => true,
				CURLOPT_POSTFIELDS     => $post,
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_HEADER         => false,
				CURLOPT_SSL_VERIFYPEER => false,
			));
			
			$result = curl_exec($ch);
			curl_close($ch);
			return $result;
		}
		catch(Exception $ex){
			return $ex->getMessage();
		}
	}
}

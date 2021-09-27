<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Email extends CI_Controller{
    
    function  __construct(){
        parent::__construct();
    }
    
    public function send($mailContent=false,$toaddress=false,$toname=false){
        // Load PHPMailer library
        $this->load->library('phpmailer_lib');
        
        // PHPMailer object
        $mail = $this->phpmailer_lib->load();
        
        // SMTP configuration
        $mail->isSMTP();
        $mail->Host     = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'jayaraju@deepredink.com';
        $mail->Password = 'Hema@1234';
        $mail->SMTPSecure = 'tls';
        $mail->Port     = 587;
        
        $mail->setFrom('jayaraju@deepredink.com', 'Anaya Jewellery');
        $mail->addReplyTo('jayaraju@deepredink.com', 'Anaya Jewellery');
        
        // Add a recipient
        $mail->addAddress($toaddress,$toname);
        
        // Add cc or bcc 
        // $mail->addCC('cc@example.com');
        // $mail->addBCC('bcc@example.com');
        
        // Email subject
        $mail->Subject = 'Anaya Jewellery';
        
        // Set email format to HTML
        $mail->isHTML(true);
        
        // Email body content
     


        $mail->Body = $mailContent;
        
        // Send email
        if(!$mail->send()){
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        }else{
            echo 'Message has been sent';
        }
    }
  
    
}
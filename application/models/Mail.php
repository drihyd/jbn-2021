<?php

/* * ***
 * Version: V1.0.1
 *
 * Description of Mail model
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 *
 * *** */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Mail extends CI_Model {

    // Declaration of a variables
    private $_mailTo;
    private $_mailFrom;
    private $_mailSubject;
    private $_mailContent;
    private $_templateName;
    private $_templatePath;

    //Declaration of a methods
    public function setMailTo($mailTo) {
        $this->_mailTo = $mailTo;
    }

    public function setMailFrom($mailFrom) {
        $this->_mailFrom = $mailFrom;
    }

    public function setMailSubject($mailSubject) {
        $this->_mailSubject = $mailSubject;
    }

    public function setMailContent($mailContent) {
        $this->_mailContent = $mailContent;
    }

    public function setTemplateName($templateName) {
        $this->_templateName = $templateName;
    }

    public function setTemplatePath($templatePath) {
        $this->_templatePath = $templatePath;
    }

    // smtpMail
    public function sendMail($data) {

        //Load email library
        $this->load->library('email');

        if (!empty($data) && $data == 'smtp') {
            //SMTP & mail configuration
            $config = array(
                'protocol' => PROTOCOL,
                'smtp_host' => SMTP_HOST,
                'smtp_port' => SMTP_PORT,
                'smtp_user' => SMTP_USER,
                'smtp_pass' => SMTP_PASS,
                'mailtype' => MAILTYPE,
                'charset' => CHARSET,
            );

            $fullPath = $this->_templatePath . $this->_templateName;
            $this->email->initialize($config);
            $this->email->set_mailtype(MAILTYPE);
            $this->email->set_newline("\r\n");

            //Email content
            $mailMessage = $this->load->view($fullPath, $this->_mailContent, TRUE);
            $this->email->to($this->_mailTo);
            $this->email->from($this->_mailFrom, FROM_TEXT);
            $this->email->subject($this->_mailSubject);
            $this->email->message($mailMessage);
            //Send email
            if ($this->email->send()) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    // generate Unique UserName
    public function generateUnique($tableName, $string, $field, $key = NULL, $value = NULL) {
        $slug = preg_replace('/[^A-Za-z0-9-]+/', '', strtolower($string));
        $i = 0;
        $params = array();
        $params[$field] = $slug;
        if ($key)
            $params["$key !="] = $value;
        while ($this->db->where($params)->get($tableName)->num_rows()) {
            if (!preg_match('/-{1}[0-9]+$/', $slug))
                $slug .= '-' . ++$i;
            else
                $slug = preg_replace('/[0-9]+$/', ++$i, $slug);
            $params [$field] = $slug;
        }
        return $slug;
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
?>
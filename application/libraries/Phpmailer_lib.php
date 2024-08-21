<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * CodeIgniter PHPMailer Class
 *
 * This class enables SMTP email with PHPMailer
 *
 * @category    Libraries
 * @author      CodexWorld
 * @link        https://www.codexworld.com
 */

//use PHPMailerPHPMailerPHPMailer;
//use PHPMailerPHPMailerException;
class PHPMailer_Lib
{
    public function __construct(){
        log_message('Debug', 'PHPMailer class is loaded.');
    }

    public function load(){
        // Include PHPMailer library files
        require_once APPPATH.'third_party/PHPMailer/Exception.php';
        require_once APPPATH.'third_party/PHPMailer/PHPMailer.php';
        require_once APPPATH.'third_party/PHPMailer/SMTP.php';
        
       $mail = new PHPMailer\PHPMailer\PHPMailer();
        // SMTP configuration
        $mail->isSMTP();
        $mail->Host     = 'mail.cuzcachapa.com';
        $mail->SMTPAuth = true;
        $mail->Username = '_mainaccount@cuzcachapa.com';
        $mail->Password = '$#%cuzc@chapa$&';
       // $mail->SMTPSecure = 'ssl';
        $mail->Port     = 587;
        
        $mail->setFrom('cuzcachapa@cuzcachapa.com', 'Cuzcachapa de R.L');
        $mail->addReplyTo('cuzcachapa@cuzcachapa.com', 'Cuzcachapa de R.L');
        return $mail;
    }
}
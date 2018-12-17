package com.gansbat.space.basedao;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



//https://blog.csdn.net/TangLingGuang/article/details/78419581
public class SendEmail {
	//发送邮件邮箱的的用户名
	private String postUsername="xiaoxiaodeyee@163.com";
	
	//发送邮件邮箱的密码
	private String postPassword="yijianquan1998";
	
	//发送邮件的主题
	private static String sendSubject="Space网站发来的验证码：";
	
	//发送邮件的正文
	private static String sendContent="你的验证码是: ";
	
	//发件人邮箱的SMTP服务器地址
	 // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
	private String myEmailSMTPHost="smtp.163.com";
	
	//收件人的邮箱地址
	private String acceptEmailAddress="996874863@qq.com";
	   
	public SendEmail() {
		sendContent="你的验证码是 ";
		sendSubject="Space网站发来的验证码：";
	}
	
	
	
	public boolean sendVerifyEmail() {
		//参数配置
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");//使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", myEmailSMTPHost);//发件人邮箱的SMTP服务器地址
		props.setProperty("mail.smtp.port", "25");//设置端口号
		props.setProperty("mail.smtp.starttls.enable", "true");// 需要请求认证
		//根据配置创建会话对象，用于和邮件服务器交互
		Session session = Session.getInstance(props);
		session.setDebug(true);
		
		//创建一封邮件
		MimeMessage message = null;
		Transport transport = null;
		
		try {
			message = createMimeMessage(session,postUsername,acceptEmailAddress);
			transport = session.getTransport();
			transport.connect(postUsername,postPassword);
			// 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 
			//获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException");
			return false;
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			return false;
		}
		return true;
	}
	
	public static MimeMessage createMimeMessage(Session session,String sendMail,String receiveMail) throws UnsupportedEncodingException, MessagingException {
		//创建一份邮件
		MimeMessage message  = new MimeMessage(session);
		
		//From：发件人名字
		message.setFrom(new InternetAddress(sendMail,"163","UTF-8"));
		
		//To：收件人（可以增加多个收件人、抄送、密送）
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail,"qq用户","UTF-8"));
		//Subject：邮件主题
		message.setSubject(sendSubject,"UTF-8");
		
		//Content:邮件正文（可以使用html）
		message.setContent(sendContent,"text/html;charset=UTF-8");
		
		//设置发送时间
		message.setSentDate(new Date());
		
		message.saveChanges();
		
		return message;
	}

	public String getPostUsername() {
		return postUsername;
	}

	public void setPostUsername(String postUsername) {
		this.postUsername = postUsername;
	}

	public String getPostPassword() {
		return postPassword;
	}

	public void setPostPassword(String postPassword) {
		this.postPassword = postPassword;
	}

	public String getMyEmailSMTPHost() {
		return myEmailSMTPHost;
	}

	public void setMyEmailSMTPHost(String myEmailSMTPHost) {
		this.myEmailSMTPHost = myEmailSMTPHost;
	}

	public String getAcceptEmailAddress() {
		return acceptEmailAddress;
	}

	public void setAcceptEmailAddress(String acceptEmailAddress) {
		this.acceptEmailAddress = acceptEmailAddress;
	}

	public static String getSendSubject() {
		return sendSubject;
	}

	public static void setSendSubject(String sendSubject) {
		SendEmail.sendSubject = sendSubject;
	}

	public static String getSendContent() {
		return sendContent;
	}

	public static void setSendContent(String sendContent) {
		SendEmail.sendContent = sendContent;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}

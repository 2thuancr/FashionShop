<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar {
	font-weight: 500;
}

.nav-link {
	color: rgb(255 255 255/ 100%) !important;
}

.dropdown-menu {
	background-color: #ffffff !important;
	border-color: #949494;
}

.dropdown-menu li a:hover {
	background-color: #ff48b9ec !important;
	color: white;
}
.content {
  height: 70vh;
}

.footer-14398 {
  padding: 7rem 0;
  background: #000;
  color: #777;
}

.footer-14398 .footer-site-logo {
  color: #fff;
  font-size: 26px;
  font-weight: bold;
  margin-bottom: 30px;
  display: block;
}

.footer-14398 h3 {
  color: #fff;
  font-size: 16px;
  margin-bottom: 20px;
}

.footer-14398 .links li {
  margin-bottom: 10px;
}

.footer-14398 .links li a {
  color: #999;
}

.footer-14398 .links li a:hover {
  color: #fff;
}

.footer-14398 .link-menu li {
  display: inline-block;
}

.footer-14398 .link-menu li a {
  color: #fff;
  display: inline-block;
  padding: 10px;
}

.footer-14398 .link-menu.nav-left li:first-child a {
  padding-left: 0;
}

.footer-14398 .link-menu.nav-right li:last-child a {
  padding-left: 0;
}

.footer-14398 .social li {
  display: inline-block;
}

.footer-14398 .social li a {
  display: inline-block;
  padding: 10px;
  color: #ccc;
}

.footer-14398 .social li:last-child a {
  padding-right: 0;
}

.footer-14398 .line {
  border-top: 1px solid rgba(255, 255, 255, 0.2);
}

.footer-59391 {
  border-top: 1px solid #efefef;
  background-color: #fff;
  font-family: "Poppins", sans-serif;
  padding: 4rem 0;
}

.footer-59391 .site-logo a {
  font-size: 30px;
  color: #3e64ff;
  font-weight: 900;
}

.footer-59391 .nav-links li {
  display: inline-block;
}

.footer-59391 .nav-links li a {
  color: #777;
  padding: 10px;
}

.footer-59391 .nav-links li a:hover {
  color: #3e64ff;
}

.footer-59391 .nav-links.nav-left li:first-child {
  padding-left: 0;
}

.footer-59391 .nav-links.nav-right li:last-child {
  padding-right: 0;
}

.footer-59391 .copyright {
  border-top: 1px solid #efefef;
  padding-top: 50px;
  text-align: center;
  color: #777;
}

.footer-59391 .subscribe .form-group {
  margin-bottom: 0;
  padding-bottom: 0;
  position: relative;
}

.footer-59391 .subscribe .form-group input[type="email"] {
  height: 45px;
  border: none;
  background: #e6e6e6;
}

.footer-59391 .subscribe .form-group input[type="email"]:focus,
.footer-59391 .subscribe .form-group input[type="email"]:active {
  outline: none;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.footer-59391 .subscribe .form-group input[type="email"]::-webkit-input-placeholder {
  color: #b3b3b3;
  font-size: 14px;
}

.footer-59391 .subscribe .form-group input[type="email"]::-moz-placeholder {
  color: #b3b3b3;
  font-size: 14px;
}

.footer-59391 .subscribe .form-group input[type="email"]:-ms-input-placeholder {
  color: #b3b3b3;
  font-size: 14px;
}

.footer-59391 .subscribe .form-group input[type="email"]:-moz-placeholder {
  color: #b3b3b3;
  font-size: 14px;
}

.footer-59391 .subscribe .form-group button {
  position: absolute;
  border: none;
  background: none;
  font-size: 1.5rem;
  -webkit-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  transform: rotate(180deg);
  top: .5rem;
  right: .3rem;
  line-height: 0;
}

.footer-59391 .subscribe .form-group button:focus,
.footer-59391 .subscribe .form-group button:active {
  outline: none;
}

.footer-59391 .social li {
  display: inline-block;
  position: relative;
}

.footer-59391 .social li a {
  position: relative;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: inline-block;
  margin: 0;
  padding: 0;
  background-color: #e6e6e6;
  color: #333333;
}

.footer-59391 .social li a>span {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

.footer-59391 .social li a:hover {
  color: #3e64ff;
}

.footer-95942 {
  padding: 7rem 0;
  font-family: "Poppins", sans-serif;
}

.footer-95942 .nav-links li {
  display: block;
  margin-bottom: 10px;
}

.footer-95942 .nav-links li a {
  font-size: 14px;
  color: #777;
}

.footer-95942 .nav-links li a:hover {
  color: #4200ff;
}

.footer-95942 .social.app {
  font-size: 13px;
}

.footer-95942 .social li {
  display: inline-block;
}

.footer-95942 .social li a {
  display: inline-block;
  padding: 10px;
  color: #ccc;
}

.footer-95942 .social li a:hover {
  color: #4200ff;
}

.footer-95942 .social.nav-left li:first-child a {
  padding-left: 0px;
}

.footer-95942 .social.nav-right li:last-child a {
  padding-right: 0px;
}

.footer-95942 h3 {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 20px;
}

.footer-48201 {
  padding: 7rem 0;
  background-color: #000;
  color: #777;
}

.footer-48201 .footer-site-logo {
  font-size: 1.5rem;
  color: #fff;
}

.footer-48201 .nav-links li {
  margin-bottom: 10px;
}

.footer-48201 .nav-links li a {
  color: gray;
}

.footer-48201 .nav-links li a:hover {
  color: #fff;
}

.footer-48201 .btn.btn-tertiary {
  background-color: #e42c64;
  color: #fff;
  border-radius: 30px;
  border: none;
  padding: 10px 20px;
}

.footer-48201 .social li {
  display: inline-block;
}

.footer-48201 .social li a {
  color: gray;
  padding: 7px;
}

.footer-48201 .social li a:hover {
  color: #fff;
}

.footer-48201 .copyright {
  border-top: 1px solid #404040;
}

.footer-99382 {
  padding: 7rem 0;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  color: #777;
  position: relative;
  font-family: "Poppins", sans-serif;
}

.footer-99382:before {
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
}

.footer-99382 h3 {
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  margin-bottom: 30px;
}

.footer-99382 .footer-site-logo {
  font-size: 1.5rem;
  color: #fff;
}

.footer-99382 .nav-links li {
  margin-bottom: 10px;
}

.footer-99382 .nav-links li a {
  color: #999999;
}

.footer-99382 .nav-links li a:hover {
  color: #fff;
}

.footer-99382 .btn.btn-tertiary {
  background-color: #e42c64;
  color: #fff;
  border-radius: 30px;
  border: none;
  padding: 10px 20px;
}

.footer-99382 .social li {
  display: inline-block;
}

.footer-99382 .social li a {
  color: gray;
  padding: 7px;
}

.footer-99382 .social li a:hover {
  color: #fff;
}

.footer-99382 .copyright {
  border-top: 1px solid #595959;
}

.footer-16371 {
  padding: 7rem 0;
  font-family: "Poppins", sans-serif;
}

.footer-16371 .footer-site-logo {
  text-align: center;
  font-size: 2rem;
  font-weight: 900;
}

.footer-16371 .footer-site-logo a {
  color: #4200ff;
}

.footer-16371 .nav-links {
  padding: 0;
  margin: 0;
}

.footer-16371 .nav-links li {
  display: inline-block;
}

.footer-16371 .nav-links li a {
  padding: 10px;
  color: #000;
}

.footer-16371 .nav-links li a:hover {
  color: #4200ff;
}

.footer-16371 .social h3 {
  font-weight: bold;
  font-size: 18px;
  color: #000;
}

.footer-16371 .social ul li {
  display: inline-block;
}

.footer-16371 .social ul li a {
  display: inline-block;
  padding: 10px;
}

.footer-16371 .social ul li.in a {
  color: #df588a;
}

.footer-16371 .social ul li.tw a {
  color: #15b8ff;
}

.footer-16371 .social ul li.fb a {
  color: #3742d0;
}

.footer-16371 .social ul li.dr a {
  color: #fa38c1;
}

.footer-16371 .social ul li.pin a {
  color: #dd4d5a;
}

.footer-16371 .copyright {
  color: #999999;
}

.footer-39201 {
  padding: 7rem 0;
  color: #9d9d9d;
}

.footer-39201 .subscribe {
  position: relative;
}

.footer-39201 .subscribe .form-control {
  background-color: #e6e6e6;
  -webkit-box-shadow: none;
  box-shadow: none;
  border-radius: 30px;
  height: 50px;
  padding-left: 30px;
  padding-right: 130px;
  border: none;
  color: #000;
}

.footer-39201 .subscribe .form-control::-webkit-input-placeholder {
  color: #b3b3b3;
  font-style: italic;
  font-size: 14px;
}

.footer-39201 .subscribe .form-control::-moz-placeholder {
  color: #b3b3b3;
  font-style: italic;
  font-size: 14px;
}

.footer-39201 .subscribe .form-control:-ms-input-placeholder {
  color: #b3b3b3;
  font-style: italic;
  font-size: 14px;
}

.footer-39201 .subscribe .form-control:-moz-placeholder {
  color: #b3b3b3;
  font-style: italic;
  font-size: 14px;
}

.footer-39201 .subscribe .btn-submit {
  background: #614ad3;
  height: 40px;
  border-radius: 30px;
  padding-left: 30px;
  padding-right: 30px;
  color: #fff;
  font-weight: bold;
  position: absolute;
  top: 5px;
  right: 5px;
  -webkit-box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.2);
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.2);
}

.footer-39201 h3 {
  font-size: 16px;
  font-weight: 900;
  color: #000;
  margin-bottom: 20px;
}

.footer-39201 .nav-links li {
  display: block;
  margin-bottom: 10px;
}

.footer-39201 .nav-links li a {
  color: #9d9d9d;
}

.footer-39201 .nav-links li a:hover {
  color: #614ad3;
}

.footer-39201 .social li {
  display: inline-block;
}

.footer-39201 .social li a {
  display: inline-block;
  padding: 10px;
  color: #9d9d9d;
}

.footer-39201 .social li a:hover {
  color: #614ad3;
}
</style>

<footer class="footer-14398">
      
	<div class="container">
	  <div class="row mb-5">
		<div class="col-md-3">
		  <a href="#" class="footer-site-logo">Colorlib</a>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit officiis corporis optio natus. </p>
		</div>
		<div class="col-md-2 ml-auto">
		  <h3>Shop</h3>
		  <ul class="list-unstyled links">
			<li><a href="#">Sell online</a></li>
			<li><a href="#">Features</a></li>
			<li><a href="#">Examples</a></li>
			<li><a href="#">Website editors</a></li>
			<li><a href="#">Online retail</a></li>
		  </ul>
		</div>
		<div class="col-md-2 ml-auto">
		  <h3>Press</h3>
		  <ul class="list-unstyled links">
			<li><a href="#">Events</a></li>
			<li><a href="#">News</a></li>
			<li><a href="#">Awards</a></li>
			<li><a href="#">Testimonials</a></li>
			<li><a href="#">Online retail</a></li>
		  </ul>
		</div>
		<div class="col-md-2 ml-auto">
		  <h3>About</h3>
		  <ul class="list-unstyled links">
			<li><a href="#">Contact</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Team</a></li>
			<li><a href="#">Career</a></li>
			<li><a href="#">Contacts</a></li>
		  </ul>
		</div>
	  </div>

	  <div class="row mb-4">
		<div class="col-12 pb-4">
		  <div class="line"></div>
		</div>
		<div class="col-md-6 text-md-left">
		  <ul class="list-unstyled link-menu nav-left">
			<li><a href="#">Privacy Policy</a></li>
			<li><a href="#">Terms &amp; Conditions</a></li>
			<li><a href="#">Code of Conduct</a></li>
		  </ul>
		</div>
		<div class="col-md-6 text-md-right">
		  <ul class="list-unstyled social nav-right">
			<li><a href="#"><span class="icon-twitter"></span></a></li>
			<li><a href="#"><span class="icon-instagram"></span></a></li>
			<li><a href="#"><span class="icon-facebook"></span></a></li>
			<li><a href="#"><span class="icon-pinterest"></span></a></li>
		  </ul>
		</div>
	  </div>

	  <div class="row">
		<div class="col-md-7">
		  <p><small>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate, fuga. Ex at maxime eum odio quibusdam pariatur expedita explicabo harum! Consectetur ducimus delectus nemo, totam odit!</small></p>
		</div>
	  </div>
	</div>
	
  
</footer>
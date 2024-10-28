<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Project.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- contact start -->
    <div class="container contact py-5">
    <div class="container">
    <div class="section-title text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
        <h4 class="green-text mt-5">Contact Us</h4>        
        <h1 class="title-text">Have questions? Reach out anytime.</h1>
        <hr class="border-3 green-text opacity-100 mb-5" style="width: auto;">
    </div>
    <div class="row g-5">
    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
        <h3 class="mb-4">Contact Us for Any Enquries</h3>        
    <form id="contactform">
      <div class="mb-3">
        <label for="form-name" class="form-label">Name</label>
        <input type="text" class="form-control" id="form-name" aria-describedby="nameHelp" placeholder="Enter your name">        
      </div>
      <div class="mb-3">
        <label for="form-email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="form-email" aria-describedby="emailHelp" placeholder="Enter your Email">        
      </div>
      <div class="mb-3">
        <label for="form-phonenumber" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="form-phonenumber" aria-describedby="phonenumberHelp" placeholder="Enter your number">        
      </div>
      <div class="mb-3">
        <label for="form-textarea" class="form-label">Message</label>
        <textarea class="form-control" name="Message" id="form-textarea" aria-describedby="textareaHelp" placeholder="Enter your Message"></textarea>       
      </div>
      <button class="btn btn-success px-3 py-2">Submit</button>
    </form>
    </div>
        <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
            <div class="h-100">
              <iframe class="rounded"  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d497485.6438199217!2d79.96310633102378!3d13.060695043063797!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a5265ea4f7d3361%3A0x6e61a70b6863d433!2sChennai%2C%20Tamil%20Nadu!5e0!3m2!1sen!2sin!4v1727452199107!5m2!1sen!2sin"  width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>                
    </div>
    </div>
    <!-- contact End -->
</asp:Content>

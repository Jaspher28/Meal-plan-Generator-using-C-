<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--main start-->
    <main class="container-fluid mt-5">
      <div class="row pt-5">
        <div class="col-md-6 py-3 d-flex align-items-center">
          <div class="d-flex align-items-center animate__animated animate__fadeInLeft">
            <div>
              <h1 class="mainheading">Eating well made <br> effortless.</h1>
              <p class="lead">Healthy eating made simple with personalized meal plans that fit your lifestyle and goals. Start your journey to a healthier you, one meal at a time!</p>
              <button  type="button" data-bs-toggle="modal" data-bs-target="#generateplanmodal" class="btn btn-success p-3 me-2 ">Generate Plan</button>
              <button class="btn btn-outline-success p-3">Learn More <i class="bi bi-arrow-right"></i></button>
            </div>
          </div>       
        </div>
        <div class="col-md-6 py-3">
          <div>
            <img src="images/doctornew1.jpg" alt="doctor1" class="img-fluid animate__animated  animate__fadeInRight">
          </div>
        </div>
      </div>
    </main>
    <!--main end-->


    <!-- Toast for success message start -->
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="successToast" class="toast bg-" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <strong class="me-auto">Success</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body" id="successToastBody">
                <!-- Success message will be inserted here -->
            </div>
        </div>
    </div>
     <!-- Toast for success message end -->


    <!-- Toast for displaying validation errors start -->
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="errorToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <strong class="me-auto">Validation Error</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body" id="errorToastBody">
                <!-- Error messages will be inserted here -->
            </div>
        </div>
    </div>
     <!-- Toast for displaying validation errors end -->


    <!--  modal 1 start -->
    <div class="modal fade zoom-out pt-3 px-3" id="generateplanmodal" tabindex="-1" aria-labelledby="generateplanmodalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header d-flex">
                  <h5 class="modal-title col-10 p-2" id="generateplanmodalLabel">Diet Maker</h5>
                  <button type="button" class="btn-close close-button p-3 col-2 me-1 d-flex justify-content-center align-items-center" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body pb-0 px-4">              
                      <div class="input-group mb-3">                      
                          <i class="bi bi-person input-icon"></i>
                          <asp:TextBox ID="txtName" runat="server" CssClass="input"  required="true"></asp:TextBox>
                          <label class="user-label" for="txtName">Name</label>                    
                      </div>                  
  
                      <div class="input-group mb-3">
                          <i class="bi bi-gender-ambiguous input-icon"></i>
                          <asp:DropDownList ID="ddlGender" runat="server" CssClass="input" required="true">
                              <asp:ListItem Text="Select Gender" Value="" Enabled="True" Selected="True"></asp:ListItem>
                              <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                              <asp:ListItem Text="Female" Value="female"></asp:ListItem>
                          </asp:DropDownList>
                          <label class="user-label-2" for="ddlGender">Gender</label>
                      </div>
  
                      <div class="input-group mb-3">
                          <i class="bi bi-calendar input-icon"></i>
                          <asp:TextBox ID="txtAge" runat="server" CssClass="input"  required="true" TextMode="Number"></asp:TextBox>
                          <label class="user-label" for="txtAge">Age</label>
                      </div>
  
                      <div class="input-group mb-3">
                          <i class="bi bi-modem input-icon"></i>
                          <asp:TextBox ID="txtHeight" runat="server" CssClass="input"  required="true" TextMode="Number"></asp:TextBox>
                          <label class="user-label" for="txtHeight">Height (cm)</label>
                      </div>
  
                      <div class="input-group mb-3">
                          <i class="bi bi-layout-wtf input-icon"></i>
                          <asp:TextBox ID="txtWeight" runat="server" CssClass="input"  required="true" TextMode="Number"></asp:TextBox>
                          <label class="user-label" for="txtWeight">Weight (kg)</label>
                      </div>
  
                      <div class="input-group mb-3">
                          <i class="bi bi-activity input-icon"></i>
                          <asp:DropDownList ID="ddlActivityLevel" runat="server" CssClass="input" required="true">
                              <asp:ListItem Text="Select Activity" Value="" Enabled="True" Selected="True"></asp:ListItem>
                              <asp:ListItem Text="Sedentary" Value="Sedentary"></asp:ListItem>
                              <asp:ListItem Text="Moderate" Value="Moderate"></asp:ListItem>
                              <asp:ListItem Text="Heavy Workers" Value="Heavy"></asp:ListItem>
                          </asp:DropDownList>
                          <label class="user-label-2" for="ddlActivityLevel">Activity Level</label>
                      </div>
  
                      <div class="input-group mb-3">
                          <i class="bi bi-egg-fried input-icon"></i>
                          <asp:DropDownList ID="ddlDietType" runat="server" CssClass="input" required="true">
                              <asp:ListItem Text="Select Type" Value="" Enabled="True" Selected="True"></asp:ListItem>
                              <asp:ListItem Text="Vegetarian" Value="Veg"></asp:ListItem>
                              <asp:ListItem Text="Non-Vegetarian" Value="Non-Veg"></asp:ListItem>
                          </asp:DropDownList>
                          <label class="user-label-2" for="ddlDietType">Diet Type</label>
                      </div>
  
                      <div class="d-flex justify-content-center">                   
                          <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-primary w-100 py-3 mb-3" Text="Generate Diet Plan" type="submit"  OnClick="btnGenerate_Click" />
                      </div>             
              </div>
          </div>
      </div>
    </div>
    <!--  modal 1 end -->

 
    <!-- modal 2 start -->
    <div class="modal fade" id="strategicPlanModal" tabindex="-1" aria-labelledby="strategicPlanModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="strategicPlanModalLabel">Strategic Plan Created</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <i class="bi bi-check-circle-fill tick-icon"></i>
                    <p class="lead">Your strategic plan has been successfully created and is ready for implementation.</p>                
                </div>
                <div class="modal-footer">                
                    <a href="Dashboard.aspx" class="btn btn-primary">View Dashboard</a>
                </div>
            </div>
        </div>
    </div>
    <!-- modal 2 end-->


    <!-- carousel blog start -->
    <!-- carouseltop Section -->
    <div class="container-fluid carouselblog-section my-5 " id="carouselblog" >
      <h1 class="title-text text-center ">Blogs & <span class="green-text">Article</span></h1>
      <p class="lead text-center">"Meal Maker provides personalized nutrition plans to help you achieve your health goals.<br> With expert guidance, we make healthy eating easy and enjoyable, empowering<br> you to live a balanced, fulfilling life."</p>
      <hr class="border-3 green-text mx-auto opacity-100" style="width: 300px;">
      <div class="container ">
        <!-- Owl Carousel Container -->
        <div class="owl-carousel carouselblog-carousel">
          <!-- Slide 1 -->
          <div class="blog-container container mt-5">                       
            <div class="image-container">
                <img src="images/img16.jpg"  alt="Sample Image">
                <div class="overlay px-2">
                    <div class="overlay-subheading fs-6">I Am a Food Blog</div>
                    <div class="overlay-heading"> <a class="text-light link-offset-2 link-underline link-underline-opacity-0" href="https://iamafoodblog.com/">Where Flavor Meets Creativity: Create Delicious Dishes</a></div>
                    <div class="overlay-paragraph">At I Am a Food Blog, we bring the joy of cooking and eating to life through delicious recipes, stunning photography, and creative ideas. Whether you're a home cook, a food enthusiast...</div>
                </div>
            </div>
        </div>          
          <!-- Slide 2 -->
          <div class="blog-container container mt-5">                       
            <div class="image-container">
                <img src="images/img20.jpg" alt="Sample Image">
                <div class="overlay px-2">
                    <div class="overlay-subheading fs-6"> Blogger Pro </div>
                    <div class="overlay-heading"> <a class="text-light link-offset-2 link-underline link-underline-opacity-0 " href="https://www.foodbloggerpro.com/blog/">Master the Art: Craft Delicious,Grow Your Audience Online </a></div>
                    <div class="overlay-paragraph">Food Blogger Pro is your ultimate guide to building a successful food blog. From crafting engaging content to provide the tools you need to grow your audience and your love for food...</div>
                </div>
            </div>
        </div>  
          <!-- Slide 3 -->          
          <div class="blog-container container mt-5">                       
            <div class="image-container">
                <img src="images/img21.jpg" alt="Sample Image">
                <div class="overlay px-2">
                    <div class="overlay-subheading fs-6">Pinch of Yum</div>
                    <div class="overlay-heading"> <a class="text-light link-offset-2 link-underline link-underline-opacity-0" href="https://pinchofyum.com/">Savor the Flavor: Discover the Secrets of Cooking Delicious Dishes</a></div>
                    <div class="overlay-paragraph">Pinch of Yum is your go-to destination for delightful recipes and culinary inspiration that make cooking a joy. From comforting classics to innovative...</div>
                </div>
            </div>
        </div>    
        </div>
      </div>
    </div> 
    <!--carousel blog end-->


    <!--why diet start -->
    <section id="whydiet" class="py-5">
      <h1 class="title-text text-center pb-5">Benefits</h1>
      <div class="container">
        <div class="row ">
          <div class="col-md-6">
            <div class="row ">
              <div class="col-6">
                <img class="img-fluid w-100 rounded my-5 animate__animated  animate__fadeIn animate__delay-0.1s" src="images/img 9.jpg" alt="nuts">
              </div>
              <div class="col-6">
                <img class="img-fluid w-100 mb-3 rounded animate__animated  animate__fadeIn animate__delay-0.3s" src="images/img12.jpeg" alt="blueberry" >
                <img class="img-fluid w-50 rounded animate__animated  animate__fadeIn animate__delay-0.2s" src="images/img10.jpeg" alt="cardamon" >
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <h6 class="green-text">Why we should follow Healthy Diet ?</h6>
            <h1 class="title-text"><b><span class="green-text">Benefits</span> of Following a Healthy Diet</b></h1>
            <hr class="border-3 green-text opacity-100" style="width: 250px;"> 
            <p>The benefits of healthy diet are numerous and impactful for both your body and mind. Eating a variety of nutrient-rich foods ensures that your body gets essential vitamins, minerals, and antioxidants, which boost your immune system and promote overall vitality. A well-balanced diet helps maintain a healthy weight, improves cardiovascular health, and lowers the risk of developing lifestyle diseases such as obesity, type 2 diabetes, and hypertension. By prioritizing whole grains, lean proteins, fruits, and vegetables, you can sustain high energy levels throughout the day, enhance digestion, and support the body's natural detoxification processes.</p>
            <p>In addition to physical benefits, a healthy diet significantly improves mental well-being. Proper nutrition plays a key role in brain health, enhancing cognitive functions like memory, focus, and mental clarity. Eating the right foods can help stabilize mood and reduce the chances of experiencing mental health issues such as anxiety and depression.Healthy eating habits can enhance sleep quality, boost your metabolism, and even improve skin, hair, and bone health. </p>
          </div>
        </div>
      </div>
    </section>
    <!--why diet end -->


    <!-- carousel start -->
    <!-- carouseltop Section -->
    <div class="container-fluid carouseltop-section " id="carouseltop">
    <div class="container">
      <h1 class="mb-4 title-text text-center "><span class="green-text">Diet</span> Plans</h1>
      <p class="lead text-center">"Follow your diet with dedication and consistency to achieve your health goals.<br> A balanced diet not only nourishes your body but also boosts energy,<br> improves well-being, and helps you stay on track."</p>
      <hr class="border-3 green-text mx-auto opacity-100 mb-5 " style="width: 300px;">
      <!-- Owl Carousel Container -->
      <div class="owl-carousel carouseltop-carousel text-light">
        <!-- Slide 1 -->
        <div class="slide1 carouseltop-item  py-3 " style="border: 1px solid green;">
          <div class="carouseltop-card row h-100 p-5">
            <!-- image -->
            <div class="col-md-5 d-flex justify-content-center align-items-center">
              <img id="carousel-img" src="images/img25.jpg" alt="Healthy Living Diet">
            </div>   
            <!-- text -->
            <div class="col-md-7 d-flex flex-column align-items-center justify-content-center ">
              <p><b><span class="highlight text-success bg-light p-3 rounded-pill">Diet plan</span></b></p>
              <h2 id="carouselhead" class="display-6"><b> Healthy Living Diet</b></h2>
              <p class="lead ">The Healthy Living Diet promotes overall well-being through balanced meals and sustainable habits. By focusing on whole foods and proper portioning, we help you maintain a nutritious lifestyle that supports long-term health and vitality.</p>
              <button class="btn btn-outline-light">Know more 
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.854 10.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707z"/>
                </svg>
              </button>
            </div>    
          </div>
        </div>
        <!-- Slide 2 -->
        <div class="slide2 carouseltop-item  py-3 ">
          <div class="carouseltop-card row h-100 p-5">
            <!-- image -->
            <div class="col-md-5 d-flex justify-content-center align-items-center">
              <img id="carousel-img" src="images/img23.jpg" alt="Underweight Diet">
            </div>   
            <!-- text -->
            <div class="col-md-7 d-flex flex-column align-items-center justify-content-center ">
              <p><b><span class="highlight text-success bg-light p-3 rounded-pill">Diet plan</span></b></p>
              <h2 id="carouselhead" class="display-6"><b>Underweight Diet</b></h2>
              <p class="lead ">Our Underweight Diet is designed to help you achieve gradual and sustainable weight loss. By focusing on balanced nutrition and portion control, we guide you toward a healthier lifestyle without compromising on taste or satisfaction. Let us help you reach your ideal weight.</p>
              <button class="btn btn-outline-light">Know more 
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-circle" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.854 10.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707z"/>
                </svg>
              </button>
            </div>    
          </div>
        </div>
        <!-- Slide 3 -->
        <div class="slide-3 carouseltop-item border  py-3 ">
          <div class="carouseltop-card row h-100 p-5">
            <!-- image -->
            <div class="col-md-5 d-flex justify-content-center align-items-center">
              <img id="carousel-img" src="images/img24.jpg" alt="Therapeutic Diets">
            </div>   
            <!-- text -->
            <div class="col-md-7 d-flex flex-column align-items-center justify-content-center ">
              <p><b><span class="highlight text-success bg-light p-3 rounded-pill">Diet plan</span></b></p>
              <h2 id="carouselhead" class="display-6"><b>Therapeutic Diets</b></h2>
              <p class="lead  ">Tailored to address specific health conditions, our Therapeutic Diet plans support your body’s unique needs. Whether managing diabetes, we provide personalized nutrition that aids in healing and promotes overall well-being.
              </p>
              <button class="btn btn-outline-light ">Know more
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-circle" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.854 10.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707z"/>
                  </svg>  
              </button>
            </div>    
          </div>
        </div>       
      </div>
    </div>
    </div> 
    <!--carousel end-->


    <!---FAQ start-->
    <div id="fAQs" class="faq-container container ">
      <h1 class="mb-4 title-text text-center ">Frequently Asked <span class="green-text">Questions</span></h1>
      <p class="lead text-center">"Clear your doubts with ease by reaching out to us. We're here to provide clarity,<br> answer your questions, and guide you through any uncertainties<br> for a smooth and confident experience."</p>
      <hr class="border-3 green-text mx-auto opacity-100 mb-5" style="width: 300px;">
      <div class="faq-list ">
          <div class="faq-item mb-3 ">
              <div class="faq-question">
                  <h3>How can I create a personalized health plan?</h3>
                  <button class="faq-toggle">+</button>
              </div>
              <div class="faq-answer">
                  <p>You can easily create a personalized health plan by clicking the 'Generate Plan' button on the homepage. Fill in the form with your details, and we'll craft a plan tailored to your needs.</p>
              </div>
          </div>

          <div class="faq-item mb-3 ">
              <div class="faq-question">
                  <h3>How often can I update my health plan?</h3>
                  <button class="faq-toggle">+</button>
              </div>
              <div class="faq-answer">
                  <p> You can update your health plan anytime by logging into your account and revising your preferences and goals. We encourage regular updates to ensure the plan stays aligned with your current lifestyle.
                  </p>
              </div>
          </div>

          <div class="faq-item mb-3 ">
              <div class="faq-question">
                  <h3>Can I track my progress on Meal Maker?</h3>
                  <button class="faq-toggle">+</button>
              </div>
              <div class="faq-answer">
                  <p>Yes, Minova offers tools to track your health and wellness progress over time. You can log your meals, workouts, and other wellness activities to monitor your improvements and adjust your plan accordingly.</p>
              </div>
          </div>
          <div class="faq-item mb-3 ">
              <div class="faq-question">
                  <h3>How can I get support from Meal Maker?</h3>
                  <button class="faq-toggle">+</button>
              </div>
              <div class="faq-answer">
                  <p>You can reach our customer support team via:</p>
                  <li>Email : incuries@mealmaker.com</li>
                  <li>Phone : +91 90909 89890</li>
                  <li>We are here to assist with any inquiries or issues you may have.</li>
              </div>
          </div>
      </div>
    </div>
    <!--FAQ end -->

    <!-- carousel testimonial start -->
    <!-- carouseltop Section -->
    <div class="container-fluid carouseltestimonial-section " id="testimonial" >
      <h1 class="mb-4 title-text text-center ">Testimonials</h1>
      <p class="lead text-center">"Valuable client feedbacks are at the heart of our continuous improvement.<br> They inspire us to innovate, enhance our services, and ensure we consistently deliver an outstanding<br> experience that meets and exceeds expectations."</p>
      <hr class="border-3 green-text mx-auto opacity-100 mb-5" style="width: 300px;">
      <div class="container">
        <!-- Owl Carousel Container -->
        <div class="owl-carousel carouseltestimonial-carousel">
          <!-- Slide 1 -->
          <div class="col my-5 border p-3">
            <div class="d-flex">
              <div class="col-2 ">
                <img class="blogimg rounded-pill" src="images/img19.jpg" height="50px" alt="">
              </div>
              <div class="ms-2">
                <p class="m-0"><strong>Jasph</strong></p>
                <p>Developer</p>
              </div>
            </div>
            <div>
              <p class="fst-italic">"I’ve tried countless diets, but Meal Maker was the first program that truly worked for me. Their personalized approach made all the difference. I now feel more confident in my body and my eating habits."</p>
              <div class="staricons">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
              </div>
            </div>
          </div>        
          <!-- Slide 2 -->
          <div class="col my-5 border p-3">
            <div class="d-flex">
              <div class="col-2 ">
                <img class="blogimg rounded-pill" src="images/img18.jpg" height="50px" alt="">
              </div>
              <div class="ms-2">
                <p class="m-0"><strong>Ash</strong></p>
                <p>Digital Marketing executive</p>
              </div>
            </div>
            <div>
              <p class="fst-italic">"Meal Maker’s programs are easy to follow and full of delicious recipes. I’ve learned so much about balanced nutrition, and I love how I don’t have to sacrifice flavor to eat healthy and my eating habits!"</p>
              <div class="staricons">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
              </div>
            </div>
          </div>   
          <!-- Slide 3 -->          
          <div class="col my-5 border p-3">
            <div class="d-flex">
              <div class="col-2 ">
                <img class="blogimg rounded-pill" src="images/img17.jpg" height="50px" alt="">
              </div>
              <div class="ms-1">
                <p class="m-0"><strong>Akshu</strong></p>
                <p>Developer</p>
              </div>
            </div>
            <div>
              <p class="fst-italic">"I can't thankMeal Maker enough for the incredible guidance and support. I’ve finally found a nutrition plan that fits my lifestyle without feeling link-underline happier, and more in control of my eating habits!"</p>
              <div class="staricons">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
              </div>
            </div>
          </div>   
        </div>
      </div>
    </div> 
    <!-- carousel testimonial end-->
</asp:Content>

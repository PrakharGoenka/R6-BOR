<%-- 
    Document   : index
    Created on : 27 Jun, 2019, 7:27:04 PM
    Author     : rv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    >
  <title>
      R6 Form
  </title>
  <link rel="icon" href="assets/bootstrap/css/icon.ico">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/style-p.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.min.css">
</head>

<body>
  <nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-white portfolio-navbar gradient">
    <div class="container">
        <a class="navbar-brand logo" data-aos="fade" data-aos-delay="200" href="#">
            <img src="assets/img/BOR-Image.png">
            Board Of Revenue
        </a>
        
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navbarNav">
            <span class="sr-only">
                Toggle navigation
            </span>            
            <span class="navbar-toggler-icon"></span>
        </button>
        
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="nav navbar-nav ml-auto"></ul>
      </div>
        
    </div>
  </nav>
    
  <main class="page hire-me-page">
    <section class="portfolio-block hire-me">

      <div class="container">
        <div class="heading">
          <h2 data-aos="zoom-in" data-aos-delay="250">R6 web-form</h2>
        </div>

        <form data-aos="zoom-out" data-aos-delay="30">
          <div class="form-group text-center" data-aos="fade" data-aos-delay="25">
              <label for="Mode Of Transfer" style="font-size: 30px;font-family: Lato, sans-serif;">
                  Mode Of Transfer
              </label>
          </div>
            
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6 button">
                  <button 
                      type="button" 
                      onclick="document.getElementById('s-1').style.display='block';
                               document.getElementById('s-2').style.display='none'" 
                               class="btn btn-primary btn-block" 
                               type="submit"
                    >
                      Varasad
                  </button>
              </div>
              <div class="col-md-6 button">
                  <button
                      type="button"
                      onclick="document.getElementById('s-1').style.display='block';
                          document.getElementById('s-2').style.display='none'"
                          class="btn btn-primary btn-block"
                          type="submit"
                    >
                      Dhara34
                  </button>
              </div>
            </div>
              
            <div class="form-row">
              <div class="col-md-6 offset-3 button">
                  <button
                      type="button"
                      onclick="document.getElementById('s-2').style.display='block';
                          document.getElementById('s-1').style.display='none'"
                          class="btn btn-outline-primary btn-block"
                          type="submit"
                    >
                      Other
                  </button>
              </div>
            </div>
              
          </div>
            
        </form>

      </div>

      <form data-aos="flip-right" id="s-1" style="display:none">
        <div class="form-group">
            <label for="subject">
                To get Gaata Sankhya:
            </label>
            
            <select class="form-control" id="subject" required="">
            <option value="" selected=""> Janpad </option>
            <option value="1"> Subject 1 </option>
            <option value="2"> Subject 2 </option>
            <option value="3"> Subject 3 </option>
            </select>
            
            <select class="form-control" id="subject" required="">
            <option value="" selected=""> Tehsil </option>
            <option value="1"> Subject 1 </option>
            <option value="2"> Subject 2 </option>
            <option value="3"> Subject 3 </option>
            </select>
            
            <select class="form-control" id="subject" required="">
            <option value="" selected=""> Village Name/Village Code </option>
            <option value="1"> Subject 1 </option>
            <option value="2"> Subject 2 </option>
            <option value="3"> Subject 3 </option>
            </select>
        </div>
          
        <div class="form-group">
            <label for="message">
                Description Of Share Added
            </label>
            <textarea class="form-control" id="message" required=""></textarea>
        </div>
          
        <div class="form-group">
            <label for="message">
                Description Of Share Removed
            </label>
            <textarea class="form-control" id="message" required=""></textarea>
        </div>
        <div class="form-group">
            <label for="email">
                Mall Guzari(Revenue)
            </label>
            <input class="form-control" type="text" required="">
        </div>
          
        <div class="form-group">
          <div class="form-row">
            <div class="col">
                <label for="email">
                    Order Number
                </label>
                <input class="form-control" type="text" required="">
            </div>
            <div class="col-md-6">
                <label for="hire-date">
                    Date
                </label>
                <input class="form-control" id="hire-date" type="date" required="">
            </div>
          </div>
        </div>
          
        <div class="form-group">
          <div class="form-row">
            <div class="col">
                <label for="email">
                    Remark
                </label>
                <input class="form-control" type="text">
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="form-row">
            <div class="col-md-6 offset-3 button">
                <button class="btn btn-primary btn-block" type="submit">
                    Submit
                </button>
            </div>
          </div>
        </div>
      </form>


    </section>

    <section>
      <div>
        <p class="para" id="s-2" style="display:none" >
                    Service Not Available!!!
        </p>
      </div>
    </section>

  </main>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/js/bs-animation.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.min.js"></script>
  <script src="assets/js/theme.js"></script>
</body>

</html>


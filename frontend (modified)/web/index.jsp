<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
          >
    <title>
      रजिस्टर  ६ फॉर्म
    </title>
    <link rel="icon" href="assets/bootstrap/css/icon.ico">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/style-p.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.min.css">
  </head>

  <body>
    <nav class="navbar navbar-dark navbar-expand-lg
         fixed-top bg-white portfolio-navbar gradient"
         >
      <div class="container">
        <a class="navbar-brand logo" data-aos="fade" data-aos-delay="250" href="#">
          <img src="assets/img/BOR-Image.png">
          राजस्व परिषद, उत्तर प्रदेश
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="nav navbar-nav ml-auto"></ul>
        </div>
      </div>
    </nav>

    <main class="page hire-me-page">
      <section class="portfolio-block hire-me">
        <div class="container">
          <div class="heading">
            <h2 data-aos="flip-right" data-aos-delay="250">रजिस्टर ६ वेब-फॉर्म</h2>
          </div>
          <form data-aos="zoom-in" data-aos-delay="350">
            <div class="form-group text-center" data-aos="fade" data-aos-delay="250">
              <label for="Mode Of Transfer"
                     style="font-size: 30px;font-family: Lato, sans-serif;"
                     >
                हस्तांतरण की विधि
              </label>
            </div>

            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6 button">
                  <button
                    type="button"
                    id="varasat"
                    onclick="document.getElementById('s-1').style.display = 'block';
                        document.getElementById('s-2').style.display = 'none'"
                    class="btn btn-primary btn-block"
                    type="submit"
                    >
                    वरासत
                  </button>
                </div>

                <div class="col-md-6 button">
                  <button
                    type="button"
                    id="dhara34"
                    onclick="document.getElementById('s-1').style.display = 'block';
                        document.getElementById('s-2').style.display = 'none'"
                    class="btn btn-primary btn-block"
                    type="submit"
                    >
                    धारा ३४
                  </button>
                </div>

              </div>
              <div class="form-row">
                <div class="col-12 col-md-6 offset-0 m-auto button">
                  <button
                    type="button"
                    id="other"
                    onclick="
                        document.getElementById('s-2').style.display = 'block';
                        document.getElementById('s-1').style.display = 'none'"
                    class="btn btn-primary btn-block"
                    type="submit"
                    >
                    अन्य
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <div data-aos="flip-down" data-aos-delay="350" id="s-1" style="display:none">
          <form  action="./response.jsp" method="POST">

            <div class="form-group">
              <label for="subject">
                गाटा संख्या प्राप्त करने हेतु:
              </label>
            </div>

            <main >
              <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                  <div class="form-group">
                    <label for="first">जनपद</label>
                    <select type="input" name = "District" id="first"
                            class="form-control" role="listbox" required=""
                            >
                      <option value="0" selected="selected">जनपद चुने</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="second">तहसील</label>
                    <select type="input" name = "Tehsil" id="second"
                            class="form-control" role="listbox"
                            disabled="disabled" required=""
                            >
                      <option value="0" selected="selected">तहसील चुने</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="third">ग्राम</label>
                    <select type="input" name="Village" id="third"
                            class="form-control" role="listbox"
                            disabled="disabled" required=""
                            >
                      <option value="0" selected="selected">ग्राम चुने</option>
                    </select>
                  </div>

                  <input
                    class="form-control" type="number" id="gata number"
                    placeholder="गाटा संख्या(0-9999)"
                    min="0" max="9999" required=""
                    />
                </div>
              </div>
            </main>

            <div class="form-group">
              <label for="message">
                जोड़े गए हिस्से का विवरण
              </label>
              <input type="text" name="DescShareAdded" class="form-control"
                     id="message" required=""
                     />
            </div>

            <div class="form-group">
              <label for="message">
                निकाले गए हिस्से  का विवरण
              </label>
              <input type="text" name="DescShareRemoved" class="form-control"
                     id="message" required=""
                     />
            </div>

            <div class="form-group">
              <label for="email">
                माल गुज़ारी(राजस्व)
              </label>
              <input id="MallGuzari" name="MallGuzari" class="form-control"
                     type="text" required=""
                     />
            </div>

            <div class="form-group">
              <div class="form-row">
                <div class="col">
                  <label for="email">
                    आदेश संख्या
                  </label>
                  <input id="OrderNumber" name="OrderNumber" class="form-control"
                         type="text" required=""
                         />
                </div>

                <div class="col-md-6">
                  <label for="hire-date">
                    दिनांक
                  </label>
                  <input name="Date" class="form-control" id="hire-date"
                         type="date" required=""
                         />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="form-row">
                <div class="col">
                  <label for="email">
                    टिप्पणी
                  </label>
                  <input name="Remark" class="form-control" type="text"
                         />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="form-row">
                <div class="col-8 col-md-6 offset-0 m-auto button" id="submit">
                  <button class="btn btn-primary btn-block" type="submit">
                    जमा करें
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </section>

      <section>
        <div>
          <p class="para" id="s-2" style="display:none">
            सेवा उपलब्ध नहीं है!!!
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
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/script.js"></script>
    <script type="text/javascript" src="assets/js/plugins.js"></script>
    <script type="text/javascript">

                      var _gaq = _gaq || [];
                      _gaq.push(['_setAccount', 'UA-36251023-1']);
                      _gaq.push(['_setDomainName', 'jqueryscript.net']);
                      _gaq.push(['_trackPageview']);

                      (function () {
                        var ga = document.createElement('script');
                        ga.type = 'text/javascript';
                        ga.async = true;
                        ga.src = ('https:' == document.location.protocol ?
                                'https://ssl' :
                                'http://www') + '.google-analytics.com/ga.js';
                        var s = document.getElementsByTagName('script')[0];
                        s.parentNode.insertBefore(ga, s);
                      })();

    </script>

  </body>

</html>


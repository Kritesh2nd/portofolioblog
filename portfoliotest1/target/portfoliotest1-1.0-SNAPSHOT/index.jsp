<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
  <head>
    <title>Portfolio | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/5045e83b56.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <style>
      ::-webkit-scrollbar {width: 10px;}
      ::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey;border-radius: 10px;}
      ::-webkit-scrollbar-thumb{background:rgba(170,170,170,.2);border-radius:10px;transition: 0.3s;}
      ::-webkit-scrollbar-thumb:hover {background: rgba(170,170,170,.5);cursor:pointer;}
      .mainbody{height:auto;width:100%;overflow: auto;}
      .roomA1{height:60px;overflow: hidden;position:fixed;width:100%;z-index:1;}
      .roomA1{height:60px;overflow: hidden;position:fixed;width:100%;z-index:1;}
      .roomA2{padding:60px 0 0 0;}
      @media only screen and (max-width: 450px) {
        .roomA1{height:200px;}
        .roomA1{height:100vh;}
        .roomA2{padding:0;padding-top:60px;}
      }
      /* ================================================= ROOM 1 ================================================= */
      .hroom1{height:100vh;padding:0 100px;}
      
      .hr1left{width:60%;}
      .hr1right{width:40%;}
      .hr1imagebox{padding:80px 0px 80px 160px;animation:hr1animate1 1s forwards .5s linear;opacity:0;z-index:-1;}
      .hr1txtbox1{width:0%;overflow: hidden;animation:hr1animate2 1.3s forwards .5s linear;}
      .hr1txt1{font-size:65px;font-family:var(--fontfamily06);font-weight:300;padding-top:165px;width:900px;}
      .hr1txt2{font-size:30px;font-weight: 300;line-height:45px;padding:60px 0 50px 0;opacity:0;
        animation:hr1animate3 .5s forwards 1.5s linear;z-index:-1;}
      .hr1btnbox1{opacity:0;animation:hr1animate4 .5s forwards 1.5s linear;}
      .hr1btnAB{padding:8px 32px;font-size:30px;font-weight:300;margin:10px 0 0 10px;text-decoration: none;color: #000;}
      .hr1btnB{background:#fff;cursor:pointer;transition:.3s;}
      .hr1btnB:hover {margin:0 10px 10px 0;}
      @keyframes hr1animate1 {
        from{opacity:0;padding:80px 0px 80px 160px}
        to{opacity:1;padding:80px;}
      }
      @keyframes hr1animate2 {
        from{width:0%;}
        to{width:80%;}
      }
      @keyframes hr1animate3 {
        from{opacity:0;padding:60px 0 50px 0;}
        to{opacity:1;padding:35px 0 50px 0;}
      }
      @keyframes hr1animate4 {
        from{opacity:0;}
        to{opacity:1;}
      }
      @media only screen and (max-width: 450px) {
        .hroom1{height:auto;padding:0 15px;}
        .ihroom1{flex-direction:column;}
        .hr1left,.hr1right{width:100%;}
        .hr1imagebox{padding:60px 0 0 0;animation:hr1animate1 1s forwards 2s linear;}
        .hr1txt1{width:600px;font-size:40px;padding-top:60px;}
        .hr1txt2{font-size:20px;padding:40px 0 25px 0;;line-height:30px;}
        .hr1btnAB{margin:0;padding:6px 25px;font-size:28px;}
        .hr1btnB{display: none;}
        @keyframes hr1animate1 {
          from{opacity:0;padding:60px 0 0 0;}
          to{opacity:1;padding:20px 0 40px 0;}
        }
        @keyframes hr1animate2 {
          from{width:0%;}
          to{width:100%;}
        }
        @keyframes hr1animate3 {
          from{opacity:0;padding:40px 0 25px 0;}
          to{opacity:1;padding:10px 0 25px 0;}
        }
      }
      /* ================================================= ROOM 2 ================================================= */
      .hroom2{height:auto;}
      .ihroom2{padding:0 50px;}
      .hr2titlebox1{font-size:30px;font-weight:300;padding:10px 0;}
      .projectbox{padding-bottom:50px}
      .showprojectbox{padding:50px;}
      .projectimagebox{width:65%;padding:20px;}
      .hr2imagebox{box-shadow:0 0 7px rgba(0,0,0,.55);padding:15px;border-radius:4px;background:#fff;}
      .hr2paddingright{padding-right:60px;}
      .hr2paddingleft{padding-left:60px;}
      .projectimage{border-radius:4px;}
      .projecttextbox{width:35%;padding:20px 0;}
      .hr2txt1,.hr2txt2{font-family:var(--fontfamily06);font-weight:300;}
      .hr2txt1{font-size:55px;padding-bottom:20px;}
      .hr2txt2{font-size:25px;line-height:38px;padding-bottom:20px;}
      .hr2txtlogoboxes{padding-bottom:20px;}
      .hr2logoboxes{padding-right:15px;}
      .hr2logos{font-size:20px;color:#555;}
      .hr2lbtxt0{font-size:22px;color:#555;font-weight:500;}
      .hr2btnAB{padding:10px 20px;font-size:25px;font-weight:300;margin:10px 0 0 10px;text-decoration: none;color: #000;}
      .hr2btnB{background:#fff;cursor:pointer;transition:.3s;}
      .hr2btnB:hover {margin:0 10px 10px 0;}
      .h2order1{order:1;}
      .h2order2{order:2;}
      @media only screen and (max-width: 450px) {
        .hroom2{padding:0 15px;}
        .ihroom2{padding:0;}
        .showprojectbox{padding:0;}
        .projectbox{flex-direction: column;}
        .hr2imagebox{padding:10px;}
        .hr2paddingright{padding:0px;}
        .hr2paddingleft{padding:0px;}
        .projectimagebox,.projecttextbox{width:100%;}
        .hr2txt1{font-size:30px;padding:0 0 10px 0;}
        .hr2txt2{font-size:20px;padding:0 0 20px 0;line-height:28px;}
        .hr2txtlogoboxes{padding-bottom:15px;}
        .hr2logos{font-size:18px;}
        .hr2lbtxt0{font-size:18px;}

        .hr2btnAB{margin:0;padding:8px 18px;font-size:20px;}
        .hr2btnB{display: none;}
      }
      
    </style>
  </head>
  <body>
    <div class="mainbody borde">
      <div class="inrmainbody borde h100">
        <div class="roomA1 borde w100">
           <%@include file="navbar.jsp"%> 
        </div>
        <div class="roomA2 borde h100">
          <!-- ================================================= ROOM 1 ================================================= -->
          <div class="hroom1 borde">
            <div class="ihroom1 borde ins flex">
              <div class="hr1left borde">
                <div class="hr1txtbox1 borde">
                  <div class="hr1txt1 borde">
                    Hey I'm Kritesh.
                  </div>
                </div>
                <div class="hr1txtbox2 borde">
                  <div class="hr1txt2 borde">
                    A web designer and developer from Lalitpur in the Nepal. I create bespoke websites to help people go further online.
                  </div>
                </div>
                <div class="hr1btnbox1 rel flex">
                  <a href="#" class="hr1btnA hr1btnAB border">Project</a>
                  <a href="#" class="hr1btnB hr1btnAB border abs">Project</a>
                </div>
              </div>
              <div class="hr1right borde rel flex">
                <div class="hr1imagebox borde flex aic">
                  <img src="image/laptop.png" alt="" class="hr1imageA borde w100">
                </div>
              </div>
            </div>
          </div>
          <!-- ================================================= ROOM 2 ================================================= -->
          <div class="hroom2 borde">
            <div class="ihroom2 borde">
              <div class="hr2titlebox1 borde">
                FEATURED PROJECT
              </div>
              <div class="showprojectbox borde flex fdc">
                <div class="projectbox borde flex">
                  <div class="projectimagebox hr2paddingright borde">
                    <div class="hr2imagebox borde">
                      <img src="image/projectpic01.jpg" alt="" class="projectimage w100">
                    </div>
                  </div>
                  <div class="projecttextbox borde">
                    <div class="hr2txt1">My Portfolio</div>
                    <div class="hr2txt2">A simple portfolio showcasing the different aspects of myself as a programer.</div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="far fa-paper-plane hr2logos borde"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">LOGO DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-desktop hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">WEB DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-code hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">STATIC SITE DEVELOPMENT</div>
                    </div>
                    <div class="hr2btnbox rel flex borde">
                      <a href="#" class="hr2btnA hr2btnAB border">View Project</a>
                      <a href="https://kritesh2nd.github.io/portfolioclean/" target="_blank" class="hr2btnB hr2btnAB border abs">View Project</a>
                    </div>
                  </div>
                </div>
<!--                divide here-->
                <div class="projectbox borde flex">
                  <div class="projectimagebox hr2paddingleft borde h2order2">
                    <div class="hr2imagebox borde">
                      <img src="image/projectpic02.png" alt="" class="projectimage w100">
                    </div>
                  </div>
                  <div class="projecttextbox borde h2order1">
                    <div class="hr2txt1">Bakery Website</div>
                    <div class="hr2txt2">A bakery website showcasing different aspects of bakery products.</div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="far fa-paper-plane hr2logos borde"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">LOGO DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-desktop hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">WEB DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-code hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">STATIC SITE DEVELOPMENT</div>
                    </div>
                    <div class="hr2btnbox rel flex borde">
                      <a href="#" class="hr2btnA hr2btnAB border">View Project</a>
                      <a href="https://kritesh2nd.github.io/bakerysite02/" target="_blank" class="hr2btnB hr2btnAB border abs">View Project</a>
                    </div>
                  </div>
                </div>
<!--                divide here-->
                <div class="projectbox borde flex">
                  <div class="projectimagebox hr2paddingright borde">
                    <div class="hr2imagebox borde">
                      <img src="image/projectpic03.png" alt="" class="projectimage w100">
                    </div>
                  </div>
                  <div class="projecttextbox borde">
                    <div class="hr2txt1">NFT website clone</div>
                    <div class="hr2txt2">A NFT website clone featuring Bored Ape.</div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="far fa-paper-plane hr2logos borde"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">LOGO DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-desktop hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">WEB DESIGN</div>
                    </div>
                    <div class="hr2txtlogoboxes hr2txtlogobox1 borde flex">
                      <div class="hr2logobox1 hr2logoboxes borde flex aic">
                        <i class="fas fa-code hr2logos"></i>
                      </div>
                      <div class="hr2lbtxt1 hr2lbtxt0 borde">STATIC SITE DEVELOPMENT</div>
                    </div>
                    <div class="hr2btnbox rel flex borde">
                      <a href="#" class="hr2btnA hr2btnAB border">View Project</a>
                      <a href="#" class="hr2btnB hr2btnAB border abs">View Project</a>
                    </div>
                  </div>
                </div>
<!--                divide here-->
              </div>
            </div>
          </div>
          <!-- ================================================= ROOM 3 ================================================= -->
          <div class="hroom3 borde"></div>
          <!-- ================================================= ROOM 4 ================================================= -->
          <div class="hroom4 borde"></div>
        </div>
        <div class="roomA3 borde w100">
           <%@include file="footer.html"%>
        </div>
      </div>
    </div>
  </body>
</html>

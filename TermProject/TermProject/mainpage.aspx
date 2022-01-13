<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainpage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" href="images/flag.png"> <!-- This line for browser window icon (Turksih Flag)-->
    <title>MainPage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <!--   En üst navibar Menü kısmı bootsraptan çekiyorum  -->

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Fixed top means, bar always stands uppest the site.-->
                                                                        <!-- Dark means is dark color and back ground-->
        <div class="container-fluid">
          <a  class="navbar-brand" href="#">WELCOME TO ENGLISH WORLD</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
            <ul class="navbar-nav">
              <li class="nav-item">
                  
                <a href="<%= Page.ResolveUrl("http://localhost:30200/INSTRUCTORS.aspx") %>" class="nav-link active" target="_blank" aria-current="page" >INSTRUCTORS</a>  
              </li>
              <li class="nav-item">
               
                  <a href="<%= Page.ResolveUrl("http://localhost:30200/LESSON.aspx") %>" class="nav-link active" target="_blank" aria-current="page" >AVALIABLE LESSON</a>
              </li>
              <li class="nav-item">
               <a href="<%= Page.ResolveUrl("http://localhost:30200/STUDENTS.aspx") %>" class="nav-link active" target="_blank" aria-current="page" >STUDENTS</a>
              </li>
              <li class="nav-item">
                <a href="<%= Page.ResolveUrl("http://localhost:30200/SCHEDULE.aspx") %>" class="nav-link active" target="_blank" aria-current="page" >SCHEDULE</a>
              </li>

            </ul>
          </div>
        </div>
      </nav>
        </div>

         <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="images/eng.jpg" class="d-block w-100" alt="..." height="900px">
            <div class="carousel-caption d-none d-md-block">
              <h2>Do More with US</h2>
              <p>Do you want see about me part, click slider!</p>
            </div>
          </div>
          <div class="carousel-item">
            <a href="#2"> <img src="images/experience.jpg" class="d-block w-100" alt="..." height="600px"></a>
            <div class="carousel-caption d-none d-md-block">
              <h5 style="color: red;">Do you want see Experience part, click slider!</h5>
              <p style="color: red;">Zafer Otomotiv, TÜBİTAK BİLGEM, etc</p>
            </div>
          </div>
          <div class="carousel-item">
            <a class="dropdown-item" href="https://www.linkedin.com/in/berat-can-duman-gadget/"  target="_blank"> <img src="images/social.jpg" class="d-block w-100 " alt="..." height="600px"></a>
            <div class="carousel-caption d-none d-md-block">
              <h5 style="color: black;">Do you want see my social media accounts, click slider!</h5>
              <p style="color: black;">LinkedIn, Instagram, etc.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </form>
</body>
</html>

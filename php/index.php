<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1.0">
  <title>Runyon's Realm</title>
  <link href="http://fonts.googleapis.com/css?family=Droid+Serif:400,400" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/standardize.css">
  <link rel="stylesheet" href="css/index-grid.css">
  <link rel="stylesheet" href="css/index.css">
  <script type="text/javascript" async
    src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
  </script>
  <script 
    src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
  </script>
  <script type='text/javascript'>
    $(document).ready(function(){
      $(".sh-section-btn").on("click",function(){
        $(this).parent().children(".h-section-cont").slideToggle(200);
      });
    });
  </script>
  <script>
	  function showHide(shID) {
		if (document.getElementById(shID)) {
			if (document.getElementById(shID+'-show').style.display != 'none') {
				document.getElementById(shID+'-show').style.display = 'none';
				document.getElementById(shID).style.display = 'block';
			}
			else {
				document.getElementById(shID+'-show').style.display = 'inline';
				document.getElementById(shID).style.display = 'none';
			}
		}
	  }
  </script>
</head>
<body class="body page-index clearfix">
  <div class="container clearfix">
    <div class="footer clearfix">
      <p class="text"><em>This is a personal web site. Blog posts, tutorials, and all other written content
	  (including web site design and development) has been exclusively authored by Matt Runyon.
	  The views expressed herein are solely those of the author and not of any organization that the author is affiliated with.
	  They are also subject to change over time.</em>
	  </p>
    </div>
    <p class="rightpanetitle RightPane-1"><b>Matt Runyon</b></p>
    <button onClick="window.location='nutrition.php';" class="_button _button-1">Nutrition</button>
    <button onClick="window.location='crypt.html';" class="_button _button-2">Cryptography</button>
    <button onClick="window.location='physics.html';" class="_button _button-3">Physics</button>
	<button onClick="window.location='fitness.html';" class="_button _button-4">Fitness</button>
	<button onClick="window.location='tribes.html';" class="_button _button-5">Tribes</button>
	<button onClick="window.location='aoe.html';" class="_button _button-6">Age of Empires</button>
	<button onClick="window.location='machinelearning.html';" class="_button _button-7">Machine Learning</button>
    <p class="contactlink"><a href="contact.html">Contact</a></p>
    <p class="aboutpagelink"><a href="about.html">About This Page</a></p>
    <p onClick="window.location='https://drive.google.com/open?id=0B_Fe1ZT6AqgZVGNvYTZ6dTJDNWc';" class="cvlink">Curriculum Vitae</p>
    <p class="homelink"><a href="index.php">Blog</a></p>
    <div class="rightbar clearfix">
      <div class="rightbarcontent"></div>
      <p class="aboutmatttext">Hi! <br><br>Welcome to my spot on the 'net. <br><br><u>Bio</u></p>
	  <p class="biotext"><br>Matt Runyon is a Canadian engineer who is passionate about science, technology, fitness, and adventure.
	  He holds a B. Eng. in Engineering Physics from Carleton University and a M.Sc. in Physics from the University of Ottawa.
	  </p>
    </div>
    <p class="tutorialtitle tutorialtitle-2">Tutorials<br><br><br><br><br>Gaming</p>
    <div class="leftbar"></div>
    <div class="buttons"></div>
    <div class="frontimage"></div>
    <div class="menu"></div>
    <div class="blog">
		<?php
		  // Create connection
	      $servername = "localhost";
	      $username = "user";
	      $password = "";
	      $conn = mysqli_connect($servername, $username, $password);
	      if (!$conn) {
	      	die("Connection failed: " . mysqli_connect_error());// Check connection
	      }
		  //Select blog database
		  $db_selected = mysqli_select_db($conn,'db_blog');
		  if (!$db_selected) {
		  	die ('Can\'t use database : ' . mysql_error());
		  }
	      //Get blog articles
		  $query =  mysqli_query($conn,"SELECT * FROM posts");
		  if (!$query) {
		    printf("Error: %s\n", mysqli_error($conn));
		    exit();
		  }
		  /* ACTUAL 
		  while($row = mysqli_fetch_array($query))
		  {
			$post = str_split($row['post']);
			$title = $row['title'];
			$showPost = array_slice($post,0,600);
			$hiddenPost = array_slice($post,600);
		  	echo "<div class=\"article\"><h1><b>" . $row['title'] . "</b></h1>";
			echo "<h2><i>" . $row['submissiondate'] . "</i></h2>";
			echo "<p>" . implode($showPost);
			
			echo "<a href=\"#\" id=\"" . $title . "-show\" class=\"showLink\" 
                 onclick=\"showHide('post_" . $title . "');return false;\">See more.</a></p>";
			echo "<div id=\"post_" . $title . "\" class=\"more\">";
			echo "<p>Yo this shit is hidden</p>";
	        echo "<p><a href=\"#\" id=\"" . $title . "-hide\" class=\"hideLink\" 
	             onclick=\"showHide('post_" .  $title . "');return false;\">Hide this content</a></p></div>";
			echo "</div>";
		  }
		  */
		  
		  while($row = mysqli_fetch_array($query))
		  {
			$picQuery =  mysqli_query($conn,'SELECT * FROM pics WHERE blog_id=' . $row['id'] . ';');
			$post = str_split($row['post']);
			$pos = strpos($row['post'],' ', 570);
			$title = $row['title'];
			$showPost = array_slice($post,0,$pos);
			$hiddenPost = array_slice($post,$pos+1);
			$picRow = mysqli_fetch_array($picQuery);
		  	echo "<div class=\"article\"><h1><b>" . $row['title'] . "</b></h1>";
			echo "<img src=\"images/" . $picRow['pic'] . "\" alt=\"" . $picRow['pic'] . "\" style=\"width:" . $picRow['width'] . "px;height:" . $picRow['height'] . "px;float:right;\">";
			echo "<h2><i>" . $row['submissiondate'] . "</i></h2>";
			echo "<p>" . implode($showPost) . "...</p> 
                 <a href=\"#\" id=\"" . $title . "-show\" class=\"showLink\" 
                 onclick=\"showHide('" . $title . "');return false;\">See more.</a>
                 </p>
                 <div id=\"" . $title . "\" class=\"more\">
	             <p>" . implode($hiddenPost) . "</p>
	             <p><a href=\"#\" id=\"" . $title . "-hide\" class=\"hideLink\" 
	             onclick=\"showHide('". $title . "');return false;\">Hide this content.</a></p>";
			     //printf(\"%.600s ...\n", $row['post']);
			echo "</div></div>";
		  }
		  
        ?> 
	</div>
  </div>
</body>
</html>
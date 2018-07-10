/*-----------------------------------------------------------------------------------*
 | Title: createBlogDB.sql															 |
 | Author: M. Runyon																 |
 | Date: February 26th, 2017														 |
 |																					 |
 | Description: This script creates a MySQL database for my personal web sites blog. |
\*-----------------------------------------------------------------------------------*/

/* Create the database */
CREATE DATABASE IF NOT EXISTS db_blog;
USE db_blog;

/* Create the tables in the database */
CREATE TABLE posts (
			 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 title VARCHAR(255) NOT NULL,
			 submissiondate DATETIME NOT NULL DEFAULT NOW(),
			 post TEXT NOT NULL,
			 pic VARCHAR(255)
			 );
			 
CREATE TABLE comments (
			 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 blog_id INT NOT NULL,
			 user VARCHAR(255) NOT NULL,
			 commentdate DATETIME NOT NULL DEFAULT NOW(),
			 comment TEXT NOT NULL
			 );
			 
CREATE TABLE tags (
			 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 tag VARCHAR(255) NOT NULL,
			 blog_id INT NOT NULL
			 );

CREATE TABLE pics (
			 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			 pic VARCHAR(255) NOT NULL,
			 blog_id INT NOT NULL,
			 width INT NOT NULL,
			 height INT NOT NULL
			 );

/* Add some entries */
INSERT INTO posts(
			title,
			post,
			pic)
VALUES('Cryptography and Thermodynamics',
	   'About a month ago I picked up <a href=\"https://www.schneier.com/\" target=\"_blank\">Bruce Schneier\'s </a> \"<i>Applied Cryptography</i>\" (1996).
	   I have been trying to learn more and more about cryptography in general, mostly through coding various algorithms and known breaks in C, but
	   decided that it was time for a more pedagogical approach. I say, without a doubt, the book lived up to its reputation of being the de facto standard in cryptoscience/cryptanalysis.
	   After a month of perusal, I have no regrets about making the purchase and taking time off from more pressing priorities to immerse myself in the world of cryptography.
	   Not only did I pass a cryptanalysis exam after my perusal (though the coding definitely helped), but the satisfaction of learning something new was great.
	   <br><br>There was one portion of the book, Section 7.1, that really offered some perspective and peeked my interest as a physicist. It is on the topic of public-key length
	   and how thermodynamic principles can be applied to help dictate what a \'safe\' key length should be. The considerations are as follows:<br><br>
	   <ol>
	   <li>The second law of thermodynamics implies that the representation of information requires energy, or changing the representation of information requires energy.</li>
	   <br><li>For an N-bit key, there are 2<sup>N</sup> possible keys.</li>
	   </ol><br>
	   The section goes on to explain that if a 219-bit key length was used, then the \'worst-case\' amount of energy required to complete an unlucky brute-force attack is
	   greater than the amount of energy released in a supernova! Furthermore, as one reads later sections of the book, this logic is extended to make the claim that even if 
	   storing all possible keys for a 512-bit key (larger than the previous supposed key) would be impossible on the grounds of the 
	   <a href=\"https://en.wikipedia.org/wiki/Chandrasekhar_limit\" target=\"_blank\">Chandrasekhar Limit</a>; the database storing
	   these possible keys would manifest itself as electronics weighing more than several stars! Now, this certainly blew my mind to read, but as a skeptic I had to verify
	   this calculation by modern-day standards. <a href="physics.html#cryptAndThermo">So I did</a> ... and it checks out!<br><br>
	   Things like this have always fascinated me. How beautiful is the complexity and depth of mathematics? I remember years ago I was told that \'there are more possible chess moves than atoms in the observable universe\'. This was
	   said to me over beers from a man who was not in the sciences so I was immediately skeptical (and, admittedly, ignorant ... blame it on the beers) and asked him to prove it,
       or at least explain it. I didn\'t get the explanation that I had sought so I decided to research it for myself. Lo and behold, the drunken layman was correct, though I would
	   not have worded it as above. I would opt to say, \'there are more possible chess games to be played than atoms in the universe\' ... I\'m a pedant ... But I digress. 
	   The point here is that the vastness in what is available to human perception is both astonishing and depressing, for the vastness of what is not available to human perception
	   is almost certainly greater.',
	   'padlock.jpg
	   ');
	   
/* Add some entries */
INSERT INTO posts(
			title,
			post,
			pic)
VALUES('Transhumanism and Artificial Intelligence',
	   'If I was not in the field I am in today, then
	   I would definitely be involved in computer science - machine learning/artificial intelligence (AI) in particular. Why? Because I think that pushing the boundaries and advancing in hese areas
	   is an efficient way to bring about the <a href=\"https://en.wikipedia.org/wiki/Technological_singularity\">technological singularity</a> (yes, I\'m one of those guys). I get an overwhelming sense of passion and motivation thinking about this concept,
	   and I don\'t think many people give it much thought.  	   
	   If you\'re familar with Hugo de Garis\' idea of the <a href = \"https://en.wikipedia.org/wiki/Hugo_de_Garis#The_Artilect_War\">Artilect War</a>, which discusses the societal ramifications of approaching a technological singularity, I lean more towards the Cosmists (though I\'m
	   reluctant to call myself one). If you have no idea what that means, don\'t worry: this de Garis guy asks the following question:\'if AI can be developed in a way so advanced that it
	   has the power to make humanity\'s wildest dreams come true, but at the same time poses a real existential threat, should we, as a society, proceed with developing it?\'<br><br>
	   If you answer yes, then you are a Cosmist. If you answer no, then you are a Terran - de Garis asserts that there is a Cosmist vs. Terran dichotomy. 
	   My justification as a Cosmist is that there\'s a lot wrong in the world that technology stands to rectify. Every year there are advancements in medicine that
	   are due to technology - the singularity may bring us autonomous nanobots that cleanse the blood stream and prevent the onsite of any disease at the atomic level.
	   Maybe you or a loved one needs a heart transplant, or have lost limbs. Why not substitute the needed tissue for an electro-mechanical system? Look how far mathematics
	   and physics have pushed humanity in the last century. True AI, or as <a href=\"https://en.wikipedia.org/wiki/Ben_Goertzel\">Ben Goertzel</a> would say, true AGI 
	   (articifial <i>general</i> intelligence) should eventually be able to prove mathematical theorems with an ease that would make the likes of David Hilbert small-time.
	   The best-case scenario is that humanity achieves everything from interstellar travel to immortality.
	   If you answer no, then you are a Terran. Maybe you believe that humanity will never be able to guarantee that a Skynet situation will not unveil, and this scares you
	   too much to try - a valid point. Maybe you are content in the way things are and think humans can achieve the same greatness as above on their own. Maybe you believe that siding with
	   the Cosmists is \'not in God\'s plan\' (in which case I will need to excuse myself to hurl). The worst-case scenario for Terrans is that the AGI becomes too 
	   advanced with too little regard for human welfare, and all of us are either killed or enslaved, maybe used as batteries for machines as depicted in The Matrix.
	   de Garis postulates that within this century, the world is going to have to choose
	   a side, Cosmists or Terrans, and this will result in the largest war in history. de Garis feels it more likely that this war is what could end humanity,
	   rather than the worst-case scenario of a Skynet-like situation posed in science-fiction films. [Wondering who the hell this de Garis guy is? Check his <a href=\"https://profhugodegaris.wordpress.com\">web site</a>. Wikipedia is always good, too.]<br><br>But maybe there doesn\'t have to be such a dichotomy.
	   Could humanity strive to achieve this technological singularity as much as possible without risking the survival of our species? Will there come a point where safeguards will inhibit
	   the intelligence of AGI? I attended a talk given by a Japanese researcher in 2015 on artificial intelligence at Carleton University. The area this researcher (her name
	   escapes me) was focused in was \'artificial emotions\'. It was explained that it would be desirable to eventually have robots that exhibit emotional behaviour. This emotional
	   behaviour would consist of things such as typical facial expessions and tones of voice during interactions with humans. While this is fine, obvious safeguards against the Terrans\'
	   worst-case scenario would be to leave out all other emotional behaviour, forcing human welfare as a main priority, etc ...<br><br>
	   There is also the topic of transhumanism, another related movement I am passionate about. Transhumanism is an international and intellectual movement that aims to transform the human condition by developing
	   and making widely available sophisticated technologies to greatly enhance human intellectual, physical, and psychological capacities. As of Febrary 2017, this
	   movement is beginning to become more political, with <a href=\"https://en.wikipedia.org/wiki/Zoltan_Istvan\">Zoltan Istvan</a> running for governor of California and, ostensibly,
	   pushing a transhumanist agenda rooted in the endorsement of science and technology (<a href=\"\http://newatlas.com/zoltan-istvan-interview-transhumanism-politics/48041/">here</a>
	   is a decent interview with Zoltan on this topic). If the future doesn\'t hold AGI/AI in the form of robots, perhaps we can look forward to a different type of AI -- <i>Augmented Intelligence</i>.
	   Imagine having a very basic chip dropped into your brain that allows you to store a petabyte (a thousand terabytes) of anything; every mathematical formula known to mankind, every road in the world,
	   the vocabulary of every language. Or imagine having muscles replaced with electro-active polymers that can expand and contract at the command of your usual brain signals -- they do not tire, they do not
	   wear, and if they do wear you just swap them out for new ones when needed. I\'m not saying I think these technologies are around the corner, but they\'re conceivable. In fact, several friends and colleagues of mine 
	   have research these polymers, and one even launched a startup (<i>Patterns</i>). Achieving these goals and dream relies on a cohesive effort from talented professionals in physics, engineering, neuroscience, medicine,
	   and more. But even more importantly, these things things can only be realized if the world opens up to them. We need to get involved in politics and policy. We need to spread awareness to the general popululation
	   and communicate these ideas to them in such a way that they understand the plausibility and what is at stake instead of laughing it off as science fiction or shunning it out of fear or lack of understanding. If this 
	   resonates with you in any way, don\'t tell me, I already <i>get it</i> -- enlighten someone else!',
	   'bioniceye.jpg
	   ');
	   
INSERT INTO comments(
			blog_id,
			user,
			comment)
VALUES('1',
	   'Mike',
	   'Okay, but how do they get the caramel inside of a caramilk bar?
	   ');
	   
INSERT INTO comments(
			blog_id,
			user,
			comment)
VALUES('1',
	   'Brad',
	   'I can drink a six pack and light my farts on fire.
	   ');
	   
INSERT INTO comments(
			blog_id,
			user,
			comment)
VALUES('2',
	   'User123456789',
	   'I just got the M31 implant myself ... #noRagrets.
	   ');
	   
INSERT INTO pics(
			pic,
			blog_id,
			width,
			height)
VALUES('padlock.jpg',
	   '1',
	   '100',
	   '100'
	   );
	   
INSERT INTO pics(
			pic,
			blog_id,
			width,
			height)
VALUES('bioniceye.jpg',
	   '2',
	   '200',
	   '150'
	   );
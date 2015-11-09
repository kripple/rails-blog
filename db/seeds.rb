User.create(
	name:"Kelly", 
	password:"password", 
	about: "<p>I am recent graduate of <a href='http://devbootcamp.com/learn-ruby-javascript/overview/'>Dev Bootcamp NYC (Firefly cohort)</a>, a 19 week web development bootcamp program. I'm currently seeking an opportunity to use my Front End and Full Stack Web Development skills in the D.C. area.</p>

  <p>I love dogs, yoga, and science fiction novels. I used to work as a Yoga Assistant at <a href='http://downdogyoga.com/'>Down Dog Yoga</a> in Georgetown and I most recently finished <a href='https://en.wikipedia.org/wiki/Saturn%27s_Children_(novel)'>Saturn's Children</a> by Charles Stross.</p>

  <p>If you are interested in reading about my experiences with Dev Bootcamp, check out my <a href='http://kellyripple.com/posts'>blog</a>. I post about my experiences, cultural issues, and technical topics.</p>"
  )

# make tags
css = Tag.create(name:"CSS")
html = Tag.create(name:"HTML")
yoga = Tag.create(name:"Yoga")
git = Tag.create(name:"Git")
github = Tag.create(name:"Github")
js = Tag.create(name:"JavaScript")
ruby = Tag.create(name:"Ruby")
sinatra = Tag.create(name:"Sinatra")
postgres = Tag.create(name:"PostgreSQL")
agile = Tag.create(name:"Agile")

# make posts

p = Post.create(
	title: "Git vs. Github",
	date: "May 24, 2015",
	description: "A beginner's explanation.",
	body: "<p>Hello reader! This is my first blog post EVER, so please be generous with your feedback, should you have any.</p>

    <p>Let me start off by saying that Git and Github are completely different things, I know, I was shocked too. People throw around the word 'Github' enough that it starts to seem more magical than it really is. Github.com is just a website. It functions a lot like Dropbox - a place to remotely store things. Github is best at storing code, in fact, it's the world's largest such host.</p>

    <p>Git, on the other hand, is a thing that you install on your personal computer to perform version control on your code. It does this by keeping track of every minute change (down to the character) between one 'commit' (save point) and the last. With git, reverting to a previous version is as easy as typing a single command. This is really good news for anyone interested in creating functional code. Your latest edit breaks a few things? Revert it!</p>

    <p>So, why should you care about Git or Github, you may have asked yourself a few paragraphs north of here? I will tell you why! Git and Github are the best things out there (right now) for version control of code. Used in tandem, they're a beautifully sophisticated solution to a snarly problem - how can one possibly keep track of code changes when working on a development team? Git + Github is how. Happy Coding!</p>",
  published: true)

Tagging.create(tag: git, taggable_type: Post, taggable_id: p.id)
Tagging.create(tag: github, taggable_type: Post, taggable_id: p.id)

p = Post.create(
	title: "Yoga & Devbootcamp (DBC)",
	date: "May 24, 2015",
	description: "My response to watching Shereef's Fireside Chat.",
	body: "<p/>I never thought this day would come - me with a blog. I somehow doubt that blogging and tweeting will be the only new behaviors I will inherit from this educational adventure called Dev Bootcamp. This post marks the completion point of week one. The following is my response to a discussion on DBC culture. 

    <p>I was first introduced to the DBC philosophy in a yoga studio. I've been an avid hot yoga practitioner for the past few years. I went so far as to obtain a teacher's certification - 200 hours of the best good sweaty fun that can be had while clothed. For those of you that have never done yoga and/or have no idea where I'm going with this, let me explain! The way you become 'better' at yoga is oddly similar to the way DBC would have us become 'better' at web development. Ready? I'm going to make a list of advice given to new boots: 

      <ol>
        <li>Come in with the attitude of \"This is *my* time, I'm going to make it awesome\"</li>
        <li>Know that \"This is all one big experiment\"</li>
        <li>\"Bring yourself to the table and believe in others to do the same\"</li>
        <li>\"Come in and MAKE A MESS\"</li>
        <li>Identify your fears because \"Fear will only hold you back\"</li>
        <li>\"We'll provide the structure and the setting so that you can kick your own ass\"</li>
        <li>\"To succeed, you have to make yourself vulnerable\"</li>
        <li>\"Be motivated, be inspired, and be inspiring\"</li>
      </ol>

    </p>

    <p>The thing is, all of those phrases would be equally as appropriate if stated in a yoga class. It's a radical shift from the traditional educational paradigm, that rewards being 'right' above being inspired. I find this new paradigm captivating. I truly believe it is the best mindset to have to succeed in ... anything, and I'm incredibly grateful to have the opportunity to practice it.</p>",
  published: true)

Tagging.create(tag: yoga, taggable_type: Post, taggable_id: p.id)

p = Post.create(
	title: "CSS Madness",
	date: "May 30, 2015",
	description: "My first attempt at understanding CSS.",
	body: "<p>I spent the past week learning HTML and CSS, having zero prior experience with either. With the right guidance, it's surprisingly doable. No learning experience is complete without some moments of struggle, and I had plenty. Hopefully you will be able to benefit from my pain. The two worst positioning nightmares I came accross were position:relative/absolute/fixed and display:inline/block/inline-block. I'll run through the definitions of each, and include my advice on using the things. </p>

    <table>
      <tr class='first-row'>
        <td class='first-column'>position:fixed</td><td>Object displays relative to the browser window, and is immune to scrolling.</td>
      </tr>
      <tr>
        <td class='first-column'>position:relative</td><td>Objects display relative to the browser, irrespective of any other elements on the page. I'm not sure why anyone would use this option, ever.</td>
      </tr>
      <tr>
        <td class='first-column'>position:absolute</td><td>The most useful option for positioning objects. Objects display relative to it's preceeding positioned (fixed, relative, or absolute) element. If the object is the first positioned element, it will display relative to the browser window.</td>
      </tr>
      <tr>
        <td class='first-column'>position:static</td><td>This is the default position setting. Objects will display in order.</td>
      </tr>
      <tr>
        <td class='first-column'>display:inline</td><td>This is the default value. It doesn't do anything.</td>
      </tr>
      <tr>
        <td class='first-column'>display:block</td><td>Displays objects the same way &lt;p&gt; displays text, in vertically arranged chunks.</td>
      </tr>
      <tr>
        <td class='first-column'>display:inline-block</td><td>Displays objects in horizontally arranged chunks. This is the most useful display option.</td>
      </tr>
    </table>

    <p>In conclusion, you most likely want to be using position:absolute, and display:inline-block if you're trying to position objects. </p>
    
    <p>A word to the wise - If you're changing the display or position properties and you think elements should be moving, but they are not, please, <i>please</i>, check your spelling. Do it for me. I wasted at least an entire hour fiddling with my stylesheet while my HTML class had a dash, and my CSS representation had an underscore. That was not the only time I had a spelling bug this week, it's easy to do, and easy to miss, so check your work!</p>
    <p>Hopefully some of this was helpful. Feedback is always welcome.</p>",
  published: true)

Tagging.create(tag: html, taggable_type: Post, taggable_id: p.id)
Tagging.create(tag: css, taggable_type: Post, taggable_id: p.id)

# 
# make projects
# 

# css = Tag.create(name:"CSS")
# html = Tag.create(name:"HTML")
# yoga = Tag.create(name:"Yoga")
# git = Tag.create(name:"Git")
# github = Tag.create(name:"Github")
# js = Tag.create(name:"JavaScript")
# ruby = Tag.create(name:"Ruby")
# sinatra = Tag.create(name:"Sinatra")
# postgres = Tag.create(name:"PostgreSQL")
# agile = Tag.create(name:"Agile")
rails = Tag.create(name:"Ruby on Rails")

p = Project.create(
	title: "Hangman",
	description: "A simple Hangman app.",
	url: "http://kripple.github.io/projects/hangman/hangman.html",
	source: "https://github.com/kripple/kripple.github.io/tree/master/projects/hangman",
	published: true)

Tagging.create(tag: html, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: css, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: js, taggable_type: Project, taggable_id: p.id)

p = Project.create(
  title: "Unicorns on Rails",
  description: "A basic Rails CRUD app. Explores the functionality of the Devise and Ransack Gems.",
  url: "http://unicorns-on-rails.herokuapp.com/",
  published: true)

Tagging.create(tag: html, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: css, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: js, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: html, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: ruby, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: rails, taggable_type: Project, taggable_id: p.id)

p = Project.create(
	title: "Flash Cards",
	description: "Study and play trivia with user-generated flashcards.",
	url: "http://the-flash-cards.herokuapp.com/",
	published: true)

Tagging.create(tag: html, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: css, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: js, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: ruby, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: sinatra, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: postgres, taggable_type: Project, taggable_id: p.id)
Tagging.create(tag: agile, taggable_type: Project, taggable_id: p.id)













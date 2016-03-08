---
layout: post
title: "Modern development workflow"
catchphrase: Lightweight, remote, asynchronous.
date: 2011/11/24
slug: modern-development-workflow
cover_image: cover_image_modern_dev_workflow.jpg
cover_image_caption: "Kiel Exposure by Frank Lindecke, released under CC BY-ND 2.0"
---

Developing high-quality software in little time is hard when you are a single developer, but it gets even harder when you are a group of developers working on the same project. Technology can enable us to work better together without forcing everyone into tight regulations on how, when and where they do their work.

Of course, without some rules about the workflow, structured collaboration is unlikely to happen, so there needs to be some rules, but they should not get into the way of the real work. I will describe a workflow that does just that by using modern technologies to support developers at every possible degree.

<!-- more -->

Information is critical
-----------------------

In every software-project there will be a point where every developer has only partial knowledge about the developed software. This may happen because the team gets so big that the informal information-flow doesn't suffice to provide everyone with every change made or because new developers join the team. Even if there are few developers, some details about the software will be lost after some time because people simply forget things.

Lost knowledge leads to duplication of functions and, at worst, to bugs due to incorrect usage of functions. In general it reduces the code-quality of the project.

Another aspect of insufficient information is the problem that with a bigger number of developers working on a project in parallel, deciding who should do what gets more difficult. More information has to be exchanged with more people in order to decide what are the next things to do and who should do it in which order.

If a developer needs information about a part of the software he doesn't know and the information is not written down somewhere, he has to get it from another developer who has the information. Even if this developer is available at this time, the information-transfer takes time in which both developers can't get other work done.

Information needs to be available to all developers without bothering other team members. The classic approach to this problem is using some sort of documentation system, mostly a wiki, to store information. But this will only capture a part of the whole information in the team. Many details are never stored in the documentation system, it travels across the team by occasional chats. These details are not available most of the time to most of the team but might be the reason for new bugs or inefficient design of the software.

Developers are used to getting information by using technology, a big part of their work is getting information about how some library works or why a function could be slower than expected. Finding this information became second nature to them, they are highly efficient in it. If they are forced to retrieve information they need by walking around and asking someone it will slow them down radically. Developers hate to be slowed down.

Capture everything
------------------

How can every relevant information be captured and the development workflow improved at the same time? By giving the developers new tools. Developers love new tools, but they have to be good or they will be abandoned. They need to make developers lives easier.

There are three fields in a development project in which information has to be captured: The code, the problem domain and the environment.

### The code

This is the area developers are most comfortable, they know how to code and most of them also know how to write understandable and maintainable code, that is what they practice most. There are vast amounts of books and articles about writing good code and designing great software, it will not be scope of this article. An important part in the area of code when it comes to collaboration is the usage of a source code management system. This is essential for every successful team and also very useful for individuals.

#### Git

We are in the third generation of source code management systems and there are some good systems to choose from. Anyway, one system has made a triumph in the last few years, adopted by many developers in short time. This system is called “Git” and is the fundament of the workflow presented. Git makes branching and, more important, merging of branches very easy. This enables developers to create branches for every feature and bugfix. The process is:

* There is one main branch called “master” which is deployable at any time.
* When a developer wants to implement a new feature or fix a bug, he creates a branch from the master-branch and starts implementing.
* He can make commits to his branch as much as he likes without affecting anyone else, he can also merge new things from the master branch into his branch if they are relevant for his development.
* When the feature is ready, the branch is merged into the master-branch and the developer-branch is deleted some time afterwards.

Using branches has several advantages: Developers working on different features are not hindering each other, commiting changes will not affect anyone else and therefor developers are commiting more often, which creates a finer granularity of changes and captures more information about the implementation. The current branches reflect where work is being done, this contributes to information distribution in the team because everyone can see what happends when he fetches the changed branches.

#### GitHub

On top of Git there is GitHub, a webapp for hosting Git-repositories and managing development. GitHub is another good reason why to use Git for source code management. GitHub provides a web-interface for browsing the code and the commits, lets everyone comment on commits and adds an issue tracker and a wiki to the project. By having a web-interface to the full source code, referencing to specific lines of code is as easy as sharing a link. Seeing and commenting on commits supports collaboration. Integrated issue-tracking makes it easier to define relations between issues and commits. The wiki is a Git-repository by itself, so developers can work on it with their editor of choice or in the web-interface, which encourages changes to the wiki. Developers will not use something if they don't like how they have to use it, giving them the choice to use their way will make them use it more often.

#### Code review

Code review is an important practice for distributing information about the developed system across the team and sharing development knowledge between developers. Both results in an improvement of the overall code quality. Code reviews are very well integrated by GitHubs pull requests. When a developer has finished work on his branch, he creates a pull request in GitHub to merge the changes into the master-branch. Everyone gets notified and at least one other developer looks at the changes, for which GitHub provides a very nice interface, and approves them or comments on them. If there is need for improvement, the creater of the pull request changes the code and commits on his developer branch, which is directly reflected in the pull-request on GitHub and can then be approved by some other developer. If everything is fine, GitHub provides the functionality of merging the developer branch into master with the push of a button. The pull request is then closed and contributes to the history of changes to the software which every developer may access through GitHub.

### The problem domain

Code is not written for the sake of code being written, but to solve problems, mostly business-related problems. Understanding these problems is the first step to solve them. Domain specific knowledge is required. This knowledge is ideally available to all developers, all the time. In practice, there is one domain expert, who is normally not a developer. Developers need to talk to him to gain domain knowledge. These informations will be tracked in a wiki to enable later access. Everyone participating in a project needs access to the wiki, so it needs to be easily editable and always accessible. Almost every wiki meets these criteria, but the wiki which GitHub provides is a good start because it's hosted and maintained by experts. It is just another Git-repository consisting of text files, so integration with other tools to process the data in the wiki or migration to other solutions later is very easy.

The other part of the information related to the problem domain is tracking features and their implementation status. And because we live in an imperfect world, also bugs must be tracked somewhere. The solution here is no secret: Software known as bug- or issue-tracker, where tickets related to features and bugs are created, assigned to the responsible person and closed when the bug is fixed or the feature is implemented. Because the bug-tracker is often the first step to a formal development process, many solutions tend to mutate into project management software which tries to implement and dictate the whole process. In the process described here, the bug-tracker is only one tool in the process, so a lean solution is needed. [Quassum](http://www.quassum.com) doesn't try to implement a specific process and just “gets out of the way”. It lets the user create tickets, assign them to responsible persons or groups and offers a comment-system to discuss and capture information relevant to the ticket.

### The environment

Software needs, beside a compiler or interpreter, a growing set of libraries and other software like databases and webservers to work. These components define the environment in which the software lives. The environment needs to be maintained and curated and because developers are (hopefully) the ones who decide how the environment should look like, it's their job to create and maintain it.

#### Development

Especially projects which start using a technology stack the developers aren't familiar with, setting up a working development environment is a difficult task. This environment needs to be created for every developer which gets tideous and creates the danger of slight differences (like different compiler versions) between environments. These differences lead to hard to reproduce bugs which only happen in one development environment. Setting up a new development environment because of hardware migration or team growth is as difficult as the first time, binding developer time which could be used better. Therefor development environments need to be cloneable very easy. With virtualization-support on hardware level, working in a completely virtualized system yields a very low performance penalty but has all properties needed for fast reproduction and migration of environments. [Vagrant](http://www.vagrantup.com) makes it easy to manage multiple virtual machines based on Oracle VirtualBox for development environments focused on web-based applications. But using only Oracle VirtualBox or another virtualization software without any automatic management might be easier depending on the project. A big advantage of Vagrant is that it uses Chef or Puppet for provisioning needed libraries or software which can be reused to set up the staging and production system, too.

#### Production

Agile methodologies and web-based applications created the trend towards short release cycles. Releasing a software can be a complex process which grows along with the software. At the start of a development project, the release is often seen as a point far in the future where the software is complete, without bugs and beautifully designed. Truth is that the release date comes faster than expected and nobody has time because everyone is still busy fixing bugs or implementing features. The release is just done somehow to let everyone get back to the important work. This leads to no defined process for release management. Releases will get harder and problems will arise from unclear defined version numbers and bugs slipping into production versions.

The system to release the software needs to be set up together with the development environment and further developed as part of the software. Releasing the software should be possible at any time by any developer with one simple command. This is also the only way continous integration will work. How the release management is automated depends on the software developed. Server-based software has to be pushed to the production server, desktop software needs to be build and packaged for download. The continous integration server Hudson may be a good start for release management, but a much simpler system like a Capistrano-empowered script for production deploy might also work.

### Everything else

Now we have GitHub for the code, a wiki for the domain knowledge and automated environment creation and deploy to capture the processes needed to get started and get into production. This covers everything an average well organized software development team captures while creating software, but it lacks the ability to capture an informal, yet very important part of knowledge distribution. Not everything is documented somewhere. This may be because the developer didn't realize it needs to be documented or he just forgot to document it. It might also be something that is not “official” enough to be documented, such as a hack or something the developer considers bad design and want to fix later before it gets documented. The developer might document it, but does it in an unclear or hard to understand fashion. Then there are discussions about how to implement a feature or a help request. These little bits of information typically are passed around by little chats in the hallway or emails. They need to be delivered fast and can be of very varying levels of relevance. They need to be captured without slowing down the delivery and they need to be filtered to find relevant information easier later.

[Flowdock](http://www.flowdock.com) is a web-based chat application which also works as a news-aggregator. The interface is split vertically: On the left side relevant events are shown, on the right side, developers can chat and share files. Flowdock can hook into GitHub and Quassum and has also an API to inject events on deploy via Hudson or Capistrano. This enables developers to have a constantly updating overview of all relevant project information and communicate with other developers fast and easily. The chat-history is stored for the whole account lifetime and is fully searchable. Additionally, tags may be assigned to messages to categorize information and indicate importance. With Flowdock, communication may happen asynchronocally and location-independent, but it stays fast and easy.

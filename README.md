# iHope Hackathon 2017

### Purpose:
>This is [our](https://ericd34n.github.io/) entry to the 2017 iHope Hackathon. We developed a 
platform from which those in need can interface with a link in the community. This link 
is to be their _link_ back to the world, specifically the digital world. When one 
experiences homelessness one often _loses_ their voice. Often times it can feel like 
no one is listening; often times people aren't listening. One young woman explained 
that when no one is listening, or when it seems like no one cares, turning to drugs 
seemed like the only answer. 

### Empowering
___

We developed Bindler as a way for those in need to regain their voice. Our service 
sought to be agnostic to any need-gradient. The only concrete requirements were that 
a particular content creator interface with their respective foundation(s). 

The service could be used anonymously or not. It’s up to you. Only you and your link know the difference. We took some cues from artists such as [Martin Schoeller](https://www.instagram.com/martinschoeller/) and the [GWHFC](https://secure.qgiv.com/event/sycamoreandromainefundraiser/).

### Content Creation
___

However, we sought to leverage the public's appetite for content. I have heard many stories that left me wanting to hear more. We also saw that many people living on the streets had art to share. Whether it was drawings, paintings, songs, poetry, or story telling, we were deeply moved and wanted to serve their non-physical needs as well as their physical needs.

We wanted to give these individuals the same opportunities others are afforded by their robust data plans and high-speed internet connections. 

Bindler empowers it’s users. **Content Creator** is likely a job title many people on the streets have never heard of. Moreover, their contributions become gifts that continue to give. If donations are shared in some sort of split, say 60/40 or 70/30, between the linking organization and the creator, then these creators can leave a legacy that helps others who fall into similar straits. 

### How Our Model Differs

___

Our model differs, in part, from other charitable endeavors for a key reason: power. It isn’t a purely top-down approach. We seek to empower our users. This is why we allow direct, peer to peer, donations. 

By slightly retreating from the shotgun donation approach, we bring individuals back to society—not numbers.

___


Presentation Links:

<iframe width="560" height="315" src="https://www.youtube.com/embed/rhV7K6EAy-0?ecver=1" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

<iframe src='//gifs.com/embed/bindler1-Xo5O8V' frameborder='0' scrolling='no' width='250px' height='360px' style='-webkit-backface-visibility: hidden;-webkit-transform: scale(1);' ></iframe>

[Stakeholder Map](https://kumu.io/ericd34n/bindler#bindler-stakeholder-map)

### What Now? 

Well, we are hoping to garner some interest from our peers. We plan on introducing this app to other students so they can hack
on the project too. A more ambitious hope is that we can sustain skilled students at the campus that can maintain projects 
such as this for non-profits. 

Here is a very short list of the technology and versions we will be using:

```
Ruby 2.4.0
Rails 5.1.4
Homebrew 1.3.4
```

Get started: 

```text
$ rails new bindler --database=postgresql
$ cd bindler
$ psql postgres
$ CREATE DATABASE bindlerapp;
$ \q

```

Now you can navigate to your ```config/database.yml``` file. You 
will want to change the name of the database. In this case we 
are using ```bindlerapp```.

Note: We began using the same database for development, production,
and test. However, this is *not* the best practice. Ideally, you 
should have three separate stores. 

Now is good time to get your project under source control. While in your project
root: 

```
/[your_app_name]
```
In this case we will be in: 

```text
/bindlerapp
```

Feel free to google about the following commands. 
The following steps are not a part of the 'only way' 
or even 'the best way' of going about using git; they are
merely here for your convenience.  

```text
$ git init
```

Create a new repository in GitHub, but do not ```initialize with README.md```. 
You will be redirected to a page with some helpful commands. Namely, 

```text
$ git remote add origin https://github.com/user/repo.git
```
Once ran, the above command sets a new remote for your project. 

You can display which name is associate with which URL. 

```text

$ git remote -v

```

Use ```git fetch``` to retrieve new work done by other people. 
Fetching from a repository grabs all the new remote-tracking 
branches and tags without merging those changes into your own branches.


Merging combines your local changes with changes made by others.

Typically, you'd merge a remote-tracking branch 
(i.e., a branch fetched from a remote repository) 
with your local branch

```git pull``` is a convenient shortcut for completing both git fetch 
and git mergein the same command:

[Read More On GitHub](https://help.github.com/articles/fetching-a-remote/)


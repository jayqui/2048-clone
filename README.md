# 2048

### A version of the classic game

This is an experimental attempt to write a version of [2048](https://en.wikipedia.org/wiki/2048_(video_game)).

A work in progress.

#### Technologies

In this attempt, I'm using Ruby and the Sinatra framework for the logic of the game's movements. These communicate with the front-end using AJAX (via jQuery) to render the front end. (Mostly I chose this because testing my code with Ruby and testing it with Rspec was second nature.)

#### Plans

I plan to write a successor version in JavaScript which will put all logic on the client-side. I may handle some front-end aspects with React.

While my TODO list for this endeavor remains private at this time, major points include

- perfect/finish the CSS transitions to make sliding squares
- seriously refactor my sloppy SCSS
- deploy to Heroku

### To run it locally
You can use what Ruby server you like, but for viewing I like [Thin](http://code.macournoyer.com/thin/), and for development purposes I like the auto-reloading [Shotgun](https://github.com/rtomayko/shotgun).

Here's how to get the servers started---assuming you've cloned this repo, navigated to its root folder, and have bundler installed (`gem install bundler`).

To use Thin, issue the command

```
bundle exec thin start
```

and navigate in your browser to the port indicated (probably `localhost:3000`).

To use Shotgun, issue the command

```
bundle exec shotgun config.ru
```

and navigate in your browser to the port indicated (probably `localhost:9393`).

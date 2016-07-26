PersonalHub
=====================

Docker image a web app that I made(https://gitlab.com/tomhoogeveen/personalHub). It only has one purpose, displaying relevant data for me.
It's meant to show this on a personalHub(a old laptop monitor with a raspberry py hooked up to it) or you can just access it from the browser.


What does it display?
------------------
 - The next 10 Google calendar events
 - The weather for the next 4 days
 - Last messages of a pushbullet channel
 - Recently added (from plexpy)

Do i need to have all of this?
-------------------
No, if you leave the variable empty it won't use it.

What do you need?
------------------
 - An API key for https://www.wunderground.com/
 - the lat and long of the location you want to display
 - Pushbullet channel name
 - Plexpy APIkey
 - Plexpy location(url)
 - create a client_secret.json following step 1 from this link https://developers.google.com/google-apps/calendar/quickstart/php
     And mount it ()


How do I run this container?
------------------
docker run -it --name=personalhub -p 8085:80 -v <dir with client_secret.json>:/app/personalHub/web/credentials/secret homeserverdev/docker-personalhub

This image is based on https://github.com/fazy/docker-apache-symfony.

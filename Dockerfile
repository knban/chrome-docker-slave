FROM knban/strider-docker-slave
MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>
USER root
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update
RUN apt-get install -y xvfb google-chrome-stable
RUN npm install -g chromedriver
ADD xvfbctl /bin/xvfbctl
RUN chmod a+x /bin/xvfbctl
ADD chromedriverctl /bin/chromedriverctl
RUN chmod a+x /bin/chromedriverctl
ADD chromewrapper /usr/bin/google-chrome-stable
RUN chmod a+x /usr/bin/google-chrome-stable
RUN npm install -g selenium-standalone
ADD seleniumctl /bin/seleniumctl
RUN chmod a+x /bin/seleniumctl
USER strider
ENV DISPLAY :99

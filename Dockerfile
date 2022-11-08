FROM python:3.9-alpine

# create the app user
RUN addgroup -S app && adduser -S app -G app

# ENV PYTHONUNBUFFERED=1
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=1

RUN mkdir -p /home/app

# create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# copy project
COPY . $APP_HOME




RUN apk update --no-cache \
	&& apk add tzdata 

RUN chown -R app:app $APP_HOME

RUN pip install --no-cache --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

ENV TZ=Asia/Bangkok

USER app
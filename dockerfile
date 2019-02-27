FROM golang

# if left blank app will run with dev settings
# to build production image run:
# $ docker build ./api --build-args app_env=production
ARG app_env
ENV APP_ENV $app_env

# it is okay to leave user/GoDoRP as long as you do not want to share code with other libraries


RUN go get github.com/fish2016/go-gin-dev
RUN go install github.com/fish2016/go-gin-dev

#RUN go get github.com/pilu/fresh


RUN cp -rf /go/src/github.com/fish2016/go-gin-dev/conf /go/bin/
WORKDIR /go/bin
# if dev setting will use pilu/fresh for code reloading via docker-compose volume sharing with local machine
# if production setting will build binary
# CMD if [ ${APP_ENV} = production ]; \
# 	then \
# 	cp /go/src/github.com/fish2016/go-gin-dev/conf /go/bin/ \
# 	#cp /go/src/github.com/fish2016/go-gin-dev/runtime /go/bin/ \
# 	go-gin-example; \
# 	else \
# 	#go get github.com/pilu/fresh && \
# 	#fresh; \
# 	go-gin-example \
# 	fi
# 	
CMD go-gin-example;

EXPOSE 8000

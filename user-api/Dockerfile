FROM clojure
MAINTAINER Joao Vazao Vasques joao.l.v.vasques@gmail.com

#ADD target/uberjar/user-api.jar /user-api/app.jar
ADD . /users-api/
WORKDIR /users-api/
EXPOSE 3000 7000

#CMD ["java", "-jar", "/user-api/app.jar"]

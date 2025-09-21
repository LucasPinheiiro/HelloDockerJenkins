FROM eclipse-temurin:11-jdk
WORKDIR /app
COPY OlaUnicamp.java .
RUN javac OlaUnicamp.java
CMD ["java", "OlaUnicamp"]

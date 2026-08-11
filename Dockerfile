FROM gradle:7.6-jdk17 AS build
COPY . /app
WORKDIR /app
RUN gradle shadowJar

FROM eclipse-temurin:17-jre
COPY --from=build /app/build/libs/*-all.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

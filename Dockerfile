FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY . .

RUN chmod +x gradlew

# Build the app using shadowJar task
RUN ./gradlew shadowJar --no-daemon -x test -x check

# Copy the generated shadow jar directly by name or pattern
RUN cp build/libs/*-all.jar app.jar || cp build/libs/*shadow*.jar app.jar

CMD ["java", "-jar", "app.jar"]

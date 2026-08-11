FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repo files
COPY . .

# Grant execution rights
RUN chmod +x gradlew

# Build the fat shadow JAR
RUN ./gradlew generateApolloSources --no-daemon || true
RUN ./gradlew shadowJar --no-daemon -x test -x check -Pproduction

# Copy ONLY the shadow/fat JAR (ignoring the plain thin JAR)
RUN cp $(find build/libs -name "*-all.jar" -o -name "*shadow*.jar" | head -n 1) app.jar

# Run using the exec form
CMD ["java", "-jar", "app.jar"]

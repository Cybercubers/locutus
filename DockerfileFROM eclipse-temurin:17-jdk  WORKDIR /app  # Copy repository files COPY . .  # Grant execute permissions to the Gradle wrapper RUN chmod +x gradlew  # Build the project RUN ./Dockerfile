FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repo files
COPY . .

# Grant execution rights
RUN chmod +x gradlew

# Generate GraphQL schemas and build the fat shadow JAR
RUN ./gradlew generateApolloSources --no-daemon || true
RUN ./gradlew shadowJar --no-daemon -x test -x check -Pproduction

# Copy the generated jar to a fixed, clean name
RUN cp build/libs/*.jar app.jar

# Run using the exec form (array syntax)
CMD ["java", "-jar", "app.jar"]

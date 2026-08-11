FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repository files
COPY . .

# Grant execute permissions to the Gradle wrapper
RUN chmod +x gradlew

# Build the project ignoring lint/check steps
RUN ./gradlew shadowJar --no-daemon -x test -x check

# Find the built jar and execute it
CMD ["sh", "-c", "java -jar build/libs/*.jar"]

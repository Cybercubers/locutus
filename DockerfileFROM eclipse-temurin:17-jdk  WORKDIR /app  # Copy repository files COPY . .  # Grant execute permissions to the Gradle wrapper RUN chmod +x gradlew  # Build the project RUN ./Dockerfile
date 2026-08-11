FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy repository files
COPY . .

# Grant execute permissions to the Gradle wrapper
RUN chmod +x gradlew

# Build the project
RUN ./gradlew build --no-daemon -x test

# Start the bot
CMD ["./gradlew", "run"]

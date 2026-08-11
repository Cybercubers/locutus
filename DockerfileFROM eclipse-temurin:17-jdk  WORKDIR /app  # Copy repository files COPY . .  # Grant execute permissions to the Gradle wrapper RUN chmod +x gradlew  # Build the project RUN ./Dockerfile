FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repository files
COPY . .

# Grant execute permissions to the Gradle wrapper
RUN chmod +x gradlew

# 1. Download dependencies and run the GraphQL code generator
RUN ./gradlew generateJava --no-daemon || ./gradlew generateApolloSources --no-daemon || true

# 2. Build the project executable
RUN ./gradlew shadowJar --no-daemon -x test -x check

# Start the bot
CMD ["sh", "-c", "java -jar build/libs/*.jar"]

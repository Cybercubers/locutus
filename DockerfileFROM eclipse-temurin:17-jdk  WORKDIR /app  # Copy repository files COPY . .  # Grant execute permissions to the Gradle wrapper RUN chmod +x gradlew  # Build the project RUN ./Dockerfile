FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repo files
COPY . .

# Grant execution rights
RUN chmod +x gradlew

# Generate Apollo/GraphQL sources first, then package the bot
RUN ./gradlew generateApolloSources --no-daemon || true
RUN ./gradlew shadowJar --no-daemon -x test -x check -Pproduction

# Run the compiled jar file
CMD ["sh", "-c", "java -jar build/libs/*.jar"]

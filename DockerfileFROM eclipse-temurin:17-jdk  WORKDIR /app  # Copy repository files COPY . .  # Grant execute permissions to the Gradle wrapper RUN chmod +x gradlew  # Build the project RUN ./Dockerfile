FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repo files
COPY . .

# Grant execution rights
RUN chmod +x gradlew

# Generate GraphQL schemas and build the fat shadow JAR
RUN ./gradlew generateApolloSources --no-daemon || true
RUN ./gradlew shadowJar --no-daemon -x test -x check -Pproduction

# Run the primary compiled application JAR (skipping test classes)
CMD ["sh", "-c", "java -cp build/libs/* link.locutus.discord.Locutus"]

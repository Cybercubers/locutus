FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy repo files
COPY . .

# Grant execution rights
RUN chmod +x gradlew

# Generate Apollo/GraphQL sources first, then build the executable shadow JAR
RUN ./gradlew generateApolloSources --no-daemon || true
RUN ./gradlew shadowJar --no-daemon -x test -x check -Pproduction

# Run the compiled shadow JAR explicitly
CMD ["sh", "-c", "java -jar build/libs/*-all.jar || java -jar build/libs/*.jar"]

# FROM eclipse-temurin:21-jdk AS builder

# WORKDIR /app

# COPY . .

# RUN ./gradlew clean build

# FROM eclipse-temurin:21-jre

# WORKDIR /app

# COPY --from=builder /app/build/libs/devops-app-0.0.1-SNAPSHOT.jar app.jar

# EXPOSE 8080

# ENTRYPOINT ["java", "-jar", "app.jar"]

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY build/libs/devops-app-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
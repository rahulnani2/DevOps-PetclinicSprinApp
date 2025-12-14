# Step 1: Use an official OPenJDK runtime as a parent image
FROM openjdk:26-ea-trixie

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the application JAR file into the container
COPY /target/spring-petclinic-*.jar /app/app.jar

# Step 4: Expose the application port
EXPOSE 8080
 
# Step 6: Run the application
ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=mysql", "app.jar"]

# Step 1: Use an official OPenJDK runtime as a parent image
FROM openjdk:26-ea-trixie

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the application JAR file into the container
COPY /target/spring-petclinic-*.jar /app/app.jar

# Step 4: Expose the application port
EXPOSE 8080

# # Step 5: Define environment variables for database connection
# ENV SPRING_DATASOURCE_URL=jdbc:mysql://spring-petclinic-mysql-1:3306/petclinic?useSSL=false&allowPublicKeyRetrieval=true
# ENV SPRING_DATASOURCE_USERNAME=petclinic
# ENV SPRING_DATASOURCE_PASSWORD=petclinic
# ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update
# ENV SPRING_JPA_SHOW_SQL=true    

# Step 6: Run the application
ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=mysql", "app.jar"]

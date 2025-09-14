#############Comment this block due to bigger image size 358MB####### Start 
# # Use the official .NET SDK image (build stage)
# FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# # Set working directory inside the container
# WORKDIR /src

# # Copy csproj and restore dependencies
# COPY *.csproj ./
# RUN dotnet restore

# # Copy the entire source code
# COPY . ./

# # Build and publish the application
# RUN dotnet publish -c Release -o /app/publish

# #######################################################
# # Runtime stage (smaller image)
# FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

# # Set working directory
# WORKDIR /app

# # Copy published files from the build stage
# COPY --from=build /app/publish .

# # Expose the application port
# EXPOSE 8080

# # Run the application
# ENTRYPOINT ["dotnet", "ResumeWebApp.dll"]
#############Comment this block due to bigger image size 358MB####### END


#################### Using Alpine Image for smaller size 173MB############### Start
# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080
ENTRYPOINT ["dotnet", "ResumeWebApp.dll"]
#################### Using Alpine Image for smaller size 173MB############### End

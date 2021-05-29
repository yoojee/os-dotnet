# build stage
#FROM mcr.microsoft.com/dotnet/sdk:5.0.203-alpine3.13 AS build-env
FROM mcr.microsoft.com/dotnet/sdk:latest AS build-env
COPY . /app
WORKDIR /app
RUN dotnet restore
RUN dotnet publish  -c Release

# final stage
#FROM mcr.microsoft.com/dotnet/aspnet:5.0.6-alpine3.13
FROM mcr.microsoft.com/dotnet/aspnet:latest
WORKDIR /app
COPY --from=build-env /app /app/
ENTRYPOINT ["dotnet", "bin/Release/net5.0/os-dotnet.dll"]
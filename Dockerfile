FROM mcr.microsoft.com/dotnet/runtime:6.0

RUN apt update
RUN apt install nuget -y

ENTRYPOINT [ "nuget" ]
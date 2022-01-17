FROM ubuntu as base

RUN apt update
RUN apt install wget -y

RUN wget https://dist.nuget.org/win-x86-commandline/v5.11.0/nuget.exe

FROM mono:6.12 as final
RUN mkdir -p /usr/nuget/bin
RUN cd /usr/nuget/bin
COPY --from=base nuget.exe /usr/nuget/bin

ENTRYPOINT [ "mono", "/usr/nuget/bin/nuget.exe" ]

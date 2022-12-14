FROM alpine

EXPOSE 8080

RUN mkdir -p /etc/uhppoted
RUN mkdir -p /var/uhppoted

COPY uhppoted.conf /etc/uhppoted/

WORKDIR /opt/uhppoted 

COPY uhppoted-rest     .
COPY uhppote-simulator .

ENTRYPOINT /opt/uhppoted/uhppoted-rest

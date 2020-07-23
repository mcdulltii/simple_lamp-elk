FROM mariadb:10.1.20

WORKDIR /
COPY ./filebeat.deb /usr/share/filebeat.deb
COPY ./metricbeat.deb /usr/share/metricbeat.deb
COPY ./heartbeat.deb /usr/share/heartbeat.deb

RUN dpkg -i /usr/share/metricbeat.deb && \
    rm /usr/share/metricbeat.deb

RUN dpkg -i /usr/share/heartbeat.deb && \
    rm /usr/share/heartbeat.deb

RUN dpkg -i /usr/share/filebeat.deb && \
    rm /usr/share/filebeat.deb

RUN echo "./start_service.sh" >> ~/.bashrc

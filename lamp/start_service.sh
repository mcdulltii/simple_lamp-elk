chown root /etc/packetbeat/packetbeat.yml && \
chown root /etc/filebeat/filebeat.yml && \
chown root /etc/metricbeat/metricbeat.yml && \
chown root /etc/heartbeat/heartbeat.yml

service packetbeat start && \
service filebeat start && \
service metricbeat start && \
service heartbeat-elastic start && \
#service auditbeat start && \
packetbeat setup --dashboards -E output.elasticsearch.hosts=['elasticsearch:9200'] \
-E output.elasticsearch.username="elastic" \
-E output.elasticsearch.password="TTF8notmD726DgbAS3an" \
-E setup.kibana.host=kibana:5601

metricbeat setup --dashboards -E output.elasticsearch.hosts=['elasticsearch:9200'] \
-E output.elasticsearch.username="elastic" \
-E output.elasticsearch.password="TTF8notmD726DgbAS3an" \
-E setup.kibana.host=kibana:5601

heartbeat setup -E output.elasticsearch.hosts=['elasticsearch:9200'] \
-E output.elasticsearch.username="elastic" \
-E output.elasticsearch.password="TTF8notmD726DgbAS3an" \
-E setup.kibana.host=kibana:5601

filebeat modules enable suricata && \
filebeat setup --dashboards -E output.elasticsearch.hosts=['elasticsearch:9200'] \
-E output.elasticsearch.username="elastic" \
-E output.elasticsearch.password="TTF8notmD726DgbAS3an" \
-E setup.kibana.host=kibana:5601

# auditbeat setup --dashboards -E output.elasticsearch.hosts=['elasticsearch:9200'] \
# -E output.elasticsearch.username="elastic" \
# -E output.elasticsearch.password="TTF8notmD726DgbAS3an" \
# -E setup.kibana.host=kibana:5601

suricata -c /etc/suricata/suricata.yaml -i eth0

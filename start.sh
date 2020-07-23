docker-compose build && \
docker-compose up -d && \
sleep 1m
docker exec -t simple_lamp-elk_mysql_1 chmod +x ./start_service.sh && \
docker exec -t simple_lamp-elk_mysql_1 bash &
sleep 2m
disown
docker exec -t simple_lamp-elk_lamp_1 chmod +x ./start_service.sh && \
docker exec -t simple_lamp-elk_lamp_1 bash &

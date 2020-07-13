## prometheus grafana

```bash
mkdir -p ./var/prometheus
mkdir -p ./var/grafana

sudo groupadd -g 65534 nogroup
sudo useradd -r -u 65534 -g 65534 nobody
sudo chown -R 65534:65534 ./var/prometheus

sudo groupadd -g 472 grafana
sudo useradd -r -u 472 -g 472 grafana
sudo chown -R grafana:grafana ./var/grafana
```

```
make up
make down
```

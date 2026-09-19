# 06 — Linux Service Monitoring

## Scenario

A web or application service must be monitored beyond basic host availability.

## Local service validation

Example with Nginx:

```bash
systemctl status nginx
curl -I http://127.0.0.1/
```

Example with an application service:

```bash
systemctl status myapp.service
journalctl -u myapp.service --since "30 minutes ago"
```

## Monitoring approaches

Depending on the service and Zabbix version/template, monitoring can include:

- systemd service state;
- TCP port availability;
- HTTP response checks;
- web scenarios;
- process count;
- custom application metrics;
- log monitoring.

Example generic TCP item:

```text
net.tcp.service[http,,80]
```

## Web scenario example

A web scenario can validate:

1. DNS/connection success;
2. expected HTTP status;
3. response time;
4. required text in the response;
5. multi-step authentication or navigation where appropriate.

## Troubleshooting flow

1. Validate the service locally.
2. Check the listening port.
3. Test the endpoint from the monitoring path.
4. Review service logs.
5. Check reverse proxy or upstream dependencies.
6. Distinguish application failure from network failure.
7. Confirm recovery in Zabbix.

## Design principle

Monitoring should represent the user-facing service as closely as practical. A running process does not always mean the application is healthy.

## Security

Do not publish private URLs, authentication flows, cookies or production endpoint names.

# 08 — Zabbix HTTP Poller Processes Busy

## Scenario

Zabbix reports that HTTP poller processes are highly utilized for a sustained period.

## Example Alert

```text
Zabbix server: HTTP poller processes more than 75% busy
```

## What it means

HTTP pollers execute web-monitoring checks. Sustained high utilization may indicate that configured capacity is insufficient, checks are slow, or external endpoints are delaying responses.

## Initial investigation

Review Zabbix server process utilization and correlate with:

- number of web scenarios;
- check intervals;
- endpoint response times;
- timeouts;
- recent monitoring changes;
- Zabbix server resource usage.

An internal Zabbix process metric may use a key in the `zabbix[process,...]` family, depending on version/template.

## Server configuration

The number of HTTP poller processes is controlled by the Zabbix server configuration parameter:

```text
StartHTTPPollers
```

Do not increase it blindly. First determine whether slow or excessive checks are the actual cause.

## Investigation flow

1. Confirm the alert is sustained.
2. Identify recent web-monitoring additions or changes.
3. Look for slow or timing-out targets.
4. Review server CPU, memory and general process pressure.
5. Check configured HTTP poller capacity.
6. Optimize check design and intervals where possible.
7. Increase poller capacity only after validating server resources and monitoring demand.
8. Observe the busy percentage after changes.

## Operational note

A higher process count consumes additional resources and does not fix slow dependencies by itself.

## Security

Do not publish production URLs or authentication details from web scenarios.

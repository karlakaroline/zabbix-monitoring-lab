# 09 — Zabbix and Grafana Integration

## Objective

Use Grafana to present Zabbix monitoring data in an operational dashboard.

## Architecture

```text
Monitored Hosts
      |
      v
 Zabbix Server / Proxy
      |
      v
 Zabbix Datasource
      |
      v
    Grafana
```

## Good dashboard candidates

- host availability;
- CPU utilization;
- memory utilization;
- filesystem capacity;
- network traffic;
- active problems;
- service health;
- backup or infrastructure KPIs.

## Design principles

### Operational hierarchy

Put the most important information first:

1. overall health;
2. active failures;
3. resource pressure;
4. trends and detailed diagnostics.

### Use state colors carefully

Colors should communicate meaning consistently. Avoid using critical colors for decorative purposes.

### Avoid hiding no-data states

A missing metric is different from a healthy value of zero.

### Reduce visual noise

Not every metric needs its own panel. Group related indicators and prioritize actionable information.

## Troubleshooting integration

If a panel shows no data:

1. validate the Zabbix item in **Latest data**;
2. confirm the Grafana datasource;
3. inspect variables and filters;
4. use Grafana Query Inspector;
5. confirm the selected time range;
6. check item history/trends availability.

## Portfolio note

Public screenshots should use fictional hostnames, identifiers and values when the original dashboard was created for a private environment.

# Zabbix Monitoring Lab

Hands-on Zabbix monitoring and troubleshooting lab focused on Linux infrastructure and NOC operations.

> **Public demo repository:** all hostnames, IP addresses, thresholds and environment details in this repository are fictional or generic examples.

## What this lab demonstrates

- Zabbix host onboarding and agent validation
- ICMP availability troubleshooting
- Filesystem capacity monitoring
- Memory and swap analysis
- Zabbix Agent / Agent 2 troubleshooting
- Linux service monitoring
- Trigger and threshold design
- Zabbix HTTP poller troubleshooting
- Grafana integration concepts
- NOC incident triage and escalation workflow

## Lab Scenarios

| Lab | Scenario | Main skills |
|---|---|---|
| [01](docs/01-host-onboarding.md) | Host onboarding | Agent setup, connectivity, host configuration |
| [02](docs/02-icmp-unavailable.md) | ICMP unavailable | Network triage, reachability, escalation |
| [03](docs/03-filesystem-high-usage.md) | Filesystem high usage | Linux storage analysis, Zabbix trigger validation |
| [04](docs/04-memory-and-swap.md) | Memory and swap pressure | Linux performance triage |
| [05](docs/05-zabbix-agent-troubleshooting.md) | Agent communication failure | Port 10050, service and log checks |
| [06](docs/06-service-monitoring.md) | Service monitoring | systemd, HTTP/TCP checks, web scenarios |
| [07](docs/07-triggers-and-thresholds.md) | Trigger design | Thresholds, persistence windows, noise reduction |
| [08](docs/08-http-poller-busy.md) | HTTP poller busy | Zabbix server capacity troubleshooting |
| [09](docs/09-grafana-integration.md) | Grafana integration | Visualization and dashboard design |
| [10](docs/10-noc-incident-workflow.md) | NOC workflow | Triage, remediation, escalation and documentation |

## Example Lab Environment

```text
Zabbix Server: zbx-lab-01
Linux Host:    linux-lab-01
Linux Host:    linux-lab-02
Network:       192.0.2.0/24 (documentation-only example range)
Grafana:       grafana-lab-01
```

## Useful Commands

```bash
systemctl status zabbix-agent
systemctl status zabbix-agent2
ss -lntp | grep 10050
journalctl -u zabbix-agent --since "30 minutes ago"
journalctl -u zabbix-agent2 --since "30 minutes ago"
df -h
df -i
free -h
vmstat 1 5
top
```

## Repository Structure

```text
zabbix-monitoring-lab/
├── README.md
├── SECURITY.md
├── docs/
│   ├── 01-host-onboarding.md
│   ├── 02-icmp-unavailable.md
│   ├── 03-filesystem-high-usage.md
│   ├── 04-memory-and-swap.md
│   ├── 05-zabbix-agent-troubleshooting.md
│   ├── 06-service-monitoring.md
│   ├── 07-triggers-and-thresholds.md
│   ├── 08-http-poller-busy.md
│   ├── 09-grafana-integration.md
│   └── 10-noc-incident-workflow.md
├── scripts/
│   └── linux/
│       ├── filesystem-triage.sh
│       └── zabbix-agent-check.sh
└── templates/
    └── README.md
```

## Security

This repository is designed for public portfolio use. Do not add production hostnames, private IP addresses, customer names, credentials, internal URLs, tokens or screenshots containing sensitive information.

See [SECURITY.md](SECURITY.md).

## Author

**Karla Karoline**

IT Support Analyst | NOC | Infrastructure | Monitoring & Observability

**Technologies:** Zabbix · Grafana · Linux · VMware · Veeam · AWS

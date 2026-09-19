# 02 — ICMP Ping Unavailable

## Scenario

Zabbix reports that a monitored host is unavailable through ICMP.

## Example Alert

```text
ICMP Ping: Unavailable
```

## First checks

From an authorized monitoring or troubleshooting node:

```bash
ping -c 4 192.0.2.21
```

If routing analysis is required:

```bash
traceroute 192.0.2.21
```

or:

```bash
tracepath 192.0.2.21
```

## Investigation flow

1. Confirm whether the host is actually reachable.
2. Check whether the issue affects only ICMP or all services.
3. Compare with Zabbix Agent availability.
4. Validate routing and firewall behavior.
5. Check whether ICMP is intentionally blocked.
6. Determine whether the host, network path or monitoring source is affected.
7. Escalate to the correct team when the fault is outside N1 scope.

## Zabbix context

A common ICMP item key is:

```text
icmpping
```

A production trigger should normally avoid alerting on one isolated packet loss event. Use a persistence rule appropriate to the environment.

Conceptual example:

```text
ICMP unavailable for multiple consecutive checks
```

## Useful correlation

If ICMP fails but Agent data continues to arrive, investigate ICMP filtering or a check-path difference before declaring the server down.

If both ICMP and Agent monitoring fail, validate the host and network path more broadly.

## Resolution record

Document:

- detection time;
- affected host;
- tests performed;
- whether other protocols were reachable;
- identified cause;
- remediation or escalation;
- recovery time.

## Security

Use fictional hosts and documentation-only IP addresses in public examples.

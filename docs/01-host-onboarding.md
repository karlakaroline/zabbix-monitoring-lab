# 01 — Zabbix Host Onboarding

## Scenario

A new Linux server must be added to Zabbix for availability and operating-system monitoring.

## Objective

Validate the agent, connectivity and host configuration before considering monitoring complete.

## Example Environment

```text
Host: linux-lab-01
Zabbix Server: zbx-lab-01
Agent port: 10050/TCP
```

## Host-side validation

Check whether Agent or Agent 2 is installed and running:

```bash
systemctl status zabbix-agent
systemctl status zabbix-agent2
```

Check the listening port:

```bash
ss -lntp | grep 10050
```

Review recent logs:

```bash
journalctl -u zabbix-agent --since "30 minutes ago"
journalctl -u zabbix-agent2 --since "30 minutes ago"
```

## Configuration checks

Validate the appropriate settings for the chosen agent mode:

- Zabbix server/proxy address
- Hostname consistency
- Active-server configuration when using active checks
- Local firewall access
- DNS resolution when names are used

Common configuration files:

```text
/etc/zabbix/zabbix_agentd.conf
/etc/zabbix/zabbix_agent2.conf
```

## Zabbix-side checklist

- Create or discover the host.
- Assign the correct host group.
- Configure the agent interface.
- Link the appropriate Linux template.
- Confirm that latest data is arriving.
- Validate that no unsupported items remain unexplained.

## Optional remote test

When `zabbix_get` is available on an authorized monitoring node:

```bash
zabbix_get -s 192.0.2.21 -p 10050 -k agent.ping
```

Expected result:

```text
1
```

## Completion criteria

The host is considered onboarded when availability is healthy and expected metrics are updating consistently.

## Security

All names and addresses shown here are fictional lab examples.

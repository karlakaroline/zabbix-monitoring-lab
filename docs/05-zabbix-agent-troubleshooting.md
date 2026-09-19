# 05 — Zabbix Agent Troubleshooting

## Scenario

A host is reachable, but Zabbix reports that the agent is unavailable or metrics stop updating.

## Host-side checks

### Service status

```bash
systemctl status zabbix-agent
systemctl status zabbix-agent2
```

### Listening port

```bash
ss -lntp | grep 10050
```

### Logs

```bash
journalctl -u zabbix-agent --since "30 minutes ago"
journalctl -u zabbix-agent2 --since "30 minutes ago"
```

### Configuration

Review the relevant configuration:

```text
/etc/zabbix/zabbix_agentd.conf
/etc/zabbix/zabbix_agent2.conf
```

Important areas include:

- server/proxy address;
- active server;
- hostname;
- include files;
- TLS settings when enabled.

## Connectivity test

From an authorized Zabbix server or proxy:

```bash
nc -vz 192.0.2.21 10050
```

When `zabbix_get` is available:

```bash
zabbix_get -s 192.0.2.21 -k agent.ping
```

## Investigation flow

1. Confirm the host is online.
2. Confirm the agent service is running.
3. Confirm TCP/10050 is listening.
4. Check firewall rules.
5. Verify hostname and server/proxy configuration.
6. Review logs for denied connections or configuration errors.
7. Compare passive and active checks if both are used.
8. Restart the agent only when authorized and appropriate.

Example:

```bash
sudo systemctl restart zabbix-agent2
```

## Validation

Confirm new values appear in **Latest data** and that the availability icon returns to normal.

## Security

Never publish TLS PSKs, certificates, keys or real server addresses.

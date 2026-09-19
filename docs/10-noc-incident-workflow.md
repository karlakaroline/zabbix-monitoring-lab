# 10 — NOC Incident Workflow

## Objective

Provide a repeatable first-response flow for infrastructure monitoring alerts.

## Workflow

```text
Alert detected
      |
      v
Validate the event
      |
      v
Check host/service availability
      |
      v
Review metric and recent behavior
      |
      v
Perform authorized N1 troubleshooting
      |
      +--> Resolved -> Validate recovery -> Document
      |
      +--> Not resolved / outside scope
                     |
                     v
                 Escalate
                     |
                     v
              Track until recovery
```

## 1. Validate

Confirm:

- alert timestamp;
- affected host/service;
- severity;
- current value;
- whether the alert is still active;
- related alerts.

## 2. Correlate

Check:

- ICMP availability;
- Zabbix Agent availability;
- CPU, memory, disk and network;
- service status;
- recent changes if known.

## 3. Troubleshoot within scope

Examples:

```bash
df -h
free -h
vmstat 1 5
systemctl status <service>
journalctl -u <service> --since "30 minutes ago"
```

## 4. Escalate when needed

Provide the next team with:

- clear symptom;
- affected component;
- timestamps;
- tests already performed;
- relevant outputs;
- current impact;
- actions already taken.

## 5. Validate recovery

Do not close only because an action was performed. Confirm:

- service response;
- metric normalization;
- Zabbix event recovery;
- user/business validation when required.

## 6. Document

A concise incident record should include:

```text
Alert:
Impact:
Validation:
Actions:
Root cause / suspected cause:
Escalation:
Recovery:
Evidence:
```

## Security

Sanitize all incident examples before public use.

# 04 — Memory and Swap Pressure

## Scenario

Zabbix reports sustained memory pressure or high swap utilization on a Linux host.

## Initial validation

```bash
free -h
vmstat 1 5
top
```

Useful process view:

```bash
ps -eo pid,ppid,comm,%mem,%cpu --sort=-%mem | head -20
```

Check swap configuration:

```bash
swapon --show
```

## Zabbix context

Common memory-related item keys include:

```text
vm.memory.size[pavailable]
```

Common swap metrics may be provided by the Linux template using `system.swap.size[...]` keys.

Exact items vary by Zabbix template and version.

## Investigation flow

1. Confirm that memory pressure is sustained, not a short spike.
2. Review available memory and cache behavior.
3. Identify the largest consumers.
4. Review swap activity with `vmstat`.
5. Correlate with application load or recent deployments.
6. Check for OOM events:

```bash
journalctl -k | grep -i -E 'oom|out of memory'
```

7. Escalate application-specific tuning when appropriate.

## Important interpretation

High RAM utilization alone does not always indicate a fault on Linux. Evaluate available memory, swap activity, paging behavior and application symptoms together.

## Resolution validation

After remediation, verify:

```bash
free -h
vmstat 1 5
```

Then confirm that Zabbix metrics and alerts return to normal.

## Security

Use generic process names when publishing screenshots or incident examples.

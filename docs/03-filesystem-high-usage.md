# 03 — Filesystem High Usage

## Scenario

Zabbix detects a Linux filesystem above the configured utilization threshold.

## Example Alert

```text
Filesystem [/var]: Space utilization > 90%
```

## Initial validation

```bash
df -h
df -i
```

Check the largest directories on the affected filesystem:

```bash
du -xhd1 /var 2>/dev/null | sort -h
```

For a more focused directory:

```bash
du -xhd1 /var/log 2>/dev/null | sort -h
```

Check for deleted files still held open:

```bash
lsof +L1
```

## Zabbix metric

A commonly used filesystem percentage item key is:

```text
vfs.fs.size[/var,pused]
```

The exact item key may be discovered dynamically by a template.

## Investigation flow

1. Confirm filesystem and inode utilization.
2. Identify the directories responsible for growth.
3. Check for abnormal log, cache or temporary-file growth.
4. Check deleted-but-open files.
5. Determine whether cleanup is safe and authorized.
6. If growth is legitimate, evaluate filesystem or volume expansion.
7. Confirm monitoring recovery after remediation.

## Threshold design

Example policy:

```text
Warning:  > 85%
High:     > 90%
Critical: > 95%
```

The correct thresholds depend on filesystem purpose, growth rate and operational requirements.

## Resolution examples

Possible actions include:

- rotate or clean approved logs;
- remove obsolete files according to procedure;
- restart a process holding deleted files when authorized;
- expand the underlying volume/filesystem;
- escalate to the application owner if application data is growing unexpectedly.

## Validation after action

```bash
df -h
df -i
```

Then confirm the Zabbix item has updated and the problem has recovered.

## Security

Do not publish real mount paths when they reveal proprietary application names.

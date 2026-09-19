# 07 — Trigger and Threshold Design

## Objective

Create alerts that are actionable and reduce unnecessary noise.

## Principles

### 1. Avoid alerting on isolated spikes

Prefer persistence windows when the condition is only important if sustained.

Conceptual example:

```text
Filesystem usage > 90% for 15 minutes
```

### 2. Use severity consistently

Example model:

```text
Information — awareness only
Warning     — degradation or early capacity concern
High        — service risk requiring prompt action
Disaster    — major outage or severe impact
```

### 3. Add context to the event

A useful event name should help the analyst understand:

- what failed;
- which resource is affected;
- current value;
- threshold or condition;
- operational impact when known.

### 4. Use recovery logic where needed

For noisy metrics, recovery thresholds can reduce alert flapping.

Example concept:

```text
Problem:  usage > 90%
Recovery: usage < 85%
```

### 5. Correlate dependencies

Avoid duplicate symptoms where a parent failure already explains downstream alerts.

## Example monitored items

```text
icmpping
agent.ping
vfs.fs.size[/var,pused]
vm.memory.size[pavailable]
```

Actual keys depend on template and environment.

## Review checklist

Before enabling a new trigger:

- Is the metric reliable?
- Is the threshold meaningful?
- Is the evaluation window appropriate?
- Is the severity correct?
- Does the event name explain the issue?
- Could the trigger create duplicates?
- Is the recovery behavior acceptable?

## Security

Use generic event examples in public documentation.

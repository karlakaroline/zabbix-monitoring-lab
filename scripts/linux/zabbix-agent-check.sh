#!/usr/bin/env bash
set -u

echo "=== Zabbix Agent Diagnostic Check ==="
echo

echo "[1] Hostname"
hostnamectl --static 2>/dev/null || hostname
echo

echo "[2] Zabbix services"
systemctl --no-pager --full status zabbix-agent 2>/dev/null | sed -n '1,12p' || true
systemctl --no-pager --full status zabbix-agent2 2>/dev/null | sed -n '1,12p' || true
echo

echo "[3] Listening port 10050"
ss -lntp 2>/dev/null | grep ':10050' || echo "No listener detected on TCP/10050"
echo

echo "[4] Recent service logs"
journalctl -u zabbix-agent -u zabbix-agent2 --since "20 minutes ago" --no-pager 2>/dev/null | tail -40 || true
echo

echo "[5] Configuration files present"
for f in /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agent2.conf; do
  if [[ -f "$f" ]]; then
    echo "FOUND: $f"
  fi
done

echo
echo "Review Server/ServerActive/Hostname/TLS settings manually before sharing output."

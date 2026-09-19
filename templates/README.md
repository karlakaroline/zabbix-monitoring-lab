# Templates

This directory is reserved for public-safe Zabbix template examples.

Before adding an exported template:

- remove production hostnames and URLs;
- remove credentials, PSKs and secrets;
- replace organization-specific macros;
- review item names, tags and trigger descriptions;
- validate that no internal identifiers remain.

A template should only be committed after a separate sanitization review.

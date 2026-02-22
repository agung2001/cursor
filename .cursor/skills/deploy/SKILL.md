---
name: deploy
description: Deploy the static site to a remote server via SFTP. Use when the user asks to deploy, publish, upload, or push the site live. Uploads index.html, style.css, and script.js to the configured remote host.
---

# Deploy via SFTP

Uploads the site's static files (`index.html`, `style.css`, `script.js`) to a remote server over SFTP.

## First-time setup

1. Copy the example config and fill in your server details:

```bash
cp .cursor/skills/deploy/deploy.config.example .cursor/skills/deploy/deploy.config
```

2. Edit `.cursor/skills/deploy/deploy.config`:

```
SFTP_HOST=your-server.com
SFTP_USER=your-username
REMOTE_PATH=/var/www/html
```

The config file is gitignored — credentials stay local.

## Deploy

Run the deploy script from the project root:

```bash
bash .cursor/skills/deploy/scripts/deploy.sh
```

The script will:
1. Validate that `deploy.config` exists
2. Connect to the SFTP host
3. Upload `index.html`, `style.css`, and `script.js` to `REMOTE_PATH`
4. Report success or error

## SSH key authentication

SFTP will use your system's default SSH key (`~/.ssh/id_rsa` or `~/.ssh/id_ed25519`). If your server uses a non-default key, add it to `deploy.config`:

```
SSH_KEY=~/.ssh/my_key
```

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `deploy.config not found` | Run the first-time setup above |
| `Permission denied` | Check SSH key is authorized on the server |
| `No such file or directory` | Verify `REMOTE_PATH` exists on the server |
| `Connection refused` | Check `SFTP_HOST` and that SSH/SFTP is enabled on port 22 |

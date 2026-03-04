# Local CLI Toolkit

Location: `~/.local/bin`

This directory contains **small, deterministic CLI utilities** available on `PATH`.
They are designed to work reliably for both **humans and automation (including AI CLI agents)**.

The scripts act as a **stable command interface to the system and repositories**.

---

# Principles

Scripts in this directory follow these rules:

* **Non-interactive**
* **Deterministic output**
* **Safe defaults**
* **Composable in shell pipelines**
* **Minimal dependencies**
* **Fail fast with clear errors**

Prefer these commands instead of inventing complex shell pipelines.

---

# Environment

Ensure this directory is on `PATH`.

Configured in:

```
~/.env.sh
```

Example:

```
export PATH="$HOME/.local/bin:$PATH"
```

---

# Notes

These scripts are part of the system's **dotfiles-managed environment**.

Configuration is managed through a shared repository and may evolve over time.

# Openclaw_skills

A public collection of reusable [OpenClaw](https://docs.openclaw.ai) skills. Feel free to browse, use, and contribute!

## 📦 What's Inside

All skills are organized under the `skills/` directory. Each skill is a self-contained folder containing at minimum a `SKILL.md` file (manifest + instructions) and any supporting files.

```
skills/
└── <skill-name>/
    ├── SKILL.md        # Skill manifest (YAML frontmatter) and usage instructions
    └── ...             # Optional: config files, scripts, samples
```

## 🚀 How to Use These Skills

### Option 1 — Copy a skill directly

Clone this repository and copy the skill folder you need into your project's `skills/` directory or the shared skills directory (`~/.openclaw/skills/`):

```bash
# Clone this repo
git clone https://github.com/shuaishuaiZhu-ai/Openclaw_skills.git

# Copy the skill you need into your project
cp -r Openclaw_skills/skills/<skill-name> <your-project>/skills/

# Or install it to the shared skills directory
cp -r Openclaw_skills/skills/<skill-name> ~/.openclaw/skills/
```

### Option 2 — Pull a specific skill using sparse checkout

```bash
git clone --filter=blob:none --sparse https://github.com/shuaishuaiZhu-ai/Openclaw_skills.git
cd Openclaw_skills
git sparse-checkout set skills/<skill-name>
cp -r skills/<skill-name> ~/.openclaw/skills/
```

## 📚 Skill Precedence

OpenClaw loads skills from these locations (highest to lowest precedence):

1. **Workspace** — `<your-project>/skills/`
2. **Managed/local** — `~/.openclaw/skills/`
3. **Bundled** — Shipped with OpenClaw installation

## 🛠 Skill Structure

Each skill folder must contain a `SKILL.md` file with YAML frontmatter:

```markdown
---
name: skill-name
description: "What this skill does and when to invoke it."
metadata:
  openclaw:
    emoji: "🔧"
    requires:
      env: []      # Required environment variables
      bins: []     # Required CLI tools/binaries
homepage: https://github.com/shuaishuaiZhu-ai/Openclaw_skills
user-invocable: true
---
# Skill Name

Instructions and documentation for the skill go here.
```

## 🤝 Contributing

Contributions are welcome! To add a new skill:

1. Fork this repository
2. Create a new folder under `skills/<your-skill-name>/`
3. Add a `SKILL.md` file following the structure above
4. Submit a Pull Request

## 📄 License

This repository is open source and publicly available. Skills may have their own license terms noted in their respective `SKILL.md` files.

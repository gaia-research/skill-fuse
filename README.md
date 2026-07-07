# skill-fuse

Combine two AI agent skills into one.

## What it does

- **Detects** installed skills in your project
- **Composes** a new fused skill that integrates both workflows  
- **Registers** the result in your skills directory, ready to use

Works with any AI coding agent that reads SKILL.md files: Claude Code, Codex, Cursor, Windsurf, Gemini CLI.

## Install

One-liner:

```bash
bash <(curl -sL https://raw.githubusercontent.com/mbtiongson1/skill-fuse/main/install.sh)
```

Or clone manually:

```bash
git clone --depth 1 https://github.com/gaia-research/skill-fuse.git .agents/skills/fuse
rm -rf .agents/skills/fuse/.git
```

## Usage

Tell your agent:

```
/fuse
```

Or be specific:

```
/fuse shape + audit
```

### What happens

1. **Detect** -- scans your skills directory, or uses the two you named
2. **Compose** -- reads both skills and generates a fused SKILL.md
3. **Name** -- suggests names, you pick
4. **Register** -- writes the fused skill to your skills directory

The fused skill is immediately available as a new `/command`.

## Example

You have `shape` (plans UX before code) and `audit` (reviews UI against standards). You run:

```
/fuse shape + audit
```

Result: a new skill `shape-and-audit` that plans the UX, builds it, and audits the result in one flow.

## How it works

`SKILL.md` is a router. Each step delegates to a file in `reference/`:

```
SKILL.md          -- trigger detection + routing
reference/
  detect.md       -- find skills to fuse
  compose.md      -- LLM prompt template for composition
  name.md         -- naming ceremony
  register.md     -- write output + optional .gaia logging
scripts/
  candidates.sh   -- list installed skills (bash, no deps)
  validate.sh     -- check a SKILL.md is well-formed
```

No dependencies. No build step. No config files.

## Gaia integration (optional)

If you use [gaia-cli](https://github.com/mbtiongson1/gaia-skill-tree), fusions are automatically logged to `.gaia/fuse-log.json`. Run `gaia push` to propose your fused skill to the public registry.

Not using Gaia? No problem. skill-fuse works standalone.

---

<p align="center">
  <a href="https://gaiaskilltree.com">
    <img src="powered-by-gaia.svg" alt="Powered by Gaia" />
  </a>
</p>

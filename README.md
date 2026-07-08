# skill-fuse

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Part of Gaia](https://img.shields.io/badge/part%20of-Gaia%20skill--tree-6b46c1)](https://gaiaskilltree.com)
[![Zero deps](https://img.shields.io/badge/deps-bash%20%2B%20markdown-success)](#how-it-works)
[![Agents: Claude · Codex · Cursor · Windsurf · Gemini](https://img.shields.io/badge/agents-Claude%20%C2%B7%20Codex%20%C2%B7%20Cursor%20%C2%B7%20Windsurf%20%C2%B7%20Gemini-8a2be2)](#compatibility)

**Merge overlapping commands into one.** Combine Claude Code slash commands, Cursor rules, or Windsurf cascades into a single unified `/command` — less context overhead, fewer wrong-skill misfires. Works with Claude Code, Codex, Cursor, Windsurf, and Gemini CLI.

> Golly, boss — your agent hoards skills like a dragon hoards socks. `skill-fuse` melts the pile into one clean `SKILL.md`.

**New to skills?** A skill is a custom `/command` in Claude Code, Cursor, or Windsurf — like a Slack slash command, but for your AI coding agent. If you've installed `shape`, `audit`, or `refactor` as three separate commands, skill-fuse merges them so you run one command that does all three.

## Why it exists

**Agent skill merge is a real problem.** You install `shape` for UX planning, `audit` for UI review, and `refactor` for cleanup — now every task juggles three `/commands`, three prompt budgets, three chances for the agent to pick the wrong one. `skill-fuse` composes overlapping `SKILL.md` files into a single fused skill: one trigger, one flow, one prompt. Whether you're reducing slash command clutter in Claude Code, combining Cursor rules across projects, or merging Windsurf cascades, skill-fuse consolidates and organizes them into one command.

Zero-dependency by design. Bash + Markdown. The routing logic is human-readable in `SKILL.md`, the composition prompt is a plain Markdown file in `reference/compose.md`. Fork it if you want a different fusion policy.

## What it does

- **Detects** installed skills in your project (`.agents/skills/`, `.claude/skills/`, `.cursor/rules/`)
- **Composes** a new fused skill that integrates both workflows
- **Registers** the result in your skills directory, ready to use

Works with any AI coding agent that reads `SKILL.md` files: Claude Code, Codex, Cursor, Windsurf, Gemini CLI.

## Use cases

- **AI skill fusion** — merge `shape + audit` into one `shape-and-audit` skill that plans, builds, and reviews in one flow.
- **Agent skill merge** — reduce three overlapping skills to one to shrink the prompt budget and cut wrong-skill misfires.
- **SKILL.md compose** — generate a canonical fused `SKILL.md` you can commit and share across a team.
- **Token-efficient agent skills** — dedupe overlapping instructions so the agent loads one skill, not three.
- **Skill graph authoring** — bootstrap new registry entries for the Gaia skill-tree from two existing skills.
- **Cursor rules merge** — combine multiple `.cursor/rules/` files into a single composable Cursor workflow without rewriting from scratch.
- **Claude Code slash command composition** — merge overlapping Claude Code `/commands` into one unified trigger so you stop picking the wrong one mid-task.
- **Prompt template deduplication** — eliminate redundant system prompts across tools so your agent loads one organized instruction set, not three overlapping ones.

## Install

One-liner:

```bash
bash <(curl -sL https://raw.githubusercontent.com/gaia-research/skill-fuse/main/install.sh)
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

## Compatibility

Any agent that reads `SKILL.md`:

| Agent | Install path | Invoke |
|---|---|---|
| Claude Code | `.claude/skills/fuse/` | `/fuse` |
| Codex CLI | `.agents/skills/fuse/` | `/fuse` |
| Cursor | `.cursor/rules/fuse/` | `/fuse` |
| Windsurf | `.agents/skills/fuse/` | `/fuse` |
| Gemini CLI | `.agents/skills/fuse/` | `/fuse` |

## How it compares

| Tool | What it composes | Where it lives | Deps |
|---|---|---|---|
| **`skill-fuse`** | Two `SKILL.md` files → one fused skill | Your repo's skills dir | Bash + Markdown |
| Manual copy-paste | Whatever you remember to include | Your head | You |
| Custom Python composer | Whatever you script | A separate service | Python + your LLM SDK |
| Framework-specific plugin | Framework-native format only | One framework | Framework runtime |
| Cursor rules compositor | `.cursor/rules/` files → single rule set | One Cursor project | Cursor runtime |
| MCP tool merger | Multiple MCP tools → composed protocol tool | Separate service | MCP SDK + runtime |

Different jobs. `skill-fuse` optimizes for "I want two skills to become one skill in my current project, right now, and I want the output to be readable Markdown I can commit."

## FAQ

**What does skill-fuse produce?**
A single `.md` file — a unified command definition with YAML frontmatter (name, description, trigger phrases) plus a Markdown body containing the merged skill logic. It's ready to commit and invoke immediately as a new `/command` in Claude Code, Cursor, Windsurf, or Gemini CLI.

**How do I install skill-fuse?**
Run `bash <(curl -sL https://raw.githubusercontent.com/gaia-research/skill-fuse/main/install.sh)` — it auto-detects your skills directory. Works with Claude Code (`.claude/skills/`), Cursor (`.cursor/rules/`), Windsurf and Codex (`.agents/skills/`), and Gemini CLI. Or clone manually into any of those paths.

**Which AI editors and agents does skill-fuse work with?**
Claude Code, Cursor, Windsurf, Codex CLI, and Gemini CLI. Install in your agent's skills directory and invoke `/fuse` from any conversation. See the [compatibility table](#compatibility) for exact install paths per agent.

**Does `skill-fuse` need an API key?**
No — the fusion itself happens inside your existing agent's session. `skill-fuse` provides the routing logic and the composition prompt; your agent's LLM does the writing.

**Can I fuse more than two skills?**
Not in one call. Chain: fuse A + B → `AB`, then fuse `AB` + C → `ABC`. Keeps each merge reviewable.

**How is this different from writing a custom skill by hand?**
You still can. `skill-fuse` is for when you already have two skills that work and you want a merged one without re-writing from scratch. The output is a plain `SKILL.md` you can hand-edit after.

## Gaia integration (optional)

If you use [gaia-cli](https://github.com/gaia-research/gaia-skill-tree), fusions are automatically logged to `.gaia/fuse-log.json`. Run `gaia push` to propose your fused skill to the public registry.

Not using Gaia? No problem. `skill-fuse` works standalone.

## See also

- [measure CI wasted time per PR](https://github.com/gaia-research/skill-ci-churn) — companion skill `skill-ci-churn` for GitHub Actions time-waste analysis.
- [`gaia-research/marketing-tasks`](https://github.com/gaia-research/marketing-tasks) — campaigns and deliverables using this skill.
- [Gaia Skill Registry](https://gaiaskilltree.com) — the open catalog this skill belongs to.

## License

MIT — see [LICENSE](./LICENSE).

---

<p align="center">
  <a href="https://gaiaskilltree.com">
    <img src="powered-by-gaia.svg" alt="Powered by Gaia" />
  </a>
</p>

# Claude Agency

> 160+ specialist AI agents for Claude Code. Assemble expert teams for any task.

Turn Claude Code into a full agency — backend architects, security engineers, UX researchers, growth hackers, and 150+ more specialists ready to work on your projects.

Built on [The Agency](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski).

## Why?

Instead of writing "help me design an API", you get a **backend architect** who knows to include:
- Rate limiting and authentication
- Database indexing strategies  
- Error handling patterns
- Security best practices

Each agent has domain expertise, specific deliverables, and consistent quality built into their prompts.

## Install

```
/plugin marketplace add anjolok1997/claude-agency
/plugin install agency
```

That's it. The plugin installs 160+ agents and 3 skills.

## Usage

### `/team` — Assemble specialists for any task

```
/team Design a REST API for a task management app
```

Claude will:
1. Assess complexity and pick the right specialists
2. Run them in parallel (backend-architect + code-reviewer)
3. Synthesize results into a cohesive deliverable

### `/agents` — Browse the roster

```
/agents              # Show all 160+ agents by category
/agents engineering  # List engineering specialists
/agents security     # Search for security-related agents
```

### `/solo` — Run a single specialist

```
/solo code-reviewer Review this PR for security issues
/solo seo-specialist Audit this page for SEO
```

## Agent Categories

| Category | Count | Specialists |
|----------|-------|-------------|
| **Engineering** | 25+ | backend-architect, frontend-developer, code-reviewer, security-engineer, devops-automator, data-engineer, ai-engineer, database-optimizer |
| **Design** | 8 | ui-designer, ux-researcher, ux-architect, brand-guardian, whimsy-injector |
| **Marketing** | 20+ | growth-hacker, seo-specialist, content-creator, linkedin-content-creator, tiktok-strategist |
| **Product** | 5 | product-manager, sprint-prioritizer, trend-researcher, feedback-synthesizer |
| **Testing** | 8 | reality-checker, api-tester, accessibility-auditor, performance-benchmarker |
| **Sales** | 8 | deal-strategist, sales-engineer, outbound-strategist, discovery-coach |
| **Game Dev** | 15+ | unity-architect, unreal-systems-engineer, godot-gameplay-scripter, narrative-designer |
| **Specialized** | 20+ | mcp-builder, salesforce-architect, compliance-auditor, workflow-architect |

## Examples

**Code Review**
```
/team Review this codebase for security vulnerabilities and code quality
```
→ Spawns: code-reviewer, security-engineer

**Build a Feature**  
```
/team Build user authentication with OAuth and JWT
```
→ Spawns: backend-architect, security-engineer, code-reviewer

**Research**
```
/team Research React performance optimization best practices
```
→ Spawns: frontend-developer, trend-researcher

**Marketing**
```
/team Create a launch strategy for our developer tool
```
→ Spawns: growth-hacker, content-creator, twitter-engager

## How It Works

1. **Agents** install to `~/.claude/agents/` — Claude Code loads them automatically
2. **Skills** provide `/team`, `/agents`, `/solo` commands
3. **Claude's Agent tool** runs specialists in parallel

No external dependencies. No API keys. Just your Claude Code subscription.

## Credits

- Agent library: [The Agency](https://github.com/msitarzewski/agency-agents) by [@msitarzewski](https://github.com/msitarzewski) (MIT)
- Plugin wrapper: [@anjolok1997](https://github.com/anjolok1997)

## License

MIT

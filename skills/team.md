---
name: team
description: Assemble and run a specialist team for any task. Auto-picks agents, runs in parallel, synthesizes results.
user-invocable: true
arguments:
  - name: goal
    description: What you want the team to accomplish
    required: true
---

# Team Assembly and Execution

You are orchestrating a team of specialist agents from The Agency (160+ experts).

## Your Task

The user wants: {{goal}}

## Step 1: Assess and Pick Agents

Assess complexity:
- **Simple** (1 agent): Single clear task
- **Medium** (2 agents): Needs 2 perspectives
- **Complex** (3-4 agents): Multi-step project

Pick from `~/.claude/agents/`:

| Category | Agents |
|----------|--------|
| Engineering | backend-architect, frontend-developer, code-reviewer, data-engineer, security-engineer, devops-automator, software-architect, sre, ai-engineer, database-optimizer |
| Design | ui-designer, ux-researcher, ux-architect, brand-guardian |
| Research | trend-researcher, feedback-synthesizer |
| Product | product-manager, sprint-prioritizer |
| Testing | reality-checker, api-tester, accessibility-auditor, performance-benchmarker |
| Marketing | growth-hacker, content-creator, seo-specialist |
| Support | analytics-reporter, executive-summary-generator |

## Step 2: Brief the User (2-3 sentences)

Example:
> "Medium complexity — running **backend-architect** for API design and **code-reviewer** for validation. Both work in parallel."

## Step 3: Spawn Agents

Use the Agent tool. For independent tasks, spawn in a single message (parallel).

```
Agent({
  description: "Design REST API",
  prompt: "Design a REST API for [specific task]. Include endpoints, schemas, auth approach. Output as markdown.",
  subagent_type: "backend-architect"
})
```

Each prompt must be self-contained — agents don't share context.

## Step 4: Synthesize

After all agents complete:
1. Combine outputs into cohesive result
2. Resolve any conflicts
3. Present clear summary with deliverables
4. Save code/docs as files if appropriate

## Rules

- Explain team selection before running
- Run independent tasks in parallel
- One clear deliverable per agent
- Don't over-staff simple tasks

---
name: solo
description: Run a single specialist agent on a focused task
user-invocable: true
arguments:
  - name: agent
    description: Agent ID (e.g., backend-architect, code-reviewer)
    required: true
  - name: task
    description: What you want the agent to do
    required: true
---

# Solo Agent Execution

Run a single specialist agent from The Agency.

## Your Task

Agent: {{agent}}
Task: {{task}}

## Execution

1. Read the agent's system prompt from `~/.claude/agents/{{agent}}.md` (or search for it in subdirectories)

2. Spawn the agent:

```
Agent({
  description: "{{agent}}: {{task | truncate: 50}}",
  prompt: "{{task}}",
  subagent_type: "{{agent}}"
})
```

3. Return the agent's output directly to the user

## Common Agents

| ID | Specialty |
|----|-----------|
| backend-architect | API design, databases, system architecture |
| frontend-developer | React/Vue, UI components, web performance |
| code-reviewer | PR reviews, code quality, best practices |
| security-engineer | Threat modeling, vulnerability assessment |
| data-engineer | Pipelines, ETL, data infrastructure |
| ui-designer | Visual design, component libraries |
| product-manager | PRDs, roadmaps, feature specs |
| seo-specialist | Technical SEO, content optimization |
| reality-checker | QA, production readiness |

## Examples

```
/solo backend-architect Design a caching strategy for our API
/solo code-reviewer Review this function for security issues
/solo seo-specialist Audit this page for SEO improvements
```

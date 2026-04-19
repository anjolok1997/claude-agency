---
name: agents
description: Browse and search 160+ specialist agents from The Agency
user-invocable: true
arguments:
  - name: query
    description: Category to browse or keyword to search
    required: false
---

# Agent Browser

Show available agents from `~/.claude/agents/`.

## No Query — Show Categories

```
The Agency — 160+ Specialist Agents

ENGINEERING (25+)
  backend-architect    API design, databases, scalability
  frontend-developer   React/Vue/Angular, UI implementation
  code-reviewer        PR reviews, code quality, security
  data-engineer        Pipelines, ETL, data infrastructure
  security-engineer    Threat modeling, secure code
  devops-automator     CI/CD, infrastructure automation
  software-architect   System design, DDD, patterns
  sre                  SLOs, observability, reliability
  ai-engineer          ML models, AI integration
  database-optimizer   Schema design, query optimization

DESIGN (8)
  ui-designer          Visual design, component libraries
  ux-researcher        User testing, behavior analysis
  ux-architect         Technical UX, CSS systems
  brand-guardian       Brand identity, consistency

MARKETING (20+)
  growth-hacker        User acquisition, viral loops
  content-creator      Multi-platform content
  seo-specialist       Technical SEO, link building
  linkedin-content-creator  B2B content, thought leadership

PRODUCT (5)
  product-manager      Full lifecycle ownership
  trend-researcher     Market intelligence
  sprint-prioritizer   Agile planning, backlog

TESTING (8)
  reality-checker      Production readiness
  api-tester           API validation, integration
  accessibility-auditor  WCAG, assistive tech
  performance-benchmarker  Load testing, optimization

GAME DEV (15+)
  game-designer        Systems, GDD, economy
  unity-architect      Unity, ScriptableObjects, ECS
  unreal-systems-engineer  UE5, C++, Blueprints

SPECIALIZED (20+)
  mcp-builder          MCP server development
  workflow-architect   Process mapping
  salesforce-architect Enterprise Salesforce

Use: /agents <category> for details
     /agents <keyword> to search
```

## With Query

If category name: List all agents in that category with descriptions.
If keyword: Search agent files and show matches.

Read from `~/.claude/agents/` to get actual agent details.

---
state: new
created: 2026-01-30T08:29:00+00:00
priority: high
tags: [redrawn, rebuild, v2, gpt-image-1, ghilbi]
---

# Redrawn v2: Complete Rebuild Using Autobok Patterns

Rebuild the redrawn application (Google Photos → Ghibli-style image generation using GPT-Image-1) from scratch using the proven architectural patterns from autobok. Create a new v2 branch for this effort.

## Current State Analysis

**redrawn** (swebuild/redrawn):
- Google Photos-like interface
- All images generated into Ghibli style using GPT-Image-1
- Needs complete rethink and rebuild

**autobok patterns to adopt** (theolundqvist/autobok):
- Go backend with Fuego framework
- Next.js frontend
- PostgreSQL database
- Docker Compose orchestration
- Clean architecture and project structure

## Goals

- [ ] Analyze current redrawn codebase to understand features/requirements
- [ ] Study autobok architecture patterns in detail
- [ ] Design v2 architecture using autobok patterns
- [ ] Create new `v2` branch for rebuild
- [ ] Implement backend (Go + Fuego) with API endpoints
- [ ] Implement frontend (Next.js) with modern UI
- [ ] Set up database schema (PostgreSQL)
- [ ] Integrate GPT-Image-1 for Ghibli-style generation
- [ ] Add Google Photos-like album/organization features
- [ ] Implement user authentication
- [ ] Docker Compose setup for easy deployment
- [ ] Deploy and test end-to-end

## Subtasks

### Phase 1: Research & Planning

- [ ] Read current redrawn codebase (main branch)
  - Document current features
  - Identify pain points
  - Note UI/UX patterns worth keeping
- [ ] Deep dive into autobok patterns
  - Backend structure (Fuego handlers, middleware, models)
  - Frontend structure (Next.js app router, components)
  - Database design (migrations, schema patterns)
  - Docker setup (multi-service compose)
- [ ] Create v2 architecture document
  - Define API contracts
  - Design database schema
  - Plan frontend component structure
  - Map GPT-Image-1 integration points

### Phase 2: Bootstrap v2 Branch

- [ ] Create `v2` branch from main (or empty if complete restart)
- [ ] Set up project structure mirroring autobok
  - `/backend` - Go with Fuego
  - `/frontend` - Next.js with TypeScript
  - `/infra` - Docker Compose, migrations
- [ ] Initialize Go module and dependencies
- [ ] Initialize Next.js project with shadcn/ui
- [ ] Set up PostgreSQL with migrations system
- [ ] Create initial Docker Compose for dev

### Phase 3: Core Implementation

- [ ] Backend: User auth system (JWT or session-based)
- [ ] Backend: Image upload and storage (S3/local)
- [ ] Backend: GPT-Image-1 integration service
- [ ] Backend: Album/collection management APIs
- [ ] Frontend: Auth pages (login/register)
- [ ] Frontend: Dashboard with album grid
- [ ] Frontend: Image upload with drag-drop
- [ ] Frontend: Image viewer with Ghibli generation trigger
- [ ] Frontend: Album management UI

### Phase 4: Polish & Deploy

- [ ] Error handling and loading states
- [ ] Responsive design for mobile
- [ ] Performance optimization
- [ ] Production Docker Compose setup
- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Documentation (README, API docs)

## Technical Decisions to Make

1. **Image Storage**: S3 vs local filesystem vs Cloudflare R2
2. **Image Processing**: Queue system (Redis?) for GPT-Image-1 generation
3. **Auth Strategy**: JWT vs sessions, social login?
4. **Real-time Updates**: WebSockets vs polling for generation status
5. **Deployment**: Same Dokploy + Sablier setup as autobok?

## Questions for Theodor

1. Should v2 be a complete rewrite or incremental migration?
2. Which autobok features are most critical to replicate? (auth patterns, API structure, etc.)
3. Any new features wanted in v2 that weren't in v1?
4. Timeline/deadline considerations?
5. Should it eventually replace v1 or run alongside?

## Notes

- Use autobok as a **template**, not a copy-paste
- Focus on **clean code** and **testability**
- Prioritize **developer experience** (good DX = good product)
- Consider **cost optimization** for GPT-Image-1 API calls (caching, batching?)

## Related

- [autobok repository](https://github.com/theolundqvist/autobok) - Pattern reference
- [redrawn repository](https://github.com/swebuild/redrawn) - Current codebase
- Task: [host-autobok-dokploy.md](tasks/host-autobok-dokploy.md) - Deployment patterns

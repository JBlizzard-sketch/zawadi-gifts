# Zawadi — Premium B2B Corporate Gifting Platform

> *Zawadi* (Swahili: "gift") — A curated marketplace connecting Kenyan corporates with premium, genuinely Kenyan-made gifts from vetted artisans and small producers.

---

## Overview

Zawadi solves a real procurement pain: every corporate in Nairobi — banks, telcos, multinationals, NGOs, law firms — spends money on end-of-year gifts, client appreciation hampers, staff onboarding kits, and event giveaways. Today they Google, call three suppliers in Industrial Area, and end up with the same cheap imported mugs and calendars that everyone else buys.

Zawadi is the platform that changes that. Curated Kenyan coffee from Kirinyaga, honey from Baringo, artisan chocolate from Nairobi, handmade ceramics, Maasai-inspired jewellery, natural skincare — sourced from vetted producers, packaged with your company logo, delivered as a single order.

---

## Product Vision

### For Corporates
- Browse curated gift collections by **occasion** (client gifts, staff appreciation, event giveaways, festive hampers), **budget**, and **recipient profile**
- Configure orders: quantity, branded packaging with company logo, personalised message cards
- Get instant quotes; orders above threshold go to a dedicated account manager
- NET30 invoicing, KRA PIN support, LPO compatibility
- Mixed hampers from multiple producers delivered as one order

### For Producers
- A reliable B2B sales channel they've never had
- Fair pricing, prompt payment, volume visibility
- "Producer Stories" feature — corporates share who made the gift (ESG/sustainability angle)

---

## Feature Roadmap (~20 Phases)

| Phase | Feature | Status |
|-------|---------|--------|
| 1 | Project scaffold, monorepo, CI/CD, GitHub integration | ✅ Active |
| 2 | Product catalogue — browse by occasion, budget, recipient | Planned |
| 3 | Supplier onboarding & vetting portal | Planned |
| 4 | Instant quote engine — quantity × product × packaging | Planned |
| 5 | "Build Your Own Hamper" configurator | Planned |
| 6 | Branded packaging workflow — artwork upload, specs, lead times | Planned |
| 7 | Gift personalisation engine — bulk recipient lists, auto message cards | Planned |
| 8 | Order management — multi-producer single order, tracking | Planned |
| 9 | Account manager portal — large order triage & CRM | Planned |
| 10 | Corporate invoicing — KRA PIN, LPO upload, NET30 | Planned |
| 11 | Producer Stories feature — ESG content per gift | Planned |
| 12 | Annual Gifting Calendar — reminders, occasion planning | Planned |
| 13 | White-label / Branded Staff Gift Shop | Planned |
| 14 | Retail-facing storefront (premium individual pricing) | Planned |
| 15 | Festive Season surge infrastructure — load testing, queue system | Planned |
| 16 | Analytics dashboard — spend tracking, popular products, delivery SLAs | Planned |
| 17 | Supplier quality control & rating system | Planned |
| 18 | Delivery & logistics integration (last-mile Nairobi) | Planned |
| 19 | Mobile-responsive PWA + buyer app | Planned |
| 20 | International expansion — diaspora gifting to Kenya | Planned |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Next.js (React), TypeScript, Tailwind CSS |
| Backend | Express 5, TypeScript, Node.js 24 |
| Database | PostgreSQL + Drizzle ORM |
| Validation | Zod (v4) |
| API Contract | OpenAPI 3 → Orval codegen (React Query hooks + Zod schemas) |
| Monorepo | pnpm workspaces |
| Image Assets | Cloudinary (planned) |
| Hosting (target) | Vercel (frontend) + Railway (backend) |
| Containerisation | Docker-ready |
| CI/CD | GitHub Actions (planned) |
| Auth | Clerk (planned) |
| Payments | Stripe / M-Pesa integration (planned) |

---

## Repository Structure

```
zawadi-gifts/
├── artifacts/
│   ├── api-server/          # Express 5 API server
│   │   └── src/
│   │       ├── app.ts
│   │       ├── index.ts
│   │       ├── routes/
│   │       └── middlewares/
│   └── mockup-sandbox/      # UI prototyping sandbox (Vite + shadcn/ui)
├── lib/
│   ├── api-client-react/    # Generated React Query hooks
│   ├── api-spec/            # OpenAPI 3 spec (source of truth)
│   │   └── openapi.yaml
│   ├── api-zod/             # Generated Zod schemas
│   └── db/                  # Drizzle ORM schema + migrations
│       └── src/schema/
├── scripts/                 # Utility scripts
├── pnpm-workspace.yaml
├── tsconfig.base.json
└── README.md
```

---

## Getting Started

### Prerequisites

- Node.js 24+
- pnpm 9+
- PostgreSQL (or use the Replit-managed DB)

### Installation

```bash
# Install all workspace dependencies
pnpm install

# Push DB schema (development)
pnpm --filter @workspace/db run push

# Regenerate API hooks from OpenAPI spec
pnpm --filter @workspace/api-spec run codegen

# Run API server locally
pnpm --filter @workspace/api-server run dev
```

### Full typecheck

```bash
pnpm run typecheck
```

### Build all packages

```bash
pnpm run build
```

---

## API

The API follows an **OpenAPI-first** contract. The spec lives in `lib/api-spec/openapi.yaml`. Any change to the spec requires running codegen before the frontend or backend can use the new types.

Base path: `/api`

| Endpoint | Description |
|----------|-------------|
| `GET /api/healthz` | Health check |

More endpoints will be added as phases progress.

---

## Key Design Principles

1. **Curation is the brand** — every product must be genuinely Kenyan-made and quality-verified. No exceptions.
2. **Contract-first API** — OpenAPI spec drives backend validation (Zod) and frontend hooks (React Query) — no drift.
3. **Single order, multiple producers** — mixed hampers aggregate cleanly into one checkout, one invoice, one delivery.
4. **Festive surge ready** — November–December is ~60% of annual volume. The architecture must handle that.
5. **Corporate procurement native** — KRA PINs, LPOs, NET30 invoicing are first-class features, not afterthoughts.

---

## Contributing

This is a private platform under active development. The repository is structured as a pnpm monorepo — all packages are under `artifacts/` (deployable apps) or `lib/` (shared libraries).

When adding a new API endpoint:
1. Update `lib/api-spec/openapi.yaml`
2. Run `pnpm --filter @workspace/api-spec run codegen`
3. Implement the route in `artifacts/api-server/src/routes/`
4. Use the generated Zod schemas for request/response validation

---

## Automatic GitHub Sync

This repository is kept in sync automatically via a push script (`scripts/github-push.sh`) that runs after significant changes. Every commit includes a structured message summarising what changed.

---

## License

Proprietary — All rights reserved. © 2026 Zawadi Gifts Ltd.

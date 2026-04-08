# Stack: Next.js App Router + Supabase

> Append this to AGENTS.md when using this stack.

## Stack-Specific Rules

### Next.js App Router
- Use `app/` directory routing (not `pages/`).
- Server Components by default. Add `'use client'` only when needed (state, effects, browser APIs).
- API routes go in `app/api/[name]/route.ts` — export named functions (GET, POST, etc.).
- Use `next/image` for images, `next/link` for navigation.
- **Gotcha:** Next.js evolves fast. Check `node_modules/next/` docs if an API behaves unexpectedly.

### Supabase
- Client-side: use `createBrowserClient()` from `@supabase/ssr`.
- Server-side: use `createServerClient()` with cookie handling.
- **Auth:** Always check `supabase.auth.getUser()` in API routes — don't trust `getSession()` alone (it reads from cookies, which can be tampered with).
- **RLS:** Assume Row Level Security is enabled. Write queries expecting RLS to filter rows.
- **Storage:** Use signed URLs for private files. Public buckets for assets that don't need auth.
- **Gotcha:** Supabase client is async — always `await` auth calls before querying.

### Deployment (Vercel)
- Environment variables: set in Vercel dashboard, not in `.env` files committed to git.
- Preview deployments: every branch push gets its own URL.
- Edge functions: API routes run on Vercel Edge by default with App Router.

### Common Patterns
```
src/
├── app/
│   ├── api/              # API routes (auth proxy, external API wrappers)
│   ├── (auth)/           # Route group for auth pages (login, signup)
│   └── [feature]/        # Feature pages
├── components/
│   ├── ui/               # Generic reusable components
│   └── [feature]/        # Feature-specific components
├── hooks/                # Custom React hooks
├── lib/
│   ├── supabase/         # Supabase client setup + helpers
│   └── api/              # External API client wrappers
├── types/                # TypeScript interfaces
└── styles/               # CSS Modules
```

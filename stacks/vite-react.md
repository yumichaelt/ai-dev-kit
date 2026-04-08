# Stack: Vite + React + TypeScript

> Append this to AGENTS.md when using this stack.

## Stack-Specific Rules

### Vite
- Config in `vite.config.ts`. Use `defineConfig` helper.
- Environment variables must be prefixed with `VITE_` to be exposed to client code.
- Use `import.meta.env.VITE_*` (not `process.env`).
- Path aliases: configure in both `vite.config.ts` and `tsconfig.json`.

### React
- Functional components only. No class components.
- Use TypeScript for all components (`.tsx`).
- Props interfaces defined above the component or in `types/`.
- Custom hooks for shared state/logic — prefix with `use`.
- Prefer controlled components for forms.

### State Management
- Local state: `useState` / `useReducer`.
- Shared state: React Context for simple cases, Zustand/Jotai for complex.
- Server state: TanStack Query (React Query) for API data.
- **Don't:** Use global state for things that could be props or URL params.

### Routing
- React Router v6+ with `createBrowserRouter`.
- Lazy-load route components with `React.lazy()` + `Suspense`.
- Error boundaries on route level.

### Common Patterns
```
src/
├── main.tsx              # Entry point + router setup
├── App.tsx               # Root layout
├── components/
│   ├── ui/               # Generic reusable components
│   └── [feature]/        # Feature-specific components
├── hooks/                # Custom React hooks
├── lib/                  # Utilities, API clients
├── types/                # TypeScript interfaces
├── stores/               # State management (if using Zustand/Jotai)
└── styles/               # CSS Modules or global styles
```

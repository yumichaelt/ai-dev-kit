# Stack: Python + FastAPI + SQLAlchemy

> Append this to AGENTS.md when using this stack.

## Stack-Specific Rules

### FastAPI
- Use type hints everywhere — FastAPI uses them for validation and docs.
- Pydantic models for request/response schemas (in `schemas/`).
- Dependency injection for shared logic (auth, db sessions).
- Use `HTTPException` with appropriate status codes, not bare `raise`.
- Background tasks: use `BackgroundTasks` parameter, not threading.

### SQLAlchemy
- Use SQLAlchemy 2.0 style (select(), async sessions).
- Models in `models/`. One file per table or related group.
- Always use migrations (Alembic). Never modify tables directly.
- Use `sessionmaker` with `expire_on_commit=False` for async.
- **Gotcha:** Always close/commit sessions. Use `async with` or dependency injection.

### Project Structure
```
app/
├── main.py               # FastAPI app creation + router includes
├── config.py             # Settings (from environment variables)
├── routers/              # API route handlers (one file per resource)
│   ├── users.py
│   └── items.py
├── schemas/              # Pydantic request/response models
├── models/               # SQLAlchemy ORM models
├── services/             # Business logic (not in routers)
├── dependencies/         # Shared dependencies (auth, db)
└── utils/                # Pure utility functions
```

### Conventions
- Routers handle HTTP concerns (parse request, return response).
- Services handle business logic (validation, orchestration).
- Models handle persistence. No business logic in models.
- Config from environment variables via Pydantic `BaseSettings`.
- Tests use `httpx.AsyncClient` with `TestClient` or async fixtures.

### Common Commands
- Dev: `uvicorn app.main:app --reload`
- Test: `pytest`
- Migrate: `alembic upgrade head`
- New migration: `alembic revision --autogenerate -m "description"`

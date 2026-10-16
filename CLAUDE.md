# dbc-lens

Browser-based CAN log viewer. Load a DBC file and a CAN log, decode signals, and show them as tables and charts.
All processing happens in the browser. Logs and DBC files are never uploaded to a server.

## Tech stack

- Next.js (App Router) + TypeScript (strict mode)
- Tailwind CSS
- Vitest for unit tests, Playwright for end-to-end tests
- uPlot for charts (fast with large logs)
- Web Worker for parsing large log files
- Deployed on Vercel, CI on GitHub Actions

## Commands

Node.js runs only inside Docker. Run every npm command through the `app` container:

- `docker compose up` : start dev server on http://localhost:3000
- `docker compose exec app npm test` : run unit tests (Vitest)
- `docker compose exec app npm run lint`
- `docker compose exec app npx tsc --noEmit` : type check
- `docker compose exec app npm install <package>` : add a package

Playwright end-to-end tests will use a separate Playwright container (added in Week 6).

## Project structure

- `src/lib/dbc/` : DBC parser (pure functions, no React)
- `src/lib/decode/` : signal decoding (Intel / Motorola, signed, factor, offset)
- `src/lib/log/` : log parsers (ASC first, CSV next)
- `src/workers/` : Web Worker that runs the parsers
- `src/app/` : pages and UI components
- `fixtures/` : sample DBC and log files used by tests

## Rules

- `strict: true`. Never use `any`. Prefer explicit types for public functions.
- Parsing and decoding code lives in `src/lib/` as pure functions with no browser or React dependency.
- Every change in `src/lib/` comes with Vitest tests. Use the files in `fixtures/` and the expected values in `docs/ROADMAP.md`.
- Never add code that sends DBC or log data to a server or third-party service.
- Small commits with clear messages. One feature per pull request.

## Learning mode (important)

I am an embedded C engineer learning TypeScript and React.
After each change, explain in Japanese:
1. What you changed and why
2. Any TypeScript or React concept I may not know, compared with C or C#
Keep the code simple enough that I can explain it in an interview.

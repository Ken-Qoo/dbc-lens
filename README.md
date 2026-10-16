# dbc-lens

A browser-based viewer for CAN DBC files and CAN logs.
Everything runs locally in your browser — **your files are never uploaded to a server.**

> 🚧 Work in progress. See the [Roadmap](docs/ROADMAP.md) for planned features.

<!-- Add a screenshot here once the UI is ready:
![dbc-lens screenshot](docs/screenshot.png)
-->

**Live demo:** coming soon

## Why

Engineers working with CAN often need to quickly check a DBC definition or glance at a log,
without launching heavyweight desktop tools. DBC files are also often confidential,
so dbc-lens processes everything client-side and never sends your data anywhere.

## Features

- [ ] Load a `.dbc` file and browse messages and signals
- [ ] Decode CAN frames from Vector `.asc` logs using the DBC
- [ ] Plot decoded signals over time
- [x] No server-side processing — files stay on your machine

## Tech stack

- [Next.js](https://nextjs.org/) + TypeScript
- Docker-based development environment

## Getting started

### With Docker (recommended)

```bash
git clone https://github.com/Ken-Qoo/dbc-lens.git
cd dbc-lens
docker compose up --build
```

Then open http://localhost:3000.

> **Windows users:** clone the repository inside the WSL2 filesystem (e.g. `~/workspace`),
> not under `C:\`, for correct file permissions and fast hot reload.

### Without Docker

Requires Node.js 24 or later.

```bash
npm install
npm run dev
```

## Sample data

The `fixtures/` directory contains small synthetic files for testing:

- `fixtures/sample.dbc` — sample DBC definition
- `fixtures/sample.asc` — sample CAN log in Vector ASC format

## About

Built by an embedded software engineer with ~20 years of experience in embedded Linux and BLE development.

## License

[MIT](LICENSE)
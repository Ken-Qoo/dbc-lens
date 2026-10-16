# dbc-lens Roadmap

## Goal

A browser tool for embedded engineers: load a DBC file and a CAN log, see decoded signals as a table and a chart.
Privacy first: everything runs in the browser, nothing is uploaded.

## Milestones (about 6 weeks)

| Week | Milestone | Done when |
|---|---|---|
| 1 | Setup and DBC parser | Repo, CI and README exist. `BO_`, `SG_` and `VAL_` lines parse into typed objects with tests |
| 2 | Signal decoding | Intel and Motorola byte order, signed values, factor and offset all pass the test cases below |
| 3 | First UI | Paste a DBC and one frame in hex, see decoded signals in a table |
| 4 | Log loading | ASC files load in a Web Worker, table with filter by message and signal |
| 5 | Charts and export | Plot selected signals over time with uPlot, export to CSV |
| 6 | Release | Playwright tests, deploy to Vercel, README with screenshots, Zenn article |

Later: CAN FD frames, multiplexed signals, CSV logs, saving DBC files (Supabase), dark mode.

## Test cases (from fixtures/)

### EngineData (ID 0x100), data `40 1F 5A 80 00 00 00 00`

| Signal | Raw | Physical |
|---|---|---|
| EngineSpeed (Intel, 16 bit, x0.25) | 0x1F40 = 8000 | 2000 rpm |
| CoolantTemp (Intel, 8 bit, offset -40) | 0x5A = 90 | 50 degC |
| ThrottlePos (Intel, 8 bit, x0.4) | 0x80 = 128 | 51.2 % |

### VehicleStatus (ID 0x200), data `17 70 03 00 FF 6A 00 00`

| Signal | Raw | Physical |
|---|---|---|
| VehicleSpeed (Motorola, 16 bit, x0.01) | 0x1770 = 6000 | 60.00 km/h |
| GearPosition (Intel, 4 bit, value table) | 3 | D |
| SteeringAngle (Motorola, signed 16 bit, x0.1) | 0xFF6A = -150 | -15.0 deg |

### Second frames in sample.asc (for charts)

- EngineData `80 3E 5B 90 ...` : EngineSpeed 4000 rpm, CoolantTemp 51 degC, ThrottlePos 57.6 %
- VehicleStatus `1B 58 03 00 00 64 ...` : VehicleSpeed 70.00 km/h, GearPosition D, SteeringAngle 10.0 deg

## Notes

- Use only the sample files in `fixtures/`. Never commit real DBC files or logs from clients or employers.

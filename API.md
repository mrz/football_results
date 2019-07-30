# API Reference

All endpoints support both JSON and protobuf formats.
To change the desired format, specify it in the request header:

```
curl -H "Content-Type: application/json" localhost:4000/api/matches/SP1/201516
```

or

```
curl -H "Content-Type: application/octet-stream" localhost:4000/api/matches/SP1/201516 --output /tmp/out.dat
```


## Seasons

A season is the tuple (division, season)

### Structure

| Field    | Type    | Description               |
|----------|---------|---------------------------|
| division | string  | league division           |
| season   | integer | season the match was held |

### Methods

| Method | HTTP request     | Description                   |
|--------|------------------|-------------------------------|
| index  | GET /api/seasons | returns all available seasons |


## Matches

A match represents a single match between two teams.
It holds information regarding when the match was played, who won and halftime
results.

### Structure

| Field    | Type    | Description                          |
|----------|---------|--------------------------------------|
| division | string  | league division                      |
| season   | integer | season the match was held            |
| hteam    | string  | home team                            |
| ateam    | string  | away team                            |
| fthg     | integer | full time home team goals            |
| ftag     | integer | full time away team goals            |
| ftr      | string  | full time result                     |
| hthg     | integer | half time home team goals            |
| htag     | integer | half time away team goals            |
| htr      | string  | half time results                    |
| date     | string  | date the match was held (DD/MM/YYYY) |

### Methods

| Method | HTTP request                     | Description                                          |
|--------|----------------------------------|------------------------------------------------------|
| index  | GET /api/matches                 | returns all matches                                  |
| index  | GET /api/matches/division/season | returns all matches in the given division and season |

# API Reference

All endpoints support both JSON and protobuf formats.
To change the desired format, specify it in the request header:

```
curl -H "Content-Type: application/json" localhost:4000/api/matches
```

or

```
curl -H "Content-Type: application/octet-stream" localhost:4000/api/matches
```


## Pairs

A pair is the tuple (division, season)

### Methods

| Method | HTTP request   | Description                 |
|--------|----------------|-----------------------------|
| index  | GET /api/pairs | returns all available pairs |


## Matches

A match represents a single match between two teams.
It holds information regarding when the match was played, who won and halftime
results.


### Methods

| Method | HTTP request                     | Description                                          |
|--------|----------------------------------|------------------------------------------------------|
| index  | GET /api/matches                 | returns all matches                                  |
| index  | GET /api/matches/division/season | returns all matches in the given division and season |

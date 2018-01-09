# PgAnalyze Connect

Ugly first cut, but it works. 

### Build Instructions
```
docker build . -t welch/pganalyze-collector:latest -t welch/pganalyze-collector:1.0.1
docker push welch/pganalyze-collector:latest
docker push welch/pganalyze-collector:1.0.1
```
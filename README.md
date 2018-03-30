## Usage

Generate html2 docs for ```game-api.yaml``` in current dir:
```bash
docker run --rm -it -v `pwd`:/mount korchasa/swagger-codegen-openapi generate \
    -i ./game-api.yaml \
    -l html2 \
    -o ./out
```

By alias:
```bash
alias swagger-codegen="docker run --rm -it -v `pwd`:/mount korchasa/swagger-codegen-openapi"
swagger-codegen generate -i ./game-api.yaml  -l html2 -o ./out
```

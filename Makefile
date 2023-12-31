svc = vox-backend
deps = *.go go.mod go.sum Makefile internal/database/*.go

$(svc): $(deps)
	go build -o $(svc)

internal/database: sqlc.yaml
	sqlc generate

.PHONY: clean
clean:
	rm -f $(svc)
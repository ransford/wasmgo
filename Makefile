GOROOT := $(shell go env GOROOT)
PORT := 9123

index.html: main.wasm wasm_exec.js

%.wasm: %.go
	GOOS=js GOARCH=wasm go build -o $@

wasm_exec.js:
	cp $(GOROOT)/misc/wasm/wasm_exec.js .

.PHONY: clean serve

clean:
	go clean
	$(RM) main.wasm wasm_exec.js

serve:
	python3 -m http.server --bind localhost "$(PORT)"

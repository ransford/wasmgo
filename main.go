package main

import (
	"fmt"
	"syscall/js"
	"time"
)

func main() {
	t := fmt.Sprintf("current time: %s", time.Now().String())
	js.Global().Call("setText", t)
}

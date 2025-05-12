# Telebot
Learning how to create Telegram bots

## Generic Golang project
Creating a generic Golang project
```
$ go mod init github.com/vadym-marchenko/telebot
```
This will initiare Go project in current directory. The path can be updated later if changed in `go.mod` file.

You can pass variable values when buidling the application. Example in project in `cmd/version.go`. Variable `appVersion` added. This variable used to output applicaton version. 
```go
    Run: func(cmd *cobra.Command, args []string) {
        fmt.Println(appVersion)
    },
```
It had default value set to string "Version" and never overried in the code. 
The value of the variable set when used `build` command.
```
$ go build -ldflags "-X="github.com/vadym-marchenko/telebot/cmd.appVersion=v1.0.0
```
When command executed 
```
$ ./telebot.exe version
v1.0.0
```

## Comand line framework (Cobra)
Dowload latest Cobra frawork 
```
$ go install github.com/spf13/cobra-cli@latest
```
Initialise Cobra frawork. This will create files for command line application. 
```
$ cobra-cli init
```
You can add comands to your Console application. Adding command `version` to console application using the following command.
```
$ cobra-cli add version
```
Execute created command
```
$ go run main.go version
version called
```
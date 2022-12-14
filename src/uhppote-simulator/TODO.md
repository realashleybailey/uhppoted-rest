# TODO

- [x] https://github.com/uhppoted/uhppote-simulator/issues/6
- [x] https://github.com/uhppoted/uhppote-simulator/issues/5
- [x] github workflow

### IN PROGRESS

## TODO

- [ ] Reimplement event list as circular buffer
- [ ] Verify fields in listen events/status replies against SDK
      - Battery status can be (at least) 0x00, 0x01 and 0x04
- [ ] Emulate PIN pad
- [ ] Replace UTO311L04.TimeOffset with time zone
- [ ] Unit tests for TaskList

### simulator
- [ ] concurrent requests
- [ ] simulator-cli
- [ ] Restructure so that events are generated by the simulator i.e. not by the actions
- [ ] HTML
- [ ] httpd
- [ ] Rework simulator.run to use rx channels
- [ ] Reload simulator on device file change
- [ ] Implement JSON unmarshal to initialise default values
- [ ] Swagger UI
- [ ] Autodetect gzipped files 
      - https://stackoverflow.com/questions/28309988/how-to-read-from-either-gzip-or-plain-text-reader-in-golang

### Documentation

- [ ] godoc
- [ ] build documentation
- [ ] install documentation
- [ ] user manuals
- [ ] man/info page

### Other

1.  Integration tests

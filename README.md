# JTSBGTask
Tidily request background task time on iOS.

## Usage

If you don't need a custom expiration handler:

```
if let task = JTSBGTask.start() {
    // Do long running stuff, then...
    task.end()
}
```

If you need a custom expiration handler:

```
let task = JTSBGTask()

let success = task.startWithExpirationHandler { /* clean up */ }
if success {
    // Do long unning stuff, then...
    task.end()
}
```

# saeedkolivand/homebrew-tap

```sh
brew tap saeedkolivand/tap
brew install --cask claude-usage
```

| Cask | What |
|---|---|
| `claude-usage` | [Claude Code usage in the macOS menu bar and as a desktop widget](https://github.com/saeedkolivand/claude-usage-mac) |

Casks live here rather than in `homebrew/cask` because these builds are ad-hoc
signed rather than notarized, and the main repository drops casks that fail
Gatekeeper checks from 2026-09-01. Each cask clears the quarantine attribute in
its `postflight`, since Homebrew is also removing the `--no-quarantine` flag.

`Casks/claude-usage.rb` is written by the release workflow in
[claude-usage-mac](https://github.com/saeedkolivand/claude-usage-mac); edit the
template there, not the generated file here.

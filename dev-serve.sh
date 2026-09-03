#!/usr/bin/env bash
# Runs `jekyll serve --livereload` and auto-restarts it whenever _config.yml changes
# (Jekyll only reads _config.yml at startup, so normal auto-regeneration can't pick it up).
set -u
cd "$(dirname "$0")"

CONFIG=_config.yml
PID=""

start() {
  rbenv exec bundle exec jekyll serve --livereload --port 4000 &
  PID=$!
  LAST_MTIME=$(stat -f %m "$CONFIG")
}

stop() {
  if [ -n "$PID" ] && kill -0 "$PID" 2>/dev/null; then
    kill "$PID" 2>/dev/null
    wait "$PID" 2>/dev/null
  fi
}

trap 'stop; exit 0' INT TERM

start
echo "Watching $CONFIG for changes (auto-restart on save)..."

while true; do
  sleep 1
  CUR_MTIME=$(stat -f %m "$CONFIG")
  if [ "$CUR_MTIME" != "$LAST_MTIME" ]; then
    echo ""
    echo ">>> $CONFIG changed, restarting Jekyll server..."
    stop
    start
  fi
  # if jekyll died on its own (e.g. build error), restart it too
  if ! kill -0 "$PID" 2>/dev/null; then
    echo ""
    echo ">>> Jekyll process exited unexpectedly, restarting..."
    start
  fi
done

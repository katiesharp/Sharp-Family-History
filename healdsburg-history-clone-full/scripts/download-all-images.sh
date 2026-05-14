#!/bin/bash
BASE="https://www.hannahclaybornshistoryofhealdsburg.com/uploads"
OUT="$HOME/Desktop/healdsburg-history-clone-full/uploads"
HTML_DIR="$HOME/Desktop/healdsburg-history-clone-full"

# Extract all unique image paths from all HTML files
grep -roh 'src="uploads/[^"]*"' "$HTML_DIR"/*.html \
  | sed 's/src="uploads\///' \
  | sed 's/"$//' \
  | sed 's/?[^"]*//' \
  | sort -u \
  | while read -r path; do
      dest="$OUT/$path"
      if [ -f "$dest" ] && [ -s "$dest" ]; then
        echo "Already have: $path"
      else
        dir="$(dirname "$dest")"
        mkdir -p "$dir"
        echo "Fetching: $path"
        curl -sL --retry 3 -o "$dest" "$BASE/$path"
      fi
    done

echo "Done"

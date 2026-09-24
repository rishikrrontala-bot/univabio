#!/usr/bin/env bash
# Extract a participant subset of Coswara (CC BY 4.0) from the local git object store,
# resample every recording to 16 kHz mono PCM16, and delete the raw 48 kHz files.
set -u
SRC=/tmp/intel/iiscleap_Coswara-Data
OUT=/home/user/data/cosw16
RAW=/home/user/data/raw
DATES="20200413 20200415 20200416 20200417 20200502 20200504 20200814 20210406 20210618 20210630 20210816 20210930 20220116"
cd "$SRC"
git show HEAD:combined_data.csv > /home/user/data/combined_data.csv
mkdir -p /home/user/data/annotations
for f in $(git ls-tree --name-only HEAD annotations/); do git show HEAD:$f > /home/user/data/$f; done
for d in $DATES; do
  echo "== $d $(date +%T)"
  rm -rf "$RAW"; mkdir -p "$RAW"
  parts=$(git ls-tree --name-only HEAD $d/ | grep 'tar.gz' | sort)
  (for p in $parts; do git cat-file blob HEAD:$p; done) | tar -xz -C "$RAW" 2>&1 | tail -2
  git show HEAD:$d/$d.csv > /home/user/data/cosw16/$d.csv
  find "$RAW" -type f \( -name '*.wav' -o -name '*.webm' -o -name '*.ogg' \) | while read -r f; do
    pid=$(basename "$(dirname "$f")"); name=$(basename "${f%.*}")
    mkdir -p "$OUT/$pid"; echo "$f|$OUT/$pid/$name.wav"
  done | xargs -P 4 -I{} sh -c 'IFS="|"; set -- $(echo "{}"); ffmpeg -nostdin -loglevel error -y -i "$1" -ac 1 -ar 16000 -sample_fmt s16 "$2" || echo "FAIL $1"'
  echo "   participants so far: $(ls $OUT | grep -v csv | wc -l)"
done
rm -rf "$RAW"
echo EXTRACT_DONE

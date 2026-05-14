#!/bin/bash
BASE="https://www.hannahclaybornshistoryofhealdsburg.com/uploads"
OUT="$HOME/Desktop/healdsburg-history-clone-full/uploads"

IMAGES=(
  "1/3/1/4/131404765/1256-1-2-howard-st-s-f-alleged-gang-hideou-bancroft-library-ucberkeley-t_orig.jpg"
  "1/3/1/4/131404765/editor/guidotti-hotel-santa-rosa-ca-1948-sonoma-county-library.png"
  "1/3/1/4/131404765/guidotti-house-28-west-seventh-st-santa-rosa-1920-ca-state-library_orig.jpg"
  "1/3/1/4/131404765/sonoma-county-jail-santa-rosa-1920-ca-state-library_orig.jpg"
  "1/3/1/4/131404765/headline-healdsburg-tribune-enterprise-and-scimitar-6-december-1920-1-1_orig.png"
  "1/3/1/4/131404765/mob-police-so-co-jail-6-dec-1920-ca-state-library_orig.jpeg"
  "1/3/1/4/131404765/jessie-montgomery-pearl-hanley-edna-fulmer-in-santa-rosa-1920-ca-state-library_orig.jpg"
  "1/3/1/4/131404765/lynching-victims-george-boyd-terrence-fitts-charles-valento-bornemuller-photo-s-f-chronicle-ca-state-library_orig.jpg"
  "1/3/1/4/131404765/jessie-montgomery-alleged-rape-victim-1920-ca-state-library_orig.jpg"
  "1/3/1/4/131404765/ransome-petray-home-11971-old-redwood-hwy_orig.png"
  "1/3/1/4/131404765/published/ransome-alexander-petray-1831-1906.png"
  "1/3/1/4/131404765/published/sheriff-petray-s-new-auto.jpg"
  "1/3/1/4/131404765/the-murdered-sherrif-healdsburg-tribune-enterprise-and-scimitar-6-december-1920-1-1_orig.png"
  "1/3/1/4/131404765/published/fred-young-1918-hm.jpg"
  "1/3/1/4/131404765/published/fred-young-portrait.png"
)

for path in "${IMAGES[@]}"; do
  dir="$OUT/$(dirname "$path")"
  mkdir -p "$dir"
  echo "Fetching $path"
  curl -sL --retry 3 -o "$OUT/$path" "$BASE/$path"
done
echo "Done"

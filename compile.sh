#!/usr/bin/env bash
# Usage: ./compile.sh <resume.tex>
# Compiles a LaTeX resume, moves PDF to output/, and removes all build artifacts.

set -e

if [ -z "$1" ]; then
    echo "Usage: ./compile.sh <resume.tex>"
    exit 1
fi

TEX="$1"
BASE="${TEX%.tex}"
OUTDIR="output"

mkdir -p "$OUTDIR"

pdflatex -interaction=nonstopmode "$TEX" > /dev/null 2>&1

mv "${BASE}.pdf" "$OUTDIR/"

rm -f "${BASE}.aux" "${BASE}.log" "${BASE}.out" \
      "${BASE}.fdb_latexmk" "${BASE}.fls" "${BASE}.synctex.gz"

echo "Done: ${OUTDIR}/${BASE}.pdf"

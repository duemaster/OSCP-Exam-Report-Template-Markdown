#! /bin/bash
echo "Creating Report..."

TEMPLATE_FILE=$1
OUTFILE_NAME=$2

echo "Using Template: ${TEMPLATE_FILE}"

# Add in themes file
cp /root/.pandoc/templates/fvextra.sty ./

pandoc /report/${TEMPLATE_FILE} \
-o generated-report/${OUTFILE_NAME}.pdf \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style tango

chmod a+wxr -R generated-report

echo "Generated Report ${OUTFILE_NAME}.pdf"
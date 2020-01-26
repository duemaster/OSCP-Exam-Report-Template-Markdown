# /bin/bash

pandoc OSCP-exam-report-template_whoisflynn_v3.2.md \
-o generated-report/OSCP-OS-XXXXX-Lab-Report.pdf \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style breezedark
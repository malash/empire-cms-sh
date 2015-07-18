#!/bin/sh -e

# Replace ^M to \n
git grep -l '' | grep -E "(\.php|\.html|\.txt|\.sql)" | xargs sed -i -e 's/\r$//g'

# Replace <? to <?php for short_open_tag=Off
git grep -l '<?' | grep -E "(\.php|\.html|\.txt|\.sql)" | xargs sed -i -e 's/<? /<?php /g'
git grep -l '<?' | grep -E "(\.php|\.html|\.txt|\.sql)" | xargs sed -i -e 's/<?$/<?php/g'
git grep -l '<?' | grep -E "(\.php|\.html|\.txt|\.sql)" | xargs sed -i -e 's/<?\r/<?php/g'


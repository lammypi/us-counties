{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "68ac575b",
   "metadata": {
    "papermill": {
     "duration": 0.004988,
     "end_time": "2022-12-20T22:53:41.467089",
     "exception": false,
     "start_time": "2022-12-20T22:53:41.462101",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# US County GDP"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c88dd4e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:41.477772Z",
     "iopub.status.busy": "2022-12-20T22:53:41.476264Z",
     "iopub.status.idle": "2022-12-20T22:53:42.885840Z",
     "shell.execute_reply": "2022-12-20T22:53:42.884531Z"
    },
    "papermill": {
     "duration": 1.416644,
     "end_time": "2022-12-20T22:53:42.887604",
     "exception": false,
     "start_time": "2022-12-20T22:53:41.470960",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "hash-2.2.6.2 provided by Decision Patterns\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘plotly’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:ggplot2’:\n",
      "\n",
      "    last_plot\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:graphics’:\n",
      "\n",
      "    layout\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    config\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<ol>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'hash'</li><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'lubridate'</li><li>'hash'</li><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'plotly'</li><li>'lubridate'</li><li>'hash'</li><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "\t<li><style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'usmap'</li><li>'plotly'</li><li>'lubridate'</li><li>'hash'</li><li>'gt'</li><li>'forcats'</li><li>'stringr'</li><li>'dplyr'</li><li>'purrr'</li><li>'readr'</li><li>'tidyr'</li><li>'tibble'</li><li>'ggplot2'</li><li>'tidyverse'</li><li>'readxl'</li><li>'stats'</li><li>'graphics'</li><li>'grDevices'</li><li>'utils'</li><li>'datasets'</li><li>'bigrquery'</li><li>'httr'</li><li>'methods'</li><li>'base'</li></ol>\n",
       "</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate}\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'hash'\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'lubridate'\n",
       "\\item 'hash'\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'plotly'\n",
       "\\item 'lubridate'\n",
       "\\item 'hash'\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\item \\begin{enumerate*}\n",
       "\\item 'usmap'\n",
       "\\item 'plotly'\n",
       "\\item 'lubridate'\n",
       "\\item 'hash'\n",
       "\\item 'gt'\n",
       "\\item 'forcats'\n",
       "\\item 'stringr'\n",
       "\\item 'dplyr'\n",
       "\\item 'purrr'\n",
       "\\item 'readr'\n",
       "\\item 'tidyr'\n",
       "\\item 'tibble'\n",
       "\\item 'ggplot2'\n",
       "\\item 'tidyverse'\n",
       "\\item 'readxl'\n",
       "\\item 'stats'\n",
       "\\item 'graphics'\n",
       "\\item 'grDevices'\n",
       "\\item 'utils'\n",
       "\\item 'datasets'\n",
       "\\item 'bigrquery'\n",
       "\\item 'httr'\n",
       "\\item 'methods'\n",
       "\\item 'base'\n",
       "\\end{enumerate*}\n",
       "\n",
       "\\end{enumerate}\n"
      ],
      "text/markdown": [
       "1. 1. 'readxl'\n",
       "2. 'stats'\n",
       "3. 'graphics'\n",
       "4. 'grDevices'\n",
       "5. 'utils'\n",
       "6. 'datasets'\n",
       "7. 'bigrquery'\n",
       "8. 'httr'\n",
       "9. 'methods'\n",
       "10. 'base'\n",
       "\n",
       "\n",
       "\n",
       "2. 1. 'forcats'\n",
       "2. 'stringr'\n",
       "3. 'dplyr'\n",
       "4. 'purrr'\n",
       "5. 'readr'\n",
       "6. 'tidyr'\n",
       "7. 'tibble'\n",
       "8. 'ggplot2'\n",
       "9. 'tidyverse'\n",
       "10. 'readxl'\n",
       "11. 'stats'\n",
       "12. 'graphics'\n",
       "13. 'grDevices'\n",
       "14. 'utils'\n",
       "15. 'datasets'\n",
       "16. 'bigrquery'\n",
       "17. 'httr'\n",
       "18. 'methods'\n",
       "19. 'base'\n",
       "\n",
       "\n",
       "\n",
       "3. 1. 'gt'\n",
       "2. 'forcats'\n",
       "3. 'stringr'\n",
       "4. 'dplyr'\n",
       "5. 'purrr'\n",
       "6. 'readr'\n",
       "7. 'tidyr'\n",
       "8. 'tibble'\n",
       "9. 'ggplot2'\n",
       "10. 'tidyverse'\n",
       "11. 'readxl'\n",
       "12. 'stats'\n",
       "13. 'graphics'\n",
       "14. 'grDevices'\n",
       "15. 'utils'\n",
       "16. 'datasets'\n",
       "17. 'bigrquery'\n",
       "18. 'httr'\n",
       "19. 'methods'\n",
       "20. 'base'\n",
       "\n",
       "\n",
       "\n",
       "4. 1. 'gt'\n",
       "2. 'forcats'\n",
       "3. 'stringr'\n",
       "4. 'dplyr'\n",
       "5. 'purrr'\n",
       "6. 'readr'\n",
       "7. 'tidyr'\n",
       "8. 'tibble'\n",
       "9. 'ggplot2'\n",
       "10. 'tidyverse'\n",
       "11. 'readxl'\n",
       "12. 'stats'\n",
       "13. 'graphics'\n",
       "14. 'grDevices'\n",
       "15. 'utils'\n",
       "16. 'datasets'\n",
       "17. 'bigrquery'\n",
       "18. 'httr'\n",
       "19. 'methods'\n",
       "20. 'base'\n",
       "\n",
       "\n",
       "\n",
       "5. 1. 'hash'\n",
       "2. 'gt'\n",
       "3. 'forcats'\n",
       "4. 'stringr'\n",
       "5. 'dplyr'\n",
       "6. 'purrr'\n",
       "7. 'readr'\n",
       "8. 'tidyr'\n",
       "9. 'tibble'\n",
       "10. 'ggplot2'\n",
       "11. 'tidyverse'\n",
       "12. 'readxl'\n",
       "13. 'stats'\n",
       "14. 'graphics'\n",
       "15. 'grDevices'\n",
       "16. 'utils'\n",
       "17. 'datasets'\n",
       "18. 'bigrquery'\n",
       "19. 'httr'\n",
       "20. 'methods'\n",
       "21. 'base'\n",
       "\n",
       "\n",
       "\n",
       "6. 1. 'lubridate'\n",
       "2. 'hash'\n",
       "3. 'gt'\n",
       "4. 'forcats'\n",
       "5. 'stringr'\n",
       "6. 'dplyr'\n",
       "7. 'purrr'\n",
       "8. 'readr'\n",
       "9. 'tidyr'\n",
       "10. 'tibble'\n",
       "11. 'ggplot2'\n",
       "12. 'tidyverse'\n",
       "13. 'readxl'\n",
       "14. 'stats'\n",
       "15. 'graphics'\n",
       "16. 'grDevices'\n",
       "17. 'utils'\n",
       "18. 'datasets'\n",
       "19. 'bigrquery'\n",
       "20. 'httr'\n",
       "21. 'methods'\n",
       "22. 'base'\n",
       "\n",
       "\n",
       "\n",
       "7. 1. 'plotly'\n",
       "2. 'lubridate'\n",
       "3. 'hash'\n",
       "4. 'gt'\n",
       "5. 'forcats'\n",
       "6. 'stringr'\n",
       "7. 'dplyr'\n",
       "8. 'purrr'\n",
       "9. 'readr'\n",
       "10. 'tidyr'\n",
       "11. 'tibble'\n",
       "12. 'ggplot2'\n",
       "13. 'tidyverse'\n",
       "14. 'readxl'\n",
       "15. 'stats'\n",
       "16. 'graphics'\n",
       "17. 'grDevices'\n",
       "18. 'utils'\n",
       "19. 'datasets'\n",
       "20. 'bigrquery'\n",
       "21. 'httr'\n",
       "22. 'methods'\n",
       "23. 'base'\n",
       "\n",
       "\n",
       "\n",
       "8. 1. 'usmap'\n",
       "2. 'plotly'\n",
       "3. 'lubridate'\n",
       "4. 'hash'\n",
       "5. 'gt'\n",
       "6. 'forcats'\n",
       "7. 'stringr'\n",
       "8. 'dplyr'\n",
       "9. 'purrr'\n",
       "10. 'readr'\n",
       "11. 'tidyr'\n",
       "12. 'tibble'\n",
       "13. 'ggplot2'\n",
       "14. 'tidyverse'\n",
       "15. 'readxl'\n",
       "16. 'stats'\n",
       "17. 'graphics'\n",
       "18. 'grDevices'\n",
       "19. 'utils'\n",
       "20. 'datasets'\n",
       "21. 'bigrquery'\n",
       "22. 'httr'\n",
       "23. 'methods'\n",
       "24. 'base'\n",
       "\n",
       "\n",
       "\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[[1]]\n",
       " [1] \"readxl\"    \"stats\"     \"graphics\"  \"grDevices\" \"utils\"     \"datasets\" \n",
       " [7] \"bigrquery\" \"httr\"      \"methods\"   \"base\"     \n",
       "\n",
       "[[2]]\n",
       " [1] \"forcats\"   \"stringr\"   \"dplyr\"     \"purrr\"     \"readr\"     \"tidyr\"    \n",
       " [7] \"tibble\"    \"ggplot2\"   \"tidyverse\" \"readxl\"    \"stats\"     \"graphics\" \n",
       "[13] \"grDevices\" \"utils\"     \"datasets\"  \"bigrquery\" \"httr\"      \"methods\"  \n",
       "[19] \"base\"     \n",
       "\n",
       "[[3]]\n",
       " [1] \"gt\"        \"forcats\"   \"stringr\"   \"dplyr\"     \"purrr\"     \"readr\"    \n",
       " [7] \"tidyr\"     \"tibble\"    \"ggplot2\"   \"tidyverse\" \"readxl\"    \"stats\"    \n",
       "[13] \"graphics\"  \"grDevices\" \"utils\"     \"datasets\"  \"bigrquery\" \"httr\"     \n",
       "[19] \"methods\"   \"base\"     \n",
       "\n",
       "[[4]]\n",
       " [1] \"gt\"        \"forcats\"   \"stringr\"   \"dplyr\"     \"purrr\"     \"readr\"    \n",
       " [7] \"tidyr\"     \"tibble\"    \"ggplot2\"   \"tidyverse\" \"readxl\"    \"stats\"    \n",
       "[13] \"graphics\"  \"grDevices\" \"utils\"     \"datasets\"  \"bigrquery\" \"httr\"     \n",
       "[19] \"methods\"   \"base\"     \n",
       "\n",
       "[[5]]\n",
       " [1] \"hash\"      \"gt\"        \"forcats\"   \"stringr\"   \"dplyr\"     \"purrr\"    \n",
       " [7] \"readr\"     \"tidyr\"     \"tibble\"    \"ggplot2\"   \"tidyverse\" \"readxl\"   \n",
       "[13] \"stats\"     \"graphics\"  \"grDevices\" \"utils\"     \"datasets\"  \"bigrquery\"\n",
       "[19] \"httr\"      \"methods\"   \"base\"     \n",
       "\n",
       "[[6]]\n",
       " [1] \"lubridate\" \"hash\"      \"gt\"        \"forcats\"   \"stringr\"   \"dplyr\"    \n",
       " [7] \"purrr\"     \"readr\"     \"tidyr\"     \"tibble\"    \"ggplot2\"   \"tidyverse\"\n",
       "[13] \"readxl\"    \"stats\"     \"graphics\"  \"grDevices\" \"utils\"     \"datasets\" \n",
       "[19] \"bigrquery\" \"httr\"      \"methods\"   \"base\"     \n",
       "\n",
       "[[7]]\n",
       " [1] \"plotly\"    \"lubridate\" \"hash\"      \"gt\"        \"forcats\"   \"stringr\"  \n",
       " [7] \"dplyr\"     \"purrr\"     \"readr\"     \"tidyr\"     \"tibble\"    \"ggplot2\"  \n",
       "[13] \"tidyverse\" \"readxl\"    \"stats\"     \"graphics\"  \"grDevices\" \"utils\"    \n",
       "[19] \"datasets\"  \"bigrquery\" \"httr\"      \"methods\"   \"base\"     \n",
       "\n",
       "[[8]]\n",
       " [1] \"usmap\"     \"plotly\"    \"lubridate\" \"hash\"      \"gt\"        \"forcats\"  \n",
       " [7] \"stringr\"   \"dplyr\"     \"purrr\"     \"readr\"     \"tidyr\"     \"tibble\"   \n",
       "[13] \"ggplot2\"   \"tidyverse\" \"readxl\"    \"stats\"     \"graphics\"  \"grDevices\"\n",
       "[19] \"utils\"     \"datasets\"  \"bigrquery\" \"httr\"      \"methods\"   \"base\"     \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Libraries to use\n",
    "libs <- c('readxl',\n",
    "          'tidyverse',\n",
    "          'gt',\n",
    "          'ggplot2',\n",
    "          'hash',\n",
    "          'lubridate',\n",
    "          'plotly',\n",
    "          'usmap')\n",
    "\n",
    "# Include libraries\n",
    "lapply(libs, library, character.only = TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "8a2b58de",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:42.921704Z",
     "iopub.status.busy": "2022-12-20T22:53:42.898706Z",
     "iopub.status.idle": "2022-12-20T22:53:43.302309Z",
     "shell.execute_reply": "2022-12-20T22:53:43.301161Z"
    },
    "papermill": {
     "duration": 0.411635,
     "end_time": "2022-12-20T22:53:43.304264",
     "exception": false,
     "start_time": "2022-12-20T22:53:42.892629",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m55563\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m10\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (6): Region, SUB_REGION, State, STATE_ABBR, County, County Full Name\n",
      "\u001b[32mdbl\u001b[39m (4): index, Year, County FIPS, GDP (Chained $)\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spec_tbl_df [55,563 × 10] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ index           : num [1:55563] 0 1 2 3 4 5 6 7 8 9 ...\n",
      " $ Year            : num [1:55563] 2001 2001 2001 2001 2001 ...\n",
      " $ County FIPS     : num [1:55563] 1001 1003 1005 1007 1009 ...\n",
      " $ Region          : chr [1:55563] \"Southeast\" \"Southeast\" \"Southeast\" \"Southeast\" ...\n",
      " $ SUB_REGION      : chr [1:55563] \"East South Central\" \"East South Central\" \"East South Central\" \"East South Central\" ...\n",
      " $ State           : chr [1:55563] \"Alabama\" \"Alabama\" \"Alabama\" \"Alabama\" ...\n",
      " $ STATE_ABBR      : chr [1:55563] \"AL\" \"AL\" \"AL\" \"AL\" ...\n",
      " $ County          : chr [1:55563] \"Autauga\" \"Baldwin\" \"Barbour\" \"Bibb\" ...\n",
      " $ County Full Name: chr [1:55563] \"Autauga County\" \"Baldwin County\" \"Barbour County\" \"Bibb County\" ...\n",
      " $ GDP (Chained $) : num [1:55563] 9.55e+08 3.93e+09 8.13e+08 2.93e+08 8.10e+08 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   index = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Year = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `County FIPS` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Region = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   SUB_REGION = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   State = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   STATE_ABBR = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   County = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `County Full Name` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `GDP (Chained $)` = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "# Load the data\n",
    "data <- read_csv('/kaggle/input/the-u-s-counties-with-the-highest-gdp/GDP by County.csv')\n",
    "\n",
    "# Check structure of data\n",
    "str(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f49cddcf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.317301Z",
     "iopub.status.busy": "2022-12-20T22:53:43.316259Z",
     "iopub.status.idle": "2022-12-20T22:53:43.335808Z",
     "shell.execute_reply": "2022-12-20T22:53:43.334635Z"
    },
    "papermill": {
     "duration": 0.027641,
     "end_time": "2022-12-20T22:53:43.337841",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.310200",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t55563 obs. of  8 variables:\n",
      " $ index          : num  0 1 2 3 4 5 6 7 8 9 ...\n",
      " $ Year           : num  2001 2001 2001 2001 2001 ...\n",
      " $ County.FIPS    : num  1001 1003 1005 1007 1009 ...\n",
      " $ Region         : chr  \"Southeast\" \"Southeast\" \"Southeast\" \"Southeast\" ...\n",
      " $ SUB_REGION     : chr  \"East South Central\" \"East South Central\" \"East South Central\" \"East South Central\" ...\n",
      " $ STATE_ABBR     : chr  \"AL\" \"AL\" \"AL\" \"AL\" ...\n",
      " $ County         : chr  \"Autauga\" \"Baldwin\" \"Barbour\" \"Bibb\" ...\n",
      " $ GDP..Chained...: num  9.55e+08 3.93e+09 8.13e+08 2.93e+08 8.10e+08 ...\n"
     ]
    }
   ],
   "source": [
    "# Create a dataframe from relevant data points - Don't bother with stringsAsFactors = TRUE at this point\n",
    "df <- data.frame(data[c(\"index\", \"Year\", \"County FIPS\",\"Region\", \"SUB_REGION\", \"STATE_ABBR\", \"County\", \"GDP (Chained $)\")])\n",
    "\n",
    "# Check the structure\n",
    "str(df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2605879b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T15:35:53.085665Z",
     "iopub.status.busy": "2022-12-20T15:35:53.084296Z",
     "iopub.status.idle": "2022-12-20T15:35:53.095939Z"
    },
    "papermill": {
     "duration": 0.005269,
     "end_time": "2022-12-20T22:53:43.348544",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.343275",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Data Exploration"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "d4553677",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.361081Z",
     "iopub.status.busy": "2022-12-20T22:53:43.359980Z",
     "iopub.status.idle": "2022-12-20T22:53:43.379433Z",
     "shell.execute_reply": "2022-12-20T22:53:43.378260Z"
    },
    "papermill": {
     "duration": 0.027841,
     "end_time": "2022-12-20T22:53:43.381421",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.353580",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "      Year       County.FIPS       Region           SUB_REGION       \n",
       " Min.   :2001   Min.   : 1001   Length:55563       Length:55563      \n",
       " 1st Qu.:2005   1st Qu.:18157   Class :character   Class :character  \n",
       " Median :2010   Median :29129   Mode  :character   Mode  :character  \n",
       " Mean   :2010   Mean   :30066                                        \n",
       " 3rd Qu.:2014   3rd Qu.:45007                                        \n",
       " Max.   :2018   Max.   :56045                                        \n",
       "  STATE_ABBR           County         \n",
       " Length:55563       Length:55563      \n",
       " Class :character   Class :character  \n",
       " Mode  :character   Mode  :character  \n",
       "                                      \n",
       "                                      \n",
       "                                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Via the summary() funtion\n",
    "summary(df[, 2:7])"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "16e1ff30",
   "metadata": {
    "papermill": {
     "duration": 0.005311,
     "end_time": "2022-12-20T22:53:43.392368",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.387057",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Year"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0a9da5d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.405606Z",
     "iopub.status.busy": "2022-12-20T22:53:43.404369Z",
     "iopub.status.idle": "2022-12-20T22:53:43.457376Z",
     "shell.execute_reply": "2022-12-20T22:53:43.455930Z"
    },
    "papermill": {
     "duration": 0.061806,
     "end_time": "2022-12-20T22:53:43.459316",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.397510",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Unique Year values\n",
    "unique_years <- sort(table(df$Year), decreasing = T)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "ffedbbb3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.472425Z",
     "iopub.status.busy": "2022-12-20T22:53:43.471329Z",
     "iopub.status.idle": "2022-12-20T22:53:43.530392Z",
     "shell.execute_reply": "2022-12-20T22:53:43.528891Z"
    },
    "papermill": {
     "duration": 0.068049,
     "end_time": "2022-12-20T22:53:43.532790",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.464741",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Create a tibble\n",
    "years_tibble <- tibble(# Create column year\n",
    "                       Year = sort(unique(df$Year), decreasing = T),\n",
    "                       # Create count column\n",
    "                       Counts = unique_years)\n",
    "\n",
    "# Build the gt object\n",
    "years_tbl <- gt(years_tibble)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "43dbf876",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.547082Z",
     "iopub.status.busy": "2022-12-20T22:53:43.545659Z",
     "iopub.status.idle": "2022-12-20T22:53:43.571986Z",
     "shell.execute_reply": "2022-12-20T22:53:43.570165Z"
    },
    "papermill": {
     "duration": 0.035711,
     "end_time": "2022-12-20T22:53:43.574219",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.538508",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 18 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Year</th><th scope=col>Counts</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;table&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2018</td><td>3089</td></tr>\n",
       "\t<tr><td>2017</td><td>3089</td></tr>\n",
       "\t<tr><td>2016</td><td>3089</td></tr>\n",
       "\t<tr><td>2015</td><td>3089</td></tr>\n",
       "\t<tr><td>2014</td><td>3089</td></tr>\n",
       "\t<tr><td>2013</td><td>3089</td></tr>\n",
       "\t<tr><td>2012</td><td>3089</td></tr>\n",
       "\t<tr><td>2011</td><td>3089</td></tr>\n",
       "\t<tr><td>2010</td><td>3089</td></tr>\n",
       "\t<tr><td>2009</td><td>3089</td></tr>\n",
       "\t<tr><td>2008</td><td>3086</td></tr>\n",
       "\t<tr><td>2007</td><td>3084</td></tr>\n",
       "\t<tr><td>2006</td><td>3084</td></tr>\n",
       "\t<tr><td>2005</td><td>3084</td></tr>\n",
       "\t<tr><td>2004</td><td>3084</td></tr>\n",
       "\t<tr><td>2003</td><td>3084</td></tr>\n",
       "\t<tr><td>2002</td><td>3084</td></tr>\n",
       "\t<tr><td>2001</td><td>3083</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 18 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Year & Counts\\\\\n",
       " <dbl> & <table>\\\\\n",
       "\\hline\n",
       "\t 2018 & 3089\\\\\n",
       "\t 2017 & 3089\\\\\n",
       "\t 2016 & 3089\\\\\n",
       "\t 2015 & 3089\\\\\n",
       "\t 2014 & 3089\\\\\n",
       "\t 2013 & 3089\\\\\n",
       "\t 2012 & 3089\\\\\n",
       "\t 2011 & 3089\\\\\n",
       "\t 2010 & 3089\\\\\n",
       "\t 2009 & 3089\\\\\n",
       "\t 2008 & 3086\\\\\n",
       "\t 2007 & 3084\\\\\n",
       "\t 2006 & 3084\\\\\n",
       "\t 2005 & 3084\\\\\n",
       "\t 2004 & 3084\\\\\n",
       "\t 2003 & 3084\\\\\n",
       "\t 2002 & 3084\\\\\n",
       "\t 2001 & 3083\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 18 × 2\n",
       "\n",
       "| Year &lt;dbl&gt; | Counts &lt;table&gt; |\n",
       "|---|---|\n",
       "| 2018 | 3089 |\n",
       "| 2017 | 3089 |\n",
       "| 2016 | 3089 |\n",
       "| 2015 | 3089 |\n",
       "| 2014 | 3089 |\n",
       "| 2013 | 3089 |\n",
       "| 2012 | 3089 |\n",
       "| 2011 | 3089 |\n",
       "| 2010 | 3089 |\n",
       "| 2009 | 3089 |\n",
       "| 2008 | 3086 |\n",
       "| 2007 | 3084 |\n",
       "| 2006 | 3084 |\n",
       "| 2005 | 3084 |\n",
       "| 2004 | 3084 |\n",
       "| 2003 | 3084 |\n",
       "| 2002 | 3084 |\n",
       "| 2001 | 3083 |\n",
       "\n"
      ],
      "text/plain": [
       "   Year Counts\n",
       "1  2018 3089  \n",
       "2  2017 3089  \n",
       "3  2016 3089  \n",
       "4  2015 3089  \n",
       "5  2014 3089  \n",
       "6  2013 3089  \n",
       "7  2012 3089  \n",
       "8  2011 3089  \n",
       "9  2010 3089  \n",
       "10 2009 3089  \n",
       "11 2008 3086  \n",
       "12 2007 3084  \n",
       "13 2006 3084  \n",
       "14 2005 3084  \n",
       "15 2004 3084  \n",
       "16 2003 3084  \n",
       "17 2002 3084  \n",
       "18 2001 3083  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Style years_tbl\n",
    "years_tbl <- years_tbl %>% tab_header(title = \"Observations per Year\")\n",
    "\n",
    "# View - append $`_data` to avoid unneeded information displaying\n",
    "years_tbl$`_data`"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "01b4f48d",
   "metadata": {
    "papermill": {
     "duration": 0.005836,
     "end_time": "2022-12-20T22:53:43.586010",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.580174",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Location: Regions, Sub-Regions, and States"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "8f129849",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.599957Z",
     "iopub.status.busy": "2022-12-20T22:53:43.598777Z",
     "iopub.status.idle": "2022-12-20T22:53:43.613110Z",
     "shell.execute_reply": "2022-12-20T22:53:43.611666Z"
    },
    "papermill": {
     "duration": 0.023786,
     "end_time": "2022-12-20T22:53:43.615438",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.591652",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Unique Region values\n",
    "unique_regions <- sort(table(df$Region), decreasing = )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "10b47a55",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.629640Z",
     "iopub.status.busy": "2022-12-20T22:53:43.628469Z",
     "iopub.status.idle": "2022-12-20T22:53:43.639675Z",
     "shell.execute_reply": "2022-12-20T22:53:43.638391Z"
    },
    "papermill": {
     "duration": 0.021626,
     "end_time": "2022-12-20T22:53:43.642654",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.621028",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Find the number of sub regions per region\n",
    "subRegionCounter <- function(region) {\n",
    "    # Create a blank vector\n",
    "    all_sub_regions <- c()\n",
    "    # Get all the row indexes corresponding to the region\n",
    "    region_idx <- which(df$Region == region)\n",
    "    # Vector containing all of the sub_region names\n",
    "    for (i in region_idx) {\n",
    "        all_sub_regions <- append(all_sub_regions, df$SUB_REGION[[i]], after = length(all_sub_regions))\n",
    "    }\n",
    "    # Get a list of unique values for the subregion\n",
    "    unique_sub_regions <- sort(unique(all_sub_regions), decreasing = F)\n",
    "    # Return unique_sub_regions\n",
    "    return(unique_sub_regions)\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "a9e6d278",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:43.666671Z",
     "iopub.status.busy": "2022-12-20T22:53:43.664837Z",
     "iopub.status.idle": "2022-12-20T22:53:45.654723Z",
     "shell.execute_reply": "2022-12-20T22:53:45.652983Z"
    },
    "papermill": {
     "duration": 2.008512,
     "end_time": "2022-12-20T22:53:45.656890",
     "exception": false,
     "start_time": "2022-12-20T22:53:43.648378",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<hash> containing 8 key-value pair(s).\n",
       "  Far West : Mountain Pacific \n",
       "  Great Lakes : East North Central\n",
       "  Mideast : Middle Atlantic South Atlantic \n",
       "  New England : New England\n",
       "  Plains : West North Central\n",
       "  Rocky Mountain : Mountain\n",
       "  Southeast : East South Central South Atlantic     West South Central\n",
       "  Southwest : Mountain           West South Central"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Create a hash\n",
    "region_hash <- hash()\n",
    "\n",
    "# Build region_hash\n",
    "for (r in sort(unique(df$Region))) {\n",
    "    .set(region_hash, r, subRegionCounter(r))\n",
    "}\n",
    "\n",
    "# Check\n",
    "region_hash"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "5f4ce398",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:45.671489Z",
     "iopub.status.busy": "2022-12-20T22:53:45.670367Z",
     "iopub.status.idle": "2022-12-20T22:53:45.690377Z",
     "shell.execute_reply": "2022-12-20T22:53:45.689206Z"
    },
    "papermill": {
     "duration": 0.02932,
     "end_time": "2022-12-20T22:53:45.692073",
     "exception": false,
     "start_time": "2022-12-20T22:53:45.662753",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>2</li><li>1</li><li>2</li><li>1</li><li>1</li><li>1</li><li>3</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 2\n",
       "\\item 1\n",
       "\\item 2\n",
       "\\item 1\n",
       "\\item 1\n",
       "\\item 1\n",
       "\\item 3\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 2\n",
       "2. 1\n",
       "3. 2\n",
       "4. 1\n",
       "5. 1\n",
       "6. 1\n",
       "7. 3\n",
       "8. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 2 1 2 1 1 1 3 2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Hold the number of regions\n",
    "sub_region_counts <- c()\n",
    "\n",
    "for (k in keys(region_hash)) {\n",
    "    num_sub_regions <- length(values(region_hash, k))\n",
    "    sub_region_counts <- append(sub_region_counts, num_sub_regions)\n",
    "}\n",
    "\n",
    "# Check\n",
    "sub_region_counts"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "ef6eee3b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:45.706434Z",
     "iopub.status.busy": "2022-12-20T22:53:45.705182Z",
     "iopub.status.idle": "2022-12-20T22:53:45.715808Z",
     "shell.execute_reply": "2022-12-20T22:53:45.714581Z"
    },
    "papermill": {
     "duration": 0.019684,
     "end_time": "2022-12-20T22:53:45.717691",
     "exception": false,
     "start_time": "2022-12-20T22:53:45.698007",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Find the number of states per region\n",
    "stateCounter <- function(region){\n",
    "    # Create a blank vector\n",
    "    all_states <- c()\n",
    "    # Get all row indexes corresponding to the region\n",
    "    region_idx <- which(df$Region == region)\n",
    "    # Vector containing all state names\n",
    "    for (i in region_idx) {\n",
    "        all_states <- append(all_states, df$STATE_ABBR[i])\n",
    "    }\n",
    "    # Get the list of unique states per region\n",
    "    unique_states_region <- sort(unique(all_states), decreasing = F)\n",
    "    # Return unique_states_region\n",
    "    return(unique_states_region)\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "d5cca7f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:45.731719Z",
     "iopub.status.busy": "2022-12-20T22:53:45.730663Z",
     "iopub.status.idle": "2022-12-20T22:53:47.562389Z",
     "shell.execute_reply": "2022-12-20T22:53:47.561099Z"
    },
    "papermill": {
     "duration": 1.840685,
     "end_time": "2022-12-20T22:53:47.564090",
     "exception": false,
     "start_time": "2022-12-20T22:53:45.723405",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<hash> containing 8 key-value pair(s).\n",
       "  Far West : AK CA HI NV OR WA\n",
       "  Great Lakes : IL IN MI OH WI\n",
       "  Mideast : DC DE MD NJ NY PA\n",
       "  New England : CT MA ME NH RI VT\n",
       "  Plains : IA KS MN MO ND NE SD\n",
       "  Rocky Mountain : CO ID MT UT WY\n",
       "  Southeast : AL AR FL GA KY LA MS NC SC TN VA WV\n",
       "  Southwest : AZ NM OK TX"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Create a hash\n",
    "state_hash <- hash()\n",
    "\n",
    "# Build the hash\n",
    "for (r in sort(unique(df$Region))) {\n",
    "    .set(state_hash, r, stateCounter(r))\n",
    "}\n",
    "\n",
    "# Check\n",
    "state_hash"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "37f8c6f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:47.578575Z",
     "iopub.status.busy": "2022-12-20T22:53:47.577310Z",
     "iopub.status.idle": "2022-12-20T22:53:47.597139Z",
     "shell.execute_reply": "2022-12-20T22:53:47.595920Z"
    },
    "papermill": {
     "duration": 0.028745,
     "end_time": "2022-12-20T22:53:47.598705",
     "exception": false,
     "start_time": "2022-12-20T22:53:47.569960",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>6</li><li>5</li><li>6</li><li>6</li><li>7</li><li>5</li><li>12</li><li>4</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 6\n",
       "\\item 5\n",
       "\\item 6\n",
       "\\item 6\n",
       "\\item 7\n",
       "\\item 5\n",
       "\\item 12\n",
       "\\item 4\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 6\n",
       "2. 5\n",
       "3. 6\n",
       "4. 6\n",
       "5. 7\n",
       "6. 5\n",
       "7. 12\n",
       "8. 4\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  6  5  6  6  7  5 12  4"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Hold the count of states\n",
    "state_counts <- c()\n",
    "\n",
    "for (k in keys(state_hash)) {\n",
    "    num_states <- length(values(state_hash, k))\n",
    "    state_counts <- append(state_counts, num_states)\n",
    "}\n",
    "\n",
    "# Check\n",
    "state_counts"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "b1c79b22",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:47.615267Z",
     "iopub.status.busy": "2022-12-20T22:53:47.614063Z",
     "iopub.status.idle": "2022-12-20T22:53:47.655804Z",
     "shell.execute_reply": "2022-12-20T22:53:47.654487Z"
    },
    "papermill": {
     "duration": 0.05327,
     "end_time": "2022-12-20T22:53:47.658066",
     "exception": false,
     "start_time": "2022-12-20T22:53:47.604796",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 8 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>Observations</th><th scope=col>Subregions</th><th scope=col>States</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;table&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Far West      </td><td> 1206</td><td>2</td><td> 6</td></tr>\n",
       "\t<tr><td>Great Lakes   </td><td> 3204</td><td>1</td><td> 5</td></tr>\n",
       "\t<tr><td>Mideast       </td><td> 3238</td><td>2</td><td> 6</td></tr>\n",
       "\t<tr><td>New England   </td><td> 3887</td><td>1</td><td> 6</td></tr>\n",
       "\t<tr><td>Plains        </td><td> 6822</td><td>1</td><td> 7</td></tr>\n",
       "\t<tr><td>Rocky Mountain</td><td> 7866</td><td>1</td><td> 5</td></tr>\n",
       "\t<tr><td>Southeast     </td><td>11124</td><td>3</td><td>12</td></tr>\n",
       "\t<tr><td>Southwest     </td><td>18216</td><td>2</td><td> 4</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 8 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Region & Observations & Subregions & States\\\\\n",
       " <chr> & <table> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t Far West       &  1206 & 2 &  6\\\\\n",
       "\t Great Lakes    &  3204 & 1 &  5\\\\\n",
       "\t Mideast        &  3238 & 2 &  6\\\\\n",
       "\t New England    &  3887 & 1 &  6\\\\\n",
       "\t Plains         &  6822 & 1 &  7\\\\\n",
       "\t Rocky Mountain &  7866 & 1 &  5\\\\\n",
       "\t Southeast      & 11124 & 3 & 12\\\\\n",
       "\t Southwest      & 18216 & 2 &  4\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 8 × 4\n",
       "\n",
       "| Region &lt;chr&gt; | Observations &lt;table&gt; | Subregions &lt;int&gt; | States &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| Far West       |  1206 | 2 |  6 |\n",
       "| Great Lakes    |  3204 | 1 |  5 |\n",
       "| Mideast        |  3238 | 2 |  6 |\n",
       "| New England    |  3887 | 1 |  6 |\n",
       "| Plains         |  6822 | 1 |  7 |\n",
       "| Rocky Mountain |  7866 | 1 |  5 |\n",
       "| Southeast      | 11124 | 3 | 12 |\n",
       "| Southwest      | 18216 | 2 |  4 |\n",
       "\n"
      ],
      "text/plain": [
       "  Region         Observations Subregions States\n",
       "1 Far West        1206        2           6    \n",
       "2 Great Lakes     3204        1           5    \n",
       "3 Mideast         3238        2           6    \n",
       "4 New England     3887        1           6    \n",
       "5 Plains          6822        1           7    \n",
       "6 Rocky Mountain  7866        1           5    \n",
       "7 Southeast      11124        3          12    \n",
       "8 Southwest      18216        2           4    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Create a tibble\n",
    "region_tibble <- tibble(# Create Region column\n",
    "                        Region = sort(unique(df$Region), decreasing = F),\n",
    "                        # Create a counts column\n",
    "                        Observations = unique_regions,\n",
    "                        # Create a subregion counts column\n",
    "                        Subregions = sub_region_counts,\n",
    "                        # Create a states counts column\n",
    "                        States = state_counts)\n",
    "\n",
    "# Build the gt object\n",
    "region_tbl <- gt(region_tibble) %>% tab_header(title = \"Observations per Region\")\n",
    "\n",
    "# View\n",
    "region_tbl$`_data`"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "68841231",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:53:47.673680Z",
     "iopub.status.busy": "2022-12-20T22:53:47.672368Z",
     "iopub.status.idle": "2022-12-20T22:53:48.124633Z",
     "shell.execute_reply": "2022-12-20T22:53:48.123406Z"
    },
    "papermill": {
     "duration": 0.462866,
     "end_time": "2022-12-20T22:53:48.127348",
     "exception": false,
     "start_time": "2022-12-20T22:53:47.664482",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Sub Regions: Far West\n",
    "far_west_map <- plot_usmap(include = c(.mountain, .pacific), labels = TRUE, color = 'black', fill = 'blue', alpha = 0.35)\n",
    "\n",
    "# View\n",
    "far_west_map"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "59a7b241",
   "metadata": {
    "papermill": {
     "duration": 0.007435,
     "end_time": "2022-12-20T22:53:48.142489",
     "exception": false,
     "start_time": "2022-12-20T22:53:48.135054",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 10.036534,
   "end_time": "2022-12-20T22:53:48.267858",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-20T22:53:38.231324",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

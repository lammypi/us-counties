{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "dec2a76b",
   "metadata": {
    "papermill": {
     "duration": 0.005998,
     "end_time": "2022-12-20T22:44:35.058645",
     "exception": false,
     "start_time": "2022-12-20T22:44:35.052647",
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
   "id": "5d1d4d2e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:35.072060Z",
     "iopub.status.busy": "2022-12-20T22:44:35.070024Z",
     "iopub.status.idle": "2022-12-20T22:44:36.935207Z",
     "shell.execute_reply": "2022-12-20T22:44:36.933368Z"
    },
    "papermill": {
     "duration": 1.874409,
     "end_time": "2022-12-20T22:44:36.937736",
     "exception": false,
     "start_time": "2022-12-20T22:44:35.063327",
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
   "id": "4af22aae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:36.982467Z",
     "iopub.status.busy": "2022-12-20T22:44:36.951791Z",
     "iopub.status.idle": "2022-12-20T22:44:37.455739Z",
     "shell.execute_reply": "2022-12-20T22:44:37.452827Z"
    },
    "papermill": {
     "duration": 0.515575,
     "end_time": "2022-12-20T22:44:37.459447",
     "exception": false,
     "start_time": "2022-12-20T22:44:36.943872",
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
   "id": "62a7777d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.475620Z",
     "iopub.status.busy": "2022-12-20T22:44:37.474031Z",
     "iopub.status.idle": "2022-12-20T22:44:37.503230Z",
     "shell.execute_reply": "2022-12-20T22:44:37.500955Z"
    },
    "papermill": {
     "duration": 0.040578,
     "end_time": "2022-12-20T22:44:37.506494",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.465916",
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
   "id": "e8e913aa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T15:35:53.085665Z",
     "iopub.status.busy": "2022-12-20T15:35:53.084296Z",
     "iopub.status.idle": "2022-12-20T15:35:53.095939Z"
    },
    "papermill": {
     "duration": 0.007034,
     "end_time": "2022-12-20T22:44:37.520156",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.513122",
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
   "id": "ef0e4d94",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.538364Z",
     "iopub.status.busy": "2022-12-20T22:44:37.535866Z",
     "iopub.status.idle": "2022-12-20T22:44:37.566993Z",
     "shell.execute_reply": "2022-12-20T22:44:37.565114Z"
    },
    "papermill": {
     "duration": 0.042852,
     "end_time": "2022-12-20T22:44:37.569529",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.526677",
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
   "id": "3fb3c2c3",
   "metadata": {
    "papermill": {
     "duration": 0.006634,
     "end_time": "2022-12-20T22:44:37.583241",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.576607",
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
   "id": "d0c299c3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.599765Z",
     "iopub.status.busy": "2022-12-20T22:44:37.598133Z",
     "iopub.status.idle": "2022-12-20T22:44:37.675623Z",
     "shell.execute_reply": "2022-12-20T22:44:37.673656Z"
    },
    "papermill": {
     "duration": 0.088545,
     "end_time": "2022-12-20T22:44:37.678253",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.589708",
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
   "id": "51339e69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.695059Z",
     "iopub.status.busy": "2022-12-20T22:44:37.693444Z",
     "iopub.status.idle": "2022-12-20T22:44:37.772022Z",
     "shell.execute_reply": "2022-12-20T22:44:37.769298Z"
    },
    "papermill": {
     "duration": 0.089877,
     "end_time": "2022-12-20T22:44:37.774801",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.684924",
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
   "id": "0551c247",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.791517Z",
     "iopub.status.busy": "2022-12-20T22:44:37.789872Z",
     "iopub.status.idle": "2022-12-20T22:44:37.823589Z",
     "shell.execute_reply": "2022-12-20T22:44:37.821283Z"
    },
    "papermill": {
     "duration": 0.045169,
     "end_time": "2022-12-20T22:44:37.826611",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.781442",
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
   "id": "88d4e279",
   "metadata": {
    "papermill": {
     "duration": 0.006854,
     "end_time": "2022-12-20T22:44:37.840361",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.833507",
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
   "id": "95c0668e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.858803Z",
     "iopub.status.busy": "2022-12-20T22:44:37.857010Z",
     "iopub.status.idle": "2022-12-20T22:44:37.879441Z",
     "shell.execute_reply": "2022-12-20T22:44:37.877511Z"
    },
    "papermill": {
     "duration": 0.035638,
     "end_time": "2022-12-20T22:44:37.882508",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.846870",
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
   "id": "21d3f4f4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.899737Z",
     "iopub.status.busy": "2022-12-20T22:44:37.898010Z",
     "iopub.status.idle": "2022-12-20T22:44:37.912981Z",
     "shell.execute_reply": "2022-12-20T22:44:37.911240Z"
    },
    "papermill": {
     "duration": 0.026328,
     "end_time": "2022-12-20T22:44:37.915454",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.889126",
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
   "id": "a854ef0d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:37.941512Z",
     "iopub.status.busy": "2022-12-20T22:44:37.939931Z",
     "iopub.status.idle": "2022-12-20T22:44:40.631149Z",
     "shell.execute_reply": "2022-12-20T22:44:40.628302Z"
    },
    "papermill": {
     "duration": 2.713343,
     "end_time": "2022-12-20T22:44:40.635360",
     "exception": false,
     "start_time": "2022-12-20T22:44:37.922017",
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
   "id": "3cf07537",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:40.659218Z",
     "iopub.status.busy": "2022-12-20T22:44:40.657300Z",
     "iopub.status.idle": "2022-12-20T22:44:40.692961Z",
     "shell.execute_reply": "2022-12-20T22:44:40.691204Z"
    },
    "papermill": {
     "duration": 0.047191,
     "end_time": "2022-12-20T22:44:40.695353",
     "exception": false,
     "start_time": "2022-12-20T22:44:40.648162",
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
   "id": "7cd3d069",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:40.713177Z",
     "iopub.status.busy": "2022-12-20T22:44:40.711732Z",
     "iopub.status.idle": "2022-12-20T22:44:40.726106Z",
     "shell.execute_reply": "2022-12-20T22:44:40.724452Z"
    },
    "papermill": {
     "duration": 0.026066,
     "end_time": "2022-12-20T22:44:40.728522",
     "exception": false,
     "start_time": "2022-12-20T22:44:40.702456",
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
   "id": "3b9223c4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:40.746862Z",
     "iopub.status.busy": "2022-12-20T22:44:40.745218Z",
     "iopub.status.idle": "2022-12-20T22:44:43.251710Z",
     "shell.execute_reply": "2022-12-20T22:44:43.249000Z"
    },
    "papermill": {
     "duration": 2.519497,
     "end_time": "2022-12-20T22:44:43.255271",
     "exception": false,
     "start_time": "2022-12-20T22:44:40.735774",
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
   "id": "b97e3476",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:43.287127Z",
     "iopub.status.busy": "2022-12-20T22:44:43.283522Z",
     "iopub.status.idle": "2022-12-20T22:44:43.318383Z",
     "shell.execute_reply": "2022-12-20T22:44:43.316533Z"
    },
    "papermill": {
     "duration": 0.055819,
     "end_time": "2022-12-20T22:44:43.321031",
     "exception": false,
     "start_time": "2022-12-20T22:44:43.265212",
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
   "id": "1ce0a7e0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:43.346495Z",
     "iopub.status.busy": "2022-12-20T22:44:43.344810Z",
     "iopub.status.idle": "2022-12-20T22:44:43.402614Z",
     "shell.execute_reply": "2022-12-20T22:44:43.400697Z"
    },
    "papermill": {
     "duration": 0.075038,
     "end_time": "2022-12-20T22:44:43.406263",
     "exception": false,
     "start_time": "2022-12-20T22:44:43.331225",
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
   "id": "cb03cd9d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-20T22:44:43.430463Z",
     "iopub.status.busy": "2022-12-20T22:44:43.427918Z",
     "iopub.status.idle": "2022-12-20T22:44:44.016207Z",
     "shell.execute_reply": "2022-12-20T22:44:44.013032Z"
    },
    "papermill": {
     "duration": 0.602246,
     "end_time": "2022-12-20T22:44:44.018904",
     "exception": false,
     "start_time": "2022-12-20T22:44:43.416658",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3xTVf8H8O9N0j3obmkp0E1pKYUC3ZRR9hJB1CKC8CgiCj/FgSiggA+PAi5Q\nxAkooA8CDoaADCndCwrdk5YuumdWk/v7Iz5YFRmlyUmTz/vlH+QkufnEF9AP5557LsfzPAEA\nAABA7ydgHQAAAAAAegaKHQAAAICOQLEDAAAA0BEodgAAAAA6AsUOAAAAQEeg2AEAAADoCBQ7\nAAAAAB2BYgcAAACgI1DsAAAAAHQEih0AAACAjkCxAwAAANARKHYAAAAAOgLFDgAAAEBHoNgB\nAAAA6AgUOwAAAAAdgWIHAAAAoCNQ7AAAAAB0BIodAAAAgI5AsQMAAADQESh2AAAAADoCxQ4A\nAABAR6DYAQAAAOgIFDsAAAAAHYFiBwAAAKAjUOwAAAAAdASKHQAAAICOQLEDAAAA0BEodgAA\nAAA6AsUOAAAAQEeg2AEAAADoCBQ7AAAAAB2BYgcAAACgI1DsAAAAAHQEih0AAACAjkCxAwAA\nANARKHYAAAAAOgLFDgAAAEBHoNgBAAAA6AgUOwAAAAAdgWIHAAAAoCNQ7AAAAAB0BIodAAAA\ngI5AsQNgQ6FQ3Lhxg3UKAADQKSh2AAxUVlaGhYU5OjoOGzbs9ddfT0hIUCqVrEMBAECvx/E8\nzzoDgH5paGgICAioqKgwNjaXSNpUg/b29pMnT54+ffrEiROtrKzYJgQAgF4KxQ5A05KSkkJC\nQtzdR6xfH1tTU5SRcSwj41hBQbxC0UlEIpEoIiJi2rRp06dPHzRoEOuwAADQm6DYAWhaenp6\nUFDQoEGR69ZduDnY3t6YmXkyI+PY5cu/tLbWqQY9PT1nzZo1a9assLAwoVDIKC8AAPQaKHYA\nmsDz/HvvvZeUlLR8+fLQ0FB3d/eKiop33rnq4jL4L69UKhWFhUkZGUczMo6VlWWqBu3t7adP\nnz5r1qzo6GgzMzONxwcAgN4BxQ7gd8nJybt37/bz81uwYIGlpeX9H/DXX38tKSnx9PR0d3f/\n/PPPN23aRERmZmanT5/+5JNP9u7d+9JLR4cNm3abI9TWlqSm/piW9mNubqxSqSAiQ0PDsLCw\n6OjoCRMmBAUFYRoPAAC6QrED+N2yZcs++eQTIoqMjPzll19MTU3v84Dm5ubt7e03HxoZmYWH\nzz979lMbGxtPT8/k5OStW3Ocne9qFV1bW31GxrH09J+zss62tTWoBm1sbMaNGzd+/PgJEyZ4\neHjcZ1oAANABKHYAv3vllVfeeecdAwMjuVw6adKko0ePikSibh+to6PDzMzM1NRq6NBJ1dWF\ndnb9p0z5v0GDRu/YERMff8DIyIhI9MUXzQLBvU25KZWKkpK0q1d/vXLldH5+fGenTDXu5uYW\nHR09ceLE6OhoXFQLAKC3UOwAfrd+/foNGzY8+OC6pKTvKyqyn3vuuQ8//LDbR6usrHRxcXF3\nH7FpU0rX8aSk7z/44CEicnYetHVrzv0Elkrbc3J+u3Ll9NWrv5aXX1UNCoXC4ODgyZMnT5o0\nCedqAQD0DYodABGRWCz29va+fv36m2/GW1k5vf76qNbWul27dj311FPdO2B9fb2dnZ2Li++W\nLdk3B5VKxZdfLjt79jMicnT0eO+9wp5JT9TUVHXlyq+ZmSevXDnd0vL7DS1sbW1VJ2rHjx/v\n5ubWU58FAABaC8UOgIhozZo1mzdvDgqauWrVj0SUnX1+8+aJSmXnwoUL3377bQcHh24c08bG\npq1NvHt3O8f9fouXuLj9H30038HB4caNG7a2rtu3l/XkdyAiIp5XlpZmZGaevHz5ZEFBgkIh\nV417eHiMHz8+Ojp63Lhxtra2Pf65AACgDVDsACg1NTUkJMTAwGTz5gxHR0/VYHLyoS+/XNbS\nUuvg4HDy5MnAwMB7PWxYWFhCQsKiRTsmTlyuGomPP7BjR8yzzz770Ucf9enj+PHHVT35Nf5G\nImnNyjqXlXXmypVfKyp+nzgUCATDhw9XXVcbFhZmbGys1gwAAKBJ3V8bDqAzLl68qFAopk9/\n7marI6JRo+YMHjz266+fj43dO27cuF9++WXUqFH3dNh33nln3LhxX3/9vKGhcVTU4tbWuvPn\nvyAisVjM8/zAgcN7+Gv8jbGxRVDQzKCgmUTU2Fh59eqZq1d/zco6k5qampqa+p///MfU1DQy\nMjI6Onrs2LGBgYFYkAcA0Nthxg6APv3006VLlz7wwGvz5m36y1M8z+/f/9KxY9usrKwKCwvv\n9STmZ5999vTTTyuVSn//aAsL24SE7xwdHSUSSXNz8x03sVOfiooc1SUXOTnnxeJW1aCVldXo\n0aPHjh07duzYIUOGCAQCJtkAAOB+oNgB0MKFC/fu3fvccwdCQx+55Qt27nw8NvbrefPmbd26\n1dXV9Z4OHhcX9+STT+bk/H4B7KOPPnrgwIHJk1c+/vj795v7vikU8sLCpKtXf83OPl9YmCiX\nS1Xjtra2UVFRY8aMGTt2rJ+fH8dxbHMCAMBdQrEDIHd399LS0l27as3Nbz0hV1mZ+/rrIyWS\nNkNDw4ULF86bNy8yMtLIyOguj19fX//QQw8lJSUNGDAgICDgu+++W7PmtL9/dM99gx4gk4nz\n8+Nzcs5nZZ0rKkq+edWFvb396NGjx4wZM2bMGJQ8AAAth2IH+q6mpsbJyalvX+9t2/Ju87KW\nlhvHjr17+vRHEkkbEZmbm0+cOHHhwoUzZsy4+65TWFg4ZMgQhYJ/771CG5t+PZBePaTS9ry8\ni9nZ57Ozz5WUpCkUnapxVckbPXp0VFQUTtcCAGghFDvQd5cvXw4MDBw6dPIrr5y444vb2hoS\nE7/LyDienX1WKu0gIj8/v/fffz86+s7Tb0qlcvLkyadPn549e+1DD23ogegaIZG05uZezMk5\nn5PzW9eSZ21tHRERMXr06MjIyKCgoPu5SwcAAPQUFDvQd2VlZQMGDPD0DNmwIeHu3yWTiTMy\njv788zvFxalCoXD9+vUvvfTSza1DcnJyfHx8uk5o8Tz/1FNPff75505OXm+/nWlg0Cs3GZFI\nWvPy4nJzY3NyfisuTrl5QzMzM7OQkJDIyMjIyMiQkJD7v80uAAB0D4od6DuxWGxjY6NUclu3\n5trZ9b/Xt8fG7v3yy2VSaYeDg8OTTz7p6em5Y8eOtLS0jRs3vv766zdflpiYGBoaamnpsHbt\neRcX3x79BmxIpR1FRUk5ORfy8i4WFCRIpe2qcQMDgxEjRkRERERGRkZERFhbW7PNCQCgV1Ds\nAGj16tVvv/12ZOSCZcv2duPt169nHTy4NjX1R55X3hy0trYuLS21tLRUPczIyBg+fHhg4JSX\nXz7eM6G1iULRWVKSlpd3MTf3Ql5eXFtbvWpcIBAMHjw4IiIiPDw8LCzM3d2dbU4AAJ2HYgdA\nra2tTk5OCgX32WcNIpFh9w5SXV2QknKkoiJ75MjZycmHYmO/jomJmT17dm5u7vXr142NjT/4\n4ANDQ5NXXz3l4xPRs/m1Cs/zFRXZubkX8vIu5ubG1teX33zKyckpNDQ0IiIiNDQ0KCjI0LCb\n/6sBAOCfoNgBEBFNmjTp1KlT69fH9kjramysXLNmWHPzjb8/5erq//bbV+7/I3qL+vry3NzY\n/Py4/Py48vKrSqVCNW5sbBwUFBQeHq7qeXZ2dmxzAgDoBhQ7ACKizZs3r1mzZv78rdOmreqR\nA5aUpMfG7lUqO52cvGxt+3/77atVVXlEZGBgtHt3B8fp40YhEklrQUFifn58QUFCQUGCWNyi\nGuc4zsfHJzQ0NDw8PDQ01NfXF7vlAQB0D3YoACAiGjJkCBFdv57VUwd0cxvu5vbH3WC//Xa1\n6hfGxhY99RG9jrGxxZAhE4YMmUBESqXi+vWs3NzYgoKE/Py43Nzc3Nzcr776ioisrKwiIyM/\n/fRTJycn1pEBAHoZFDsAIiLVuv66umvqOHh5+ZWqqnzVr8PCHtXP6bq/EAiE/fsH9O8fMHHi\nciJqbKzMz48vKIgvKEgsLk79+eef09LSpk1jcy9dAIDeC8UOgIioo6ODiIyNzdVx8EuXjhPR\nwIEDS0tLCwuTeJ7Hqca/sLZ2Dg6eGxw8l4hWrRpUVZU3bNgw1qEAAHofzBwAEBE1NTURkamp\nlToOLpdLicjDw4PjuNLSDJmsQx2fohtaW+uqq/MHDhzo7OzMOgsAQO+DYgdARNTc3ExEpqZ9\n1HHwgICJRHTmzBkimjTpWSMjM3V8im4oKEjgeT4sLIx1EACAXgmnYgGIiKqqqojIwkItm254\neATPn7+1vr4sMnJh1ysq4O8KChKICMUOAKB7UOwAiIguXbpERK6u/uo4OMdxPbWLis7Ly4sj\novDwcNZBAAB6JZyKBSAiunz5MhH17z+UdRC9plDIS0pSzczM/P3V0rABAHQeih0AKRSK7Oxs\nExMLBwc31ln0WmlphlTaERISIhLhZAIAQHeg2AFQQUFBR0eHq+sQ7DDHVkFBIhGFhoayDgIA\n0FvhxxgANTY2EpFAgFkixgoK4gnFDgDgPqDYAdCoUaNcXV3z8mJraopYZ9FreXlxHMeFhISw\nDgIA0Fuh2AGQUCicN28ez/NXr/7KOov+qq8vb2i47uvra2NjwzoLAEBvhWIHQESkWq1vaGjK\nOoj+ys+PI6KIiAjWQQAAejEUOwAiovr6eiIyN8dcETP5+VhgBwBwv1DsAIj+d/2EmZk16yD6\nC/ecAAC4fyh2AEREubm5RGRr68o6iJ6SSNquXbvk4ODg5eXFOgsAQC+GYgdAjY2NOTk5NjYu\nKHasFBYmKhSdERERHMexzgIA0Iuh2AFQfHy8Uqn08YlkHUR/5eVdJFw5AQBw31DsACghIYGI\nvLywbJ8ZVbELDw9nHQQAoHdDsQN9p1Qqv/32WyLy8xvLOoueUig6CwoSzczMhg8fzjoLAEDv\nhmIH+u7MmTNFRUVubsNdXYewznI7138JiYnhXv8xs+tgpyRp/nzB/PlG1bLOruPFB4bGxHBv\nXsi/OcLzHS89YRgTwz3zxh4NJb5rpaXpUml7SEiIajdBAADoNhQ70Hfu7u7Gxsbl5Vflcinr\nLLdjN2oeEd24cKHrYEvBWzzP87zsUFl91/Gs5DIiihra7+ZIW9nqCqmciJqLXmjoVGgi8V3D\nAjsAgJ6CYgf6zsPDw97evrNTJhBo9R8HY+tnbAxE4rr3lF0Gi35MFxr0M+C4vCMZf4zyspMN\nrUJD79F9/riRRta+I0Q0e5ofr2j4OqdKY7HvhmprYhQ7AID7p9U/yQA0o7W11cDAWCg0YB3k\ntjjjWQ59FPLihJaO/w0pfyiuNeu3cYqtRXPev2++UNryTYNcYdb31Zt/vHnFjb25VUZWi2fN\nXE9E2fuOaDb6HeTnxwmFwlGjRrEOAgDQ66HYgb6TyWQtLS294mZigyd6E9FvBTdUD6XNX5dI\nZP2mR4aO9ZR3xCa2ilXjLfn7iajvlD9u4dCU/39NnQrX6S8YWjwUamnadv3Vyj+vyWOotra0\nqana39/f0tKSdRYAgF4PxQ70XXl5uVKptLCw43medZY7sB3xKBFVnsxSPaxP+5SIpgxxcYx6\nlIhOpperxq+fyqM/L7BL++YMxwnmjfEkouljvXhl+9eXyjWb/R+p7iSGW8QCAPQIFDvQd4aG\nhoaGhmVlmZs3T5BIWlnHuR1jq6V2BqK20l2qh5kncg1Mo4LMjY2tVzgaiiqOnlSNn71W33WB\nnUKWv/9anbHtC/6mRkTkPOk5Iir89hsW3+AWVMUuJCSEdRAAAF2AYgf6ztXV9eLFi4MHD756\n9czp0x+zjnNbnOEsJyt5+9FyqZxXtvxQ3dzH+xXV+Nz+dh3VGzuUvEKak94u6brAruHSSolS\nOXDuk6qHRlZLhpobd9RsLJLI2HyLPyssTCTM2AEA9BAUO9B3c+fOjYqKkkqlRJScfIh1nDvw\nneTN8/yxmmZx3dstCoXnA4GqcZ/ZgUpF7Q83msW17/M833WB3YUDiURkVfPfn39+W/Wftbkx\nz8v3JZaw+Q5dyGTi0tJLtra2Xl5erLMAAOgCbAcKeq29vf2nn36Sy+VFRUVGRmYzZ65mnegO\nbIcvIIovOltYJfqZ44SzB9irxq18XiX6JeNEbohRInVZYNcpjvvhRjMRJRxZm/DnQ107tIvG\nvKvJ8H9XXJyqUMhDQkI4jmObBABAN6DYgV6Lj4+Xy+XDh8946KENZmY2dnb9WSe6A6M+/3Iw\nfK4h/WisosSoz2JXo9//CItMRwdbml5K3pVlVNZ1gV1N7MsKnvdelPXGxMFdDsP/50nTKw3v\nZ7ZvDjAz0viX+AOunAAA6Fk4FQt67cKFC0Tk5zduwIBA7W91RESc6AEna0nj9jNN7bYjF3d9\nZnJgP1nL3p/qW7ousDvxQybHGTw22vMvR3k42ofn+YPn8okpVbELCwu74ysBAOBuoNiBXvvl\nl1+IyNc3inWQe+AzxYdXtCh4fuhkn67jLjMm8ryyXaG8ucBO1vr92aY2M+eNnsaGfzmIy9S1\nRHT92BbNZP4nhYVJQqFwxIgRbGMAAOgMFDvQX0VFRWlpaQ4O7gMGBLLOcg9shi4iIk5oNcuh\nT9dxM6d1pkIBdVlgV3H8LSIavCDm7wcxtJgTbW0ubf46rkWs7sD/pLa2tKmpasiQIRYWFqwy\nAADoGKyxA/21f/9+nudDQx/pXSv3jayW7N+/5O/jnND+868VXUfcHs7Y//A/HmfxR62L//FJ\nTVBtdBIcHMw0BQCATsGMHeiv7777jojCwh5hHURPFRYmEYodAECPQrEDPRUfH5+VleXiMtjV\ndQjrLHoKxQ4AoMeh2IGe2rhxIxFVVGS/8kqATMZsnZne6uyUlZZmWFlZDRo0iHUWAADdgTV2\noKecnZ1NTU1lMll5+ZXdu58tL79qaWnf2FgZFDRrzpz1rNPpvtLSDLlcMmrUaIEA/7wEAOgx\nKHagp6ytrTs6OoiI47jz57+8OV5fX+7rO9rXd0zvuqKi11Gdhw0JCWEdBABAp6DYgZ6Sy+Wq\nXxgaGpqZmZmbm5ubm4vF4pKSkk2bxnGcibGx3bp1pwcM8Ln9caB7cEksAIA6cDzPs84AwEBl\nZaWnp6dYfLvVde7uUzdtOqaxSHpl5Ur3urrS2tpaW1tb1lkAAHQHZuxATzk7Ozs7OxcVFX30\nUYVQaNDaWvfFF0udnQfZ2vY3MbE0MjL57LOnrl9PZx1TN7W03KitLfH29karAwDoWSh2oL+q\nqqpMTCytrZ2JyNLSft26Czef+uSTRURkbu6oelhTU07EOzr2hpvJ9gbY6AQAQE1Q7EBP5efn\nd3R0/NMmdpMnr7xwYW9Dw+VFixyVys7OzgYigZvbxLfeOqHhnDoJxQ4AQE2w0QDoo9TU1KVL\nlxLRqFEP3vIFAwcOmzHjJaHQQCa70dnZIBCIOI4vKflly5Zb3MsL7hWunAAAUBNcPAH6yNfX\nNzc319LS4d//TrexcbnNKy9dOm5p6ejuHvTbb1/t2rWYiFu06OuJE+drLKru4Xnlv/5lTSRv\nbm42MDBgHQcAQKdgxg70kYmJCRG9+Wbc7VsdEQUGTnV3DyKiqKgnIiIWEPH79j1fV1eliZQ6\n6vr1bLG4Zfjw4Wh1AAA9DsUO9I5MJsvLyzM2NrezG3hPb3z66S9NTfvI5bUbNsxUTzS9UFSE\nBXYAAOqCYgd658KFCx0dHd7e4ULhvV08JBCINm5MJqLGxgL1RNMLBQWJhHtOAACoB4od6J09\ne/YQUUjIvG68t29fb4FAqFC0tLY29nQufYGbiQEAqA+KHeids2fPchwXHDy3e283N7ch4pOS\nTvZsKj0hkbRWVGQ7Ozu7urqyzgIAoINQ7EDvmJmZ8TzP88ruvt2GiKqri3s0lL4oLExWKhWY\nrgMAUBMUO9AvDQ0NJSUlFhZ2JiaW3T3CdSIaNmxcj+bSF6orJ1DsAADUBMUO9Mt3333X2dkZ\nFDST47r5m18gEBKRTCbt0Vz6QnXlBC6JBQBQExQ70C979+4losjIx7v39rKyTLG4heMMPTxu\nfS8yuL3CwiSRSDRixAjWQQAAdBOKHeiRkydPJiYmOjp6DBo0untHyMw8RUTW1r6WljY9Gk0v\n3LhR3NJyIyAgwNTUlHUWAADdhGIH+kIulz/zzDNE9Mgj/+E4rnsHsbcfSERiMfY66Q6chwUA\nUDcUO9AXOTk5xcXFnp4h3d7ohIhOndpBRH37+vdcLj1SWIitiQEA1AvFDvRFVlYWEbm63lcn\nU1WTWbOe75lMegZbEwMAqBuKHeiLbdu2EdHw4dPv5yCWlg5E9NNP7/dMJn0il0uuXbtkY2Pj\n5eXFOgsAgM5CsQO9EB8fn5aW1r9/wPDhM+/nOPPnb+E4rqjo2PPPh1ZVlfZINj1RUpLe2SkL\nDg7u9gJHAAC4IxQ70AvZ2dlENGzY9PtsFSEhDz/99B6OE9TUJL74os/27Stu//r29pbs7OTm\n5rr7+VDdgAV2AAAaIGIdAEATUlJSiKhv3x44CRgZucDTM3jbtgcqK3MSErZnZh51dg5Yv/6Q\nauPim3Jz006f3pOY+BnPSzjO0NNzqo2Ni4GBkaWl7ciRk3x8gu4/Se+iWmCHS2IBANSK43me\ndQYA9WpubnZxcZHLlTt2lJub2/bUYc+d+/zzz5eq7jnr4hJlZzegtDTV0tJJIBDW1uZ3dJQR\n8URkZGQmlbb/+a2iqVPffOyxNT2VpFdYsWJgfX1ZQ0ODlZUV6ywAADoLxQ503549exYtWhQZ\n+fiyZXt69sgVFTlnz3564sQtrqXgOMHAgYHBwQ/NnLk6NfWH2Ni9Mpmko6Opra2+qiqfiAQC\nM1NT55Ur9/r56f7ZyY6Opn/9y9rT07OgoIB1FgAAXYZiB7pv/PjxZ8+efemlo8OGTVPH8XNz\nYw8f3qBUdgYFzaqtLVUqFb6+UcOGTTc0NL7l6w8eXPvTT/9RKDqJiOMMZ8x465FHXlRHMO0R\nF7f/o4/mz549+/Dhw6yzAADoMhQ70HE//fTTrFmzHB09tmzJFokMWcf5g0zWsWnTuMLCJCLB\nxx9X19ZWeHgM+ctCvby89MOHt/Xp47ho0Zumphb3dPyUlFPFxVdmzHjqXt+oDitWDKyru3bq\n1KkJEyawzgIAoMtQ7ECXyWQyX1/f4uLiF1/8afjwGazj3MKiRWYyWYdAYKFUthKJjIwcBg4M\nqarKEovrOztbeF6mepmjY8h77yX8/e1KpTIl5XRi4k9tbY2GhsZmZlY2Ns7e3kHnzh1IS/uc\niBeJrP39Z1lY2FpY2BCRra3LhAkxIpFBVVXpZ5+9VFtb5OY2csSIySEhUw0NjdT3NdesGV5a\nmrFv376YmBj1fQoAAKDYgS47cOBATEzMkCETXn31FOsst/bMM32bmqqJSCgUKRQK1fUWN4lE\nhgMHDisuTlUqFfb2I/z9J5iYmAuFRo6OrmfP7ikuPkmkuM3BjY0tJJLWvwxynLGpqXN7+7U/\nv1dkbj7A1TUoMHBCVNSDlpY2PfUFVa5cOb1588SwsLC4uLiePTIAAHSFYge6LCIiIi4u7uWX\njwcGTmGd5dZqagrPnv3U2Nhy1qzVRIITJ949fvy9sWOXhIc/1revt+o1J09+uGfPylu+neME\nxsbm/fsPsbd3a29vlMnEjY2Vzc3VnZ3yhQs/HDNm8eHDG0pK0tvbGzo75URUXZ3f1tagequr\nq9/IkQ/m5JwvK7vS3t7UpVNyRkZ9nZ2HBgREjx79YN++A+//a/K88l//suZ5WVtbm1AovPMb\nAACgW1DsQGedPXt2/Pjxjo4e776bz3G9ey/uysq8kye3FxTEyWRSImprqzc3t3nmmb3u7iPv\n9VBVVflZWWfDw2NMTCxvDspkkoSEA6mpPxYVJTc316j2cFERiWzt7QcNGjQ6LGxmty/g7eyU\nLVliaW5uWl9fjztPAACoD4od6KbOzs5hw4ZdvXr1mWe+joh4jHWcXiYj41hCwnf5+XH19WWq\nq3dVBALTPn083d1HDR8+KTz8Hy/7/buOjuZlyxxFIkFhYaGzs7N6UgMAAIod6Kjt27evWLHC\n2zt8/fpYTBHdj9LSjNjYvdnZ56qqCmSyji7PCE1N+7m4BA4dGh0VNdfW1uk2B2louL5mzfCW\nltrMzMwhQ4aoOzMAgN5CsQMd1N7ePnDgwPr6hk2bkt3c9O7mXerT1FR14cLey5dPlJdfbWtr\n6Losz9DQwclpiJ/fmMjIBwcO9O36LqVS8dprI65du7Ro0aKvvvpK87EBAPQHih3ooNOnT0+c\nODEoaOaqVT+yzqKzOjtlqalHkpIOFRYmNTZWKJV/XGMrFFpaW3u5uY0cNiw6LGwax3HPPtuv\ntbXu/PnzUVFRDDMDAOg8EesAAD0vISGBiAYNGs06iC4TiQxDQh4OCXlY9TAr61x8/P7c3Au1\ntaWdnS11dWl1dWkpKZ98+qnQxMTZwMCUiLKyslDsAADUCsUOdNBvv/1GRD4+4ayD6BE/v7F+\nfmNVv66pKYqL+yYr62x5eVZbW4NYXC4WExGdOnXqmWeeYZkSAEDX4VQs6JqGhgZHR0cTE6ud\nO6v/cocu0DylsjMt7Whc3DfJyYewQTEAgLr17s29AP5u//79nZ2dI0Y8gFanDQQC0ciRDzz7\n7H6BQFhcXMw6DgCAjkOxA53C8/zOnTuJaNy4J1lngT+IRIYDBgytrq5WnSUHAAA1QbEDnXL+\n/Pns7Gx39xEeHqNYZ4E/mTjxWSJas2ZNfX096ywAADoLxQ50imqbtOjoZayDwF+FhcU4OXnF\nx8dPnjxZJpOxjgMAoJtQ7EB3dHZ2Hjt2TCg0GDXqQdZZ4K8MDIw2bUr29AxOTU0dP378d999\nxzoRAIAOQrED3XHixImGhobBg8eYmlqxzgK3YGpq9dxz31pZ9b148WJMTEx6ejrrRAAAugbF\nDnTHpk2bCJdNaDd7+4Efflg6b94mpVL573//m3UcAABdg2IHOuLEiRPJydJLmBIAACAASURB\nVMn9+vmNGjWHdRa4HZHIcOjQKUQkkUhYZwEA0DUodqAj3n33XSKaPXstx+F3tbYzMDAioqKi\nImyQDgDQs/AjEHSBWCy+ePGiqWmf4OC5rLPAnfXr5+fhMTI3N/f8+fOsswAA6BQUO9AFR48e\nlUgkfn7jcLeJXqGiIqeyMo+I5HI56ywAADoFxQ50wZ49e4goImIB6yBwZxJJ63vvPSgWt6xZ\ns2bixIms4wAA6BQOa1ygt6upqenXr5+JSZ+PPqoUiQxZx4E72L790YSEbydNmnT8+HGBAP+2\nBADoSfhbFXq93bt3d3Z2hoY+ilan/U6d+igh4VtXV9dvvvkGrQ4AoMfhL1bo3RQKxSeffEJE\n48cvZZ0F7qCkJG3fvlUGBgbfffednZ0d6zgAADpIxDoAwH05fvx4aWnp4MFjXF39WWeB25FI\nWnfsiJHLpVu3bg0NDWUdBwBAN2HGDnq3nTt3ElF09DLWQeAOvvhiWVVV/syZM1944QXWWQAA\ndBYunoBerLCw0MfHx9LScfv2a0KhAes48I/Ky6+sXj3UwcEhOzvbxsaGdRwAAJ2FGTvoxbZu\n3apUKsePX4pWp+UOHXqT5/kXX3wRrQ4AQK0wYwe9VVVVlbu7O88LP/yw1MICK/G1V1FR8rp1\nIX379i0oKDA1NWUdBwBAl2HGDnqrd999VyKRjBv3JFqdlvvuuzU8z69btw6tDgBA3TBjB71S\nY2PjgAEDxGLpe+8V2tq6so4D/ygh4bvt2x/x8vLKysoyMMAZcwAA9cKMHfRKO3bsaG1tjYh4\nDK1Om508uf2TTxYKBIL33nsPrQ4AQAMwYwe9T2Njo7u7e2tr2zvvZPXt6806DtxaXNz+jz6a\nb2houH379qeeeop1HAAAvYANiqH32bJlS1NT05gxS9DqtNnx4+8S0ffffz9jxgzWWQAA9AVm\n7KCXqa6u9vT0lMk6t23Lt7PrzzoO/KMVKwbW1V1rb2/HNRMAABqDNXbQy6xataq9vX38+KVo\nddqsoaGivb1BKBTK5XLWWQAA9AiKHfQmhw4d2r9/v7W185w5b7DOAv9ILpfu2BEjFreuWLGi\nT58+rOMAAOgRnIqFXqOysjIwMLCuru6ll44FBk5hHQdura2t/quvnk1I+Hbo0KFxcXFmZmas\nEwEA6BFcPAG9Q21t7YQJE2pra8ePX4pWp52uXbt84MArV66c5nllv379jh07hlYHAKBhOBUL\nvUBJScnEiROzs7MDAiY9/vgHrOPALTQ312zcGJWZedLR0WHRokVnz551cXFhHQoAQO9gxg60\nXWZmZnh4eFtbm69v1PPPHzYwMGKdCG7h0KE3OjqaFy1a9Omnn2IvYgAAVlDsQNtdunSpra0t\nIGDSqlU/GBgYs44Dt1BSkn727Gd9+vTZsmULWh0AAEM4FQvabvfu3UQUHDwXrU47KZWKL798\nWqlUbNiwwc7OjnUcAAC9hhk70Grnzp07d+6co6Pn6NELWWdRL54XXzq37XzCD4Xlxa3tUnOr\nvgO8o0PHPj/a36fry8R1ry9Z8dZf3is0MLWyHzw8bPmjDyw0FnAaTE1EdPjwhqKilKCgoOXL\nl2v4owEA4C9Q7ECrrV27logefHCtUKjLJ/jkbck73pySUtFgZDUowH+WtblRS21OVsrnlxN2\nnYp85/WlL/6lrlm6x4T7OPzvES8X1+alHzn9/ROXr8nff/5JjcWWycTbtz+alvajmZnZl19+\nKRQKNfbRAABwSyh2oL1++umnuLi4fv38wsPns86iRryiZsfq8amNkshHDy6ePseI+73DdXbk\nHdk180jsy2uFLlueiun6Fmv/FxY8EtR1RCEr3LjMvyB1aU7HQl9TQ80kz84+l5b2Y//+/fft\n2xcQEKCZDwUAgNvAGjvQUlKp9JVXXiGihx9+SyDQ5amg0p9mpDS0+cw9v2zG3JutjohEpj4P\n/d/VqQPsKs7PP13XevuDCA095wW48Dyf2iZWc94/5ObGElFMTExERITGPhQAAG4DxQ601JYt\nW3Jzc/39xwcFzWKdRa34L3++LDTyf3Fm2C2e5AzmvLCGiH7+6uIdD6SUKYjIVqShEiyXS37+\n+R2BQPDwww9r5hMBAOCOUOxAGxUUFLz11lsGBkZPPPEx6yzqJW/7uUgi6+O+0VR464seTOz/\nz9XIoKXgDv8flPLyn/JrDMyioq3N1RDzFgwMjPv3H6JUKrG0DgBAe2CNHWid+vr6WbNmSSSS\nOXPe6NvXm3Uc9ZKLE4jIYlD/f34JF2hucrQpvutQY9YH+/c7/u8RL+u4kZd+qNogYNm6Hw01\ndVGsQtGputN0YWHhkCFDNPSpAABwWyh2oF3EYvHMmTNzcnKGDp38wAOvsY6jATwRcdzt6piQ\nIyJF15GWoq+PFv31ZS4jwtxsNTRdR0QtLTfKy68S0fz58w8ePDht2jSNfTQAAPwTnIoF7fLa\na6/Fx8e7u49YufKgUKj7//AwMAkhopacstu85kqbRGQS2nVkwMzU/fv5m//t+bxq1WOPV6S+\n/9a7h9Qbtwtra+fZs18nIrFYvGjRok2bNuXn52vs0wEA4JZQ7EC7VFdXE9Gjj75tbKy5ySeG\nDMxnuRkbthSv61Dyt3yBpH5nkURm5ft/tzuIqVPQ1D0hlqZNeZvVE/PW5s59c/v2svHjl9bV\n1a1du3bOnDma/HQAAPg7FDvQLgqFgohEIg3txKYFuMVT/Dulme/+nHSLJ/nOI++/wXHCmY+F\n3uLZPxtqZqyQaXrOzNbWdfHinS+/fJyIioqKDhw4oOEAAADQFYodaBfVevyOjmbWQTTHffZP\nw6zMcv47+tPjP8q7TNspJEWHPhz6c9EN16gD4+0t73gcARGv7OhQ3HrmT304jhs6dPKIEQ+I\nxeK33vrr7c4AAECTdH8NE/QukydPPnjw4LFjW4cN05fF+JzIZeV/Tm5/c/r5bx5IPO4f6B9q\nbWrUUp+Tdem3JnmnZ+TWdU8+dDfHsbAwoiq60iEJtjBRd+a/SE4+dOXKaSIKDw/X8EcDAEBX\nmLED7TJ//nyBQJCTc6G2tpR1Fs0xtAx/Yev1VYvf8HcyzE3/76nTn13OL+4X+Piy1Vc3LFsl\nursdTBwi3Yho367dao16S99+u1oqbX/ttdd27typ+U8HAICbONWZLwDt8dBDD33//ffPPXcg\nNPQR1lngrnzwwbykpINHjx7FpicAAGxhxg60TltbGxE5OnqyDgJ3RS6XFBUlEZGl5Z0XAgIA\ngFqh2IF2kclkcXFxhoYmrq7+rLPAXUlP/7murmzq1KmRkZGsswAA6DsUO9AuO3bsaG1t9feP\nNjAwZp0F7kpc3H4iWrx4MesgAACANXagTSoqKnx9fTs6xP/+d7qrK24/2gtkZBzdunWmtbV1\nRUWFsTG6OAAAY5ixAy3ywQcftLa2Tpq0Aq2uV+joaNq5cyHP87t27UKrAwDQBih2oEXi4+OJ\naMwYnNTrHXJyLrS1NcyZM2fu3LmsswAAABGKHWgPhUKRnp5uYmLp4uLLOgvclcLCRCIaN24c\n6yAAAPA7FDvQFo2NjWKx2N5+IMfht2XvUFCQSEQhISGsgwAAwO/wExS0RVpaGhHZ27uxDgJ3\nRalUFBenmJqaBgQEsM4CAAC/Q7EDbZGcnExE/fujJfQO5eVXJZK2ESNGiES45TQAgLZAsQNt\nodretrz8CusgcFcKChKIKDQ0lHUQAAD4A4odaAtra2siksk6WAeBu1JcnEJEo0aNYh0EAAD+\ngGIH2qK0tJSIbG37sw4Cd6WoKIWIRo4cyToIAAD8AcUOtIVqqRbPK1kHgTuTStsrKrKdnJxc\nXV1ZZwEAgD+g2IG2cHNzI6KcnAtSaTvrLHAHJSXpSqUC03UAANoGxQ60ha+vb3R0dE1N4dGj\nW1lngTtQLbBDsQMA0DYodqAtOI775JNPOI47fPjfr7025ddfv1UqFaxDwa1hgR0AgHbieJ5n\nnQHgDxYWFm1tbapfCwSmzs7B4eEPT5q0wNjYlG0w6Or55z1v3Ci+ceOGnZ0d6ywAAPAHFDvQ\nIvn5+T4+Pra2/d3chmdlnRWLW1TjHGdoa+sfFPTA9OlP2to6sQ0JbW31S5fau7m5FRUVsc4C\nAAB/gi3jQYts376diMaOXfLgg+uIqKws8+jRLZmZJ1taauvq0k+eTD958g1zczcPj4iQkJnh\n4TNEIgPWkfVRcXEqz/M4DwsAoIUwYwfaoqyszM/PTyqVf/jhtT59HLs+1dRUdfTottTUw7W1\npTd/x3KcYZ8+XsOGzZg58xlHR2y6oTlHjmw6eHDt1q1bV61axToLAAD8CYodaIupU6eeOHFi\n6tQXHnts2z+9RiaTXLiwOynpYGlpent70/+GOZHIxt5+kLd3+IQJC9zd/TUTWG9t2zYrLe2n\n3377bfTo0ayzAADAn6DYgbYYNmzYpUuX3norzc1t+N28vq2t4dSpj2Jj99bWlnS5fpaztPQe\nNmzW5MmLBwzwUV9affbMM86trTeamprMzc1ZZwEAgD9BsQNtsXHjxnXr1nl6Bq9de97AwPie\n3ltcnBIffyAr62xZ2ZWb964wNHQcMCA0NHT2mDFzcVFtT2louP7ss67+/v5XrlxhnQUAAP4K\nxQ60RV1d3ahRo0pKSjZtSnF3H9G9g8hkHT///E5S0vdVVXkKRef/hkWWlh5eXpEREXNHjpwg\nEGD7xu5LSTny3nsPPvHEE19++SXrLAAA8Fe4Kha0hZ2d3eDBg0tKSjiu+8XL0NB0zpw35sx5\ng4guXTp+5syu/Pz41tb6lpa8tLS8tLTPOc7E3j5g+PBpU6Ystrd36bH0egP3nAAA0GYodqBF\nOjo6iMjY2KxHjhYYODUwcCoRicUt5859kZz8/bVrl6XS9hs3kn75JemXX9abmvb38ooaN27B\nyJHRPfKJ+kB1z4kRI7o5pQoAAGqFU7GgRcaMGfPbb7+9+26+k5OXmj6itrbkxIkP0tOP1taW\n3FyNJxRaOjuPDAl5cNKkBaamFmr6aB3A8/xTT9nK5e0tLS1GRkas4wAAwF+h2IEWiY6OPnPm\nzJYt2S4uvur+LKWyMzb26/PnvywpSZPJxP8bFllZ+fj7T5w8eTG2Tfm7mprC55/3GjFiREpK\nCussAABwCzgVC1qkubmZiIyMNHEFq0Agiop6IirqCSIqLk775Zf3r179tamppqkp6+LFrIsX\n3zM0dHR3jxgzZn5ExEyBQKiBSNqvuDiVcB4WAECLYcYOtAXP83369JFKO7/6qu1+rp+4Hx0d\nTSdP7khM/G9FRY5S+ftFtRxn4ug4bPjw6VOnLraxcbz9EXTbN9+sOn783S+++GLx4sWsswAA\nwC2g2IG2KCsrGzBgwIABgZs3Z7DOQkSUknL4zJldBQWJYnHL/8Y4E5N+AweGhoTMioqaY2io\nd4vMNmwYnZsbe/ny5YCAANZZAADgFlDsQFts2LBh/fr1kyevePzxD1hn+ZOamoLjxz/IyDha\nX19+83oLjjO0sfEfNmzalCmL+/YdyDSghiiVin/9y0ogUDY3N4tEWMUBAKCNUOxAK0gkkoED\nB964UbttW676Lom9T0plZ0LCf+Pi9hUWJra1NfxvmDM2du7ff+TIkTPGjn1Ihy+qLS+/+sor\nQyIiImJjY1lnAQCAW8M/u0ErfPPNNzU1NSNGPKC1rY6IBAJReHhMeHgMETU31xw/vi019cfq\n6kKJpCI/vyI//4d9+54yNx/o7h4aGjo7PHyGSGTAOnJPUm1NjCsnAAC0GWbsgD25XO7n51dQ\nULB+fayPTwTrOPdGqVSmpByOi9tXUJDQ3HyD6Pc/UBxn2KePl5dXRETEnKCg8TpwH7Ovvlp+\n+vTH+/bti4mJYZ0FAABuDcUO2Pvwww9Xrlzp5zfutdfOsM5yX2QySWzsnqSkgyUl6e3tjTfH\nOc7Y2trH2zsiImLO8OFjGSa8H2vXjioqSsnPz/fy0t5ZVQAAPYdiB4xlZWVFRUU1NDS+9Vbq\nwIHDWMfpMW1tDefPf5maeqS8/IpY3HpznONMbGx8fXwiIyPnDh3aa6YnOztlS5ZYmpub1tfX\ncxzHOg4AANwaih2wVFlZGRAQUF9fr4UXw/ag5uaas2c/y8g4Wl5+VSptvzkuFJoFBU0ZPDhq\n0KDRrq7+rHbvuxtFRSlr146Kjo4+ffo06ywAAPCPcPEEsHTx4sX6+vqgoFkLFrzHOosa9enj\nOHv267Nnv05EDQ0VZ89+mpFxrKQkTaFoT07+Pjn5eyIyM7P28YkYPHisn9/Y/v0DtK3klZSk\nEtHIkSNZBwEAgNtBsQOW6urqiKh//yHa1mPUx8bGZe7cN0eNmrN69dDg4OB169bFxsbGxsam\npKSkp/+cnv4zEZmb2/j6Rg0ePHbw4LH9+vlpw6nPoqIUQrEDANB6KHbAkmoZfnV1Aesgmpab\nG0tEY8eOnTp16tSpU4lILBYnJiaeO3fu3LlzycnJKSlHUlKOEJGlpb2vb5Svb5Sv75h+/Qaz\nasDY6wQAoFdAsQOW8vPzicjBwZ11EE3Ly4slosjIyJsjJiYmY8eOHTt2LBG1t7fHxcWdO3fu\n/PnzqampSUnfJyV9T0Tm5jZeXmGDBkX6+ER4eIwUCjW0T55U2l5RkePk5OTq6qqZTwQAgO5B\nsQNmmpubN2/eTER+fuNZZ9G03NxYgUAQHh5+y2fNzMwmTpw4ceJEImptbY2Njf3tt98uXryY\nmpqakXE0I+MoERkZmXp5hfr4RPr6jnZ3H2lsbK6+tKWlGUqlAtN1AADaD8UOmHnppZcqKipC\nQx/x99evYldTU9TYWBkYGNinT587vtjCwqLr6dqUlJQLFy7ExsbGx8dfvXrm6tUzRCQQCPv1\n8/PyCvXyCvHwCHZ2HtSzy/KKi1MJ52EBAHoDFDtg49y5c59//rmFhe3jj7/POoum5eVdJKKI\niHvexM7ExGT06NGjR48mos7OzrS0tNjY2Li4uKSkpLKyzLKyzDNndhGRmZm1l1eIl1eol1eo\nh8coExPL+wyMYgcA0Fug2AEDOTk58+bN43n+scfe7dPHkXUcTVMVu64L7LpBJBIFBwcHBwe/\n+OKLRHTt2rWEhITExMTExMSMjIxLl05cunSCiEQiw759fby8Qjw9Q7y8QpydB3Xj8gsUOwCA\n3gIbFIOmlZaWRkZGXr9+feLEZxct2s46DgOrVg2qqsqrqKhwdnZWx/ElEklaWlpiYmJ8fHxi\nYmJlZeXNp0xN+3h6hnh6Bqt6npmZ9R2P1tHR/OSTNv36uZSVlakjLQAA9CAUO9Co6urqyMjI\nwsLCiIjHli3boz/b193U0nJj2TInd3f3wsJCzXxieXn5zcm89PR0qVSqGuc4rm9fH1XD8/QM\n7tfPXyi8xRR+dva5TZvGzZ49+/Dhw5oJDAAA3YZTsaA5TU1NkyZNKiwsDAqatXTpV3rY6ogo\nJ+cCz/P3eR72nri6urq6us6bN4+IZDJZRkaGquQlJCRcu5ZbWZl74cJuIjIyMh04cLiHx0gP\nj1Hu7iMdHT1Ub8d5WACAXgTFDjREqVTOnz8/MzPTz2/cihXf3nJySB+odrBTXQCheYaGhqqV\neStXriSiqqqqxMTEpKSkpKSktLS0vLyLqvV/RGRubuvpGezpGXz16q+EYgcA0EvgVCxoyJo1\nazZv3ty3r/fGjUmmplas4zDz6qvDrl27VFhY6OHhwTrLnygUipycnOTk5JSUlOTk5CtXrsjl\nctVTHMfV1tba2tqyTQgAAHeEYgeacOTIkTlz5hgbm7/5ZkK/fn6s4zDT0dH81FO2jo4OXS9o\n0E4SiSQ9PV01mTdgwIC3336bdSIAALgzPT0dBppUXl7++OOPE3HPPPO1Prc6IsrLu6hUKqKi\nolgHuTNjY+OwsLCwsDDWQQAA4B7o4+p10LCXX365ra1t6tTng4Jmsc7CWG7uBbrvHewAAAD+\nCYodqN2pU6c4TjB79lrWQdjLyblA7K6cAAAAnYdiB2rn7e3N88rm5mrWQRiTSjtKS9NtbGwG\nDx7MOgsAAOgmFDtQuwEDBhBRU5O+F7uCgoTOTllkZKRAgD93AACgFvgBA+rF83xGRgYR2dj0\nY52FMdUCO5yHBQAA9UGxA/U6f/58fn6+h8cfdzLQW7m5LLcmBgAAfYBiB+rV0dFBREqlgueV\nrLOwpFDIi4qSLCwsAgMDWWcBAACdhWIH6jVlypSgoKCSkvTffvuKdRaWSkrSpNKOkJAQkQib\nRwIAgLqg2IF6CQSCDz/8kOO4//73dam0nXUcZnJzLxJRREQE6yAAAKDLUOxA7cLCwh566KGm\npuqjR7ewzsJMXh6KHQAAqB3uFQuakJ+f7+/v39nZuWjRjgkTnmEdR9N4nn/6aQeJpLmpqcnU\n1JR1HAAA0FmYsQNN8Pb2PnTokEgkOnDglaamKtZxNK2yMqe1tW748OFodQAAoFYodqAhM2bM\niImJkUjasrLOsc6iaarzsLhFLAAAqBuKHWiOhYUFEV2/fpV1EE3Ly4sjLLADAAD1Q7EDzZk+\nfbqRkdEvv3wglXawzqJReXkXOY4LCwtjHQQAAHQcih1ozqRJk6ZPny6VdmRmnmSdRXOamqpv\n3Cj29va2t7dnnQUAAHQcih1o1OzZs4koNfUH1kE0Jz8/johCQ0NZBwEAAN2HYgcaNW3aNJFI\nlJl5Un/22cnPjycinIcFAAANQLEDjbKysho5cmRzc43+nI1VzdjhygkAANAAFDvQtGeffZaI\ndu16QqGQs86idlJpR0lJup2d3aBBg1hnAQAA3YdiB5oWExPj4ODQ0lLLOogmFBUlKxTy8PBw\njuNYZwEAAN2HYgeaJpVKa2trra2dhUID1lnULi8vlojCw8NZBwEAAL2AYgeaVlFRwfO8lVVf\n1kE0QXXlBIodAABoBoodaFrfvn0tLS3LyjIlkjbWWdRLqVQUFCQYGxsHBQWxzgIAAHoBxQ40\nzcTExMXFRS6XyGRi1lnUq7z8akdH86hRo4yMjFhnAQAAvYBiB5qmVCqLi4vNzKwtLXX8Tgx5\neRcJ52EBAECDUOxA02pra6VSqa2tK+sgaqfawQ7FDgAANAbFDjTt8OHDRGRnN4B1ELXLy7so\nEAhwzwkAANAYFDvQqOLi4pdffpnjBNOnv8Q6i3rV1pbW15f7+flZW1uzzgIAAPoCxQ406skn\nn2xra5s169VBgyJZZ1Gv3NxYIoqM1PGvCQAAWgXFDjQnNzf37Nmz9vYD58xZzzqL2qm2Jkax\nAwAATUKxA83Zs2cPEUVFPaEf95y4SCh2AACgWSh2oDk5OTlEFBAwiXUQtWtpqa2szHVzc3Nx\ncWGdBQAA9AiKHWhOa2srEZmZWbEOonZ5eRd5nh89ejTrIAAAoF9Q7EBzxGIxERkYGLMOonbY\nmhgAAJhAsQPNUd1ZSy6XsA6idrhyAgAAmECxA82xsLAgovb2RtZB1EsqbS8tvWRvb+/j48M6\nCwAA6BcUO9CcQYMGEVF5+VXWQdSroCBBoZBHRERwHMc6CwAA6BcUO9Acf39/IqqszGUdRL1y\nci4QzsMCAAALKHagOUqlkoh0fhO73NwLRIRLYgEAQPNQ7EBz2tvbicjY2Jx1EDWSy6VFRcmW\nlpaBgYGsswAAgN5BsQMNaW5u3rVrFxFZWfVlnUWNiotTZDJxWFiYUChknQUAAPQOih1oyKpV\nq65cueLvPz4ycgHrLGqE87AAAMAQih1oiOq2EzNmvKLba+xyc2MJxQ4AABhBsQMNCQ0NJaJf\nf93JOogaKZWK/Px4ExOTESNGsM4CAAD6CMUONOSpp55ycHBITf2xpaWWdRZ1uXbtkljcEhwc\nrLrHBgAAgIah2IGGmJqaPvDAAzyvPHz4TdZZ1AU72AEAAFsodqA5b775prW19enTOysqslln\nUQvVLWKxwA4AAFhBsQPNcXJyevHFF3leefq0Dq6043k+NzfWwMBAtZoQAABA81DsQKOWLFli\naGh47tzn165dYp2lh1VUZLe21gUFBZmZmbHOAgAAegrFDjTK0dFxw4YNcrlk+/ZHlEoF6zg9\nKSfnN8ICOwAAYArFDjTt5ZdfDg0NrazMy84+zzpLT1JtTRwVFcU6CAAA6C8UO9A0juMWLlxI\nRAkJ37LO0pNyc2OFQmF4eDjrIAAAoL9Q7ICBuXPnGhgYpKQcVig6WWfpGTU1hY2NlQEBAVZW\nVqyzAACA/kKxAwZsbW1DQ0Pb2hrKyi6zztIz8vLiCAvsAACANRQ7YGPSpElEtG/fizzPs87S\nAwoLE4koJCSEdRAAANBrKHbAxqpVq/z9/bOzz3///XrWWXpAQQGKHQAAsIdiB2wYGRnt3bvX\nwsLiyJGNR49uYR3nvkgkbeXlVxwdHd3c3FhnAQAAvYZiB8wMGzbsxIkTxsbGhw9vkEhaWcfp\nvuLiFKVSgek6AABgDsUOWAoPD587d65E0paQ8B3rLN2nOg+LO4kBAABzKHbA2JIlS4goLm4f\n6yDdhysnAABAS6DYAWMBAQFE1NpaxzpI91VW5rGOAAAAQIRiB8wplUoikkjaW1pqWWfppilT\nVhLRk08+2d7ezjoLAADoNRQ7YMzS0tLMzKy2tuTdd2ezztJN48c/HRg4paCg4MUXX2SdBQAA\n9BqKHTBmaGgYGxvLcdz161mss3QTx3FPPfWFhYXtrl27jh8/zjoOAADoLxQ7YM/GxobneUdH\nd9ZBus/Kqu+SJbt4nl+yZEldXS9eLwgAAL0aih2w5+zsLBKJ6uvLWQe5L6NGzYmMfLy6unrp\n0qWsswAAgJ5CsQP2SktLOzs7TUz6sA5yvxYu/NDObsDhw4f37NnDOgsAAOgjFDtg76233iKi\nsLBHWQe5X6amfZYt28NxghUrVpSWlrKOAwAAegfFDhj74Ycf9uzZY2FhN2nSc6yz9ABf36hp\n015oaWlZuHChaicXAAAAjRG+8cYbrDOA/mptbZ0wYUJHR4dcLq6t84ScFQAAIABJREFULfHw\nGGVmZtX1BVJp+/79Lx05sunbb9eUl18ZPny6QCBklfYuDRoUlZ7+U2ZmsqmpaUREBOs4AACg\nRzie51lnAP1VU1Pj4+PT3NwsEAiUSqW9/cC33840Nra4+YJff9355ZfP3Hw4bNj0F144LBQa\nsAh7D8rLr7z++kiO45OSkgIDA1nHAQAAfYFTscCSo6Njamrq5s2by8vLp0+fXltb+t//vt71\nBfHx3xLRkSNHSkpKvL29MzKOJiYeZBT2Hri6Dpk37y2ZTPbYY49JJBLWcQAAQF+g2AFjnp6e\nq1evdnZ2/uyzz0xNTc+e/azrfWMbGytVv7h48eK4ceOIKCvrLJug92jq1OcHDx6blZW1Zs0a\n1lkAAEBfoNiBtnByclq0aJFMJv744wVVVflE1N7eKBY3E9HcuXMXLFjwySefEJGtrSvjoHeH\n4wRPP73bzMzqgw8+OHPmDOs4AACgF7DGDrRIZWWlt7d3e3u7hYXd6tW/NDRc37btAdVTHCcI\nD4+Jjl7m7R3GNuQ9uXjxm48/XuDq6nr58mVra2vWcQAAQMdhxg60iLOz88GDB+fMmdPaWvfO\nO9PE4tabT/Xt6x0T807vanVEFBHxWEjIvPLy8uXLl7POAgAAug/bnYB28fLymjdvXklJSXJy\nfGtrvVjcIpdLiKi1tc7ZeZCb23DWAe+Zn9/4uLh9KSnx3t7eQ4YMYR0HAAB0GWbsQBu9//77\n/fv3z8290N7eSERhYWFE1HUCrxcxN7d5+undHMctX768vLx33w8XAAC0HIodaCNra2t7e/ub\nD+Pj44lIIOitv139/aMnT17Z1NSE21EAAIBa9daflKDbFArF5cuXzcysJ09eoRrhOM7BwZ1t\nqvvxyCOb+/XzO3fu3LZt21hnAQAAnYViB9qourq6s7PTwcGturqQiExNTXme/+ijx1jn6j4D\nA+Ply78RiQzXrl17+fJl1nEAAEA3odiBNkpNTSUiF5fBmZknhULhO++8Y2VlJZN1VFcXsI7W\nfQMGBM6bt0kqlcbExIjFYtZxAABAB6HYgTY6ePAgEXl7hyuVChcXl+XLl69cuVKh6Ny+/dHO\nThnrdN03bdqqwYPHZmdnr169mnUWAADQQSh2oHViY2P37dtnYWEXEDCRiJRKpUwme+211wID\nA0tK0kpL01kH7D6OEyxbtsfMzGr79u2nTp1iHQcAAHQNih1onV9//ZWIZs1aY2vramnpcP36\n9bCwsGvXrjk5ORGRUGjAOuB9sbV1Xbx4J8/zTzzxRH19Pes4AACgU1DsQOuo1p91dkqFQoON\nG5O8vELT0tKioqKys7OJyNrahXXA+xUa+khExGOVlZVLly5lnQUAAHQKih1onZiYGJFIdOTI\nxrq6Mnv7gevWXQgOnltZWVlWVkZEN24UsQ7YAxYt2m5n1//QoUO7d+9mnQUAAHQHih1oncDA\nwPHjx0ulHQ0N14lIKBQtXrzT0tKeiAQCYW8/Fatiamq1bNlejhOsXLmypKSEdRwAANARKHag\njVxcXIiotbVW9dDCwu61184+99y3O3aUe3iMYhqtx/j6Rk2f/mJLS8uCBQsUCgXrOAAAoAtQ\n7EAbubu7E1Ft7bWbI66u/qGhD1tZ9WUXquc99NDGAQMC4+Li/vOf/7DOAgAAugDFDrRRTk4O\nEfXp48g6iHqJRIbLl39jaGjy5ptvqvZkBgAAuB8odqB1bty48f3335uYWAQGTmGdRe369fN7\n5JHNcrl8wYIFHR0drOMAAEDvhmIHWueHH36QSqXh4fNNTCxZZ9GESZNWBARMzM3Nfemll1hn\nAQCA3g3FDrSOVColIju7AayDaAjHcUuXfmVhYbtz587jx4+zjgMAAL0Yih1oHUdHRyLKzNSj\nO25ZWzsvXvwJz/NLliypq6tjHQcAAHorFDvQOrNnz/b29s7OPpebG8s6i+YEB88dPXrh/7N3\n31FRXI/bwO/ssuzSe1tQUIo0QWNBVCzYsJcIKthiwW7URMWWGOy9R40ldqNGsSsWRBRFpQmi\nghBUQHrvsOX9Y/P6M34TK+zdHZ7P4eQss1Oe9UR8uDNzJysry9/fn3YWAABQVih2oHB4PN60\nadMIIXv3TqyqKqUdR37GjNlqZGQVFBS0b98+2lkAAEApodiBIpo4caKHh8ebN4kPH56mnUV+\n1NS0p0w5xOFwZ82alZLChienAQCAnKHYgSJSU1NbuHAhISQ0dD/tLHJlb+/Rv//8srKykSNH\nikQi2nEAAEDJoNiBgurZs6elpeXz53fi46/TziJXQ4cubdq0dURExPLly2lnAQAAJYNiBwqK\nw+EsW7aMELJt2/CcnL9ox5EfLpc3bdoRPl99xYoVERERtOMAAIAyYaRSKe0MAP/p+++/37p1\nK5+v7uTUjWE4mpr6PXtOa9KkFe1c9e7GjV3790+xtraOjY3V1NSkHQcAAJQDih0oNJFINHPm\nzIMHD7593JaGht6mTS80NQ3oBqtvUql0/foBMTEXx48fv3fvXtpxAABAOeBULCg0FRWVX3/9\nNSsrKyQk5OHDh8OHDy8vL7x+fSftXPWOYZhJk/Zpaxvv27cvKCiIdhwAAFAOGLEDZfLw4UM3\nN7fmzXssWNAgnksRE3Nx/foBBgYGjx8/FgqFtOMAAICiw4gdKBNXV1dVVdXU1KgG8gtJy5b9\nunWbnJeX99133zWQjwwAAF8DxQ6UCZ/Pb968eVlZQU5OQ5m/189vvVBof+3ata1bt9LOAgAA\nig7FDpSJRCIpKChgGIbDUaGdRU74fPVp046oqKgGBATEx8fTjgMAAAoNxQ6UyfXr11NTU21t\n2xsZWdHOIj9NmrQaOvSXqqoqPz+/qqoq2nEAAEBxodiBMvn1118JId26TaIdRN7695/n4NA5\nPj5+wYIFtLMAAIDiQrEDJbBlyxY9PT0fH5/z58/r6Ji0a+dNO5G8MQxnypRDGhq6W7ZsCQ4O\nph0HAAAUFKY7AUW3Zs2agIAA2WsVFdWAgKuOjl3pRqLl/v0/tm0bYWZm9vjxYyMjI9pxAABA\n4WDEDhTd7du3CSHe3oHNmnWcMuVQg211hBB39+EeHqMyMzMnTJhAOwsAACgiFDtQdBKJhBDS\nuvWgn3++4+4+jHYcysaO3W5s3PT8+fO7d++mnQUAABQOih0oOlmxI4ShnEMxqKlpT5t2hMtV\n+eGHHxITE2nHAQAAxYJiB4pOR0eHEFJRUUQ7iKKwtXUfNGhReXm5r69vTU0N7TgAAKBAUOxA\n0cnuEigtzaMdRIEMGrTY1tY9Ojp66dKltLMAAIACQbEDRaeiokIIEYtraQdRIFyuytSph9XU\ntNasWSO7uQQAAICg2IHiS0tLI4QYGDSiHUSxmJhYjx69RSKRjBw5sqCggHYcAABQCCh2oOhk\nraXhPBz203Xu/J2b29D09PTp06fTzgIAAAoBxQ4UXa9evQgh16//SjuIIho/fre+vsXx48eP\nHDlCOwsAANCHJ0+AoisqKrK0tCwpKenXb66v71racRROQkLIypU9tLW1YmNjraysaMcBAACa\nMGIHik5XV/f06dMGBgYXL667fft32nEUjpOTZ9++c4qLi0eNGiUWi2nHAQAAmlDsQAl07979\n5MmTXC7399+npaXF046jcLy9l1tatrh79+6qVatoZwEAAJpQ7EA5eHp6Ll26tKam8vz5NbSz\nKBwejz99+lFVVbXAwMCHDx/SjgMAANTgGjtQGqWlpUKhsKZG/Ouvb9TVdWnHUTjXru04cGC6\njY1NTEyMpqYm7TgAAEABRuxAaWhpaQ0ePLimpjI+/jrtLIqoR4+pLVr0SU5OnjlzJu0sAABA\nB4odKJOuXbsSQuLjb9AOoogYhpk0ab+2tvHvv//+559/0o4DAAAUoNiBMunatSuPxwsJ+S04\neBvtLIpIR8dk8uTfGYbx9/dPT0+nHQcAAOQNxQ6UiZWV1alTpzgcTlDQ8pqaStpxFFGLFn16\n9JhWWFg4atQoiURCOw4AAMgVih0omYEDB3bp0qWkJCc9PYF2FgXl67vWwsIpNDR03bp1tLMA\nAIBcodiB8lFXVyeEMAz+7/13qqpqM2eeUFVVW7x48YMHD2jHAQAA+cE/jaB8VFVVCSHp6U9o\nB1FcFhZOw4atFIlEo0ePLi8vpx0HAADkBMUOlM+kSZMYhjl69MeysgLaWRSXl9f3Li69kpKS\nZs+eTTsLAADICYodKJ+ePXuOHj26pCT3zz9/pp1FcTEMM3ny79raRnv27AkKCqIdBwAA5AFP\nngCllJ2dbWdnV15esXnzXwYGjWjHUVzR0Rc2bBior6//+PFjc3Nz2nEAAKB+YcQOlJKJiUmn\nTp3EYlFJSQ6tDFJxwf3L81b/5DRpguaoMRpTvnfetHfJi8KKf1lTWjH3O1VfX2bq0oNyDvnN\nN/27dZucn58/ZswYzH4CAMB6KHagrEQiESFELBZRObq46vHWAJttR9a9rtRv0XZU53b9zXVq\nI2+tCJzleDez+L2Vy14HZFTXEkKKU+YUiMRyjurnt97c3OHmzZsbN26U86EBAEDOUOxAWbm7\nuxNCrlzZLBLVyPvYUtHx5T0evqnoMyns13V3pvjvnDDlj8WBiZsXrFcRp+1bNk78zwscEo4G\nEUIG93WSigsOP8uUc1g+X3369GM8Hn/RokUxMTFyPjoAAMgTih0oq4kTJ+rq6t6//8dPP7XL\nzEyU56GLEqdd/iu3yYDrIzt7vLvcyHnOHPem1UVnTuUUvV0oFeccep7J1x03cMDPhJCnRync\nx2Bp2cLHZ0VNTY2fn19Fxb+cLAYAAHZAsQNlZWZmFhkZ2b59+5cvY3bt+k6eh47cf5rhaEwd\n7P6/b9mP3unvv7eZhHm7pChpVpFI3KjfHFUtb3dt9bL0BW9qKJw+7tNntrNz92fPnv3www/y\nPzoAAMgHih0oMWtr67CwsCZNmrx4cT8zM0luxz2XXczXGSNUVfnft3ha3bt0Gd/STOftkqgj\nNxmG49PFhhDSr6utVFJ+ODZNblHfYhjOlCkHtbQMdu3adf78efkHAAAAOUCxA+XG5XJHjRpF\nCLlxY6d8jigVZebXilTUOnzKyuKapGOv8gQGc5zV+YQQYa8ZhJDkP47Ub8T/oKcnnDBhDyFk\nwoQJWVlZVDIAAEC9QrEDpTd58mSBQBASsqe0NE8Oh5NKawkhhDAfWY8QQkhB7PdVEonV0Imy\nb/m64101BRXZy1Kq5H7DByGEkDZtBnt6TszNzf3uu+8whyUAAPug2IHSMzMzGzNmTHV1eXDw\nNjkcjsNrrMXliirv/uu7UmllTMyluIS/b+YIOx5BCNHNPnnhwhrZl56mQCqtPRqRKoeo/2rU\nqE1mZnZXr17dunUrrQwAAFBP8OQJYIOUlJRmzZpxuaq9e88aMuRnHo9fr4e7MFv/j9zq1fuK\nG/Hfv8yuqnDbuGkzdW2Dfv1lkKgy/LsJHuJ/+yumZjB73zZqs8qlpkb9/HN7Lpd58OCBq6sr\nrRgAAFDnMGIHbGBtbf3LL78wjOTcuVVLl3aoqCj6+DZfwX1kT6mk4tdTof/7Vur53YQQ68Hf\nEEKy78wTS6V2YxOOHZO+8yVx0RBUFWyOK6+u15Af0KRJKx+f5dXV1b6+vpWVlbRiAABAnUOx\nA5ZYtGhRYmJi8+bNU1OjEhPD6/VYht/83slM9/WV3nuuBb/7lK7MmHVrrz/jqbn7N7cghFw5\nG8cwvJGdbP65NTOsezOpVHrqlvxu4/1fffv+4Ozc/enTp5j9BACATVDsgD0sLS27dOlCCKmp\nqedRKEZtfODF5oZqtw54Tf6h3c690w797r9uqf2P6+eLuOajllzQ4nJqSv8MKSrTEC6zEai+\nt7V5nyWEkPRL6+o35Af9/9lPDDH7CQAAm6DYAXtIpdKwsDBCiK6uaX0fi6fRYd76Z/7e0yxU\n86LC918LPZpaqNq26+Ilm551tzIghGRcXkEIcRzl+7/bqmp9211Ps7r4cHgJzdOgenpCf/+9\nUql0/Pjxb968oZgEAADqCm6eAPY4e/bs4MGDmzT5ZsWKKNpZlMb+/VNv3NjZvXv34OBgDge/\n6QEAKDf8HAf2CAwMJIQMGrSIdhBlMnLkBnNzxxs3bmzcSO0uXQAAqCsodsAeNjY2hJDk5Ie0\ngygTVVW16dOP8Xj8RYsWRUdH044DAABfBadigT1SUlJcXFwqKiq+/fZnW9v2zZv3YJhPej4E\nXL686ciROfb29pGRkRoaGrTjAADAF+IuXbqUdgaAuqGvr9+uXbs///wzLu7G3btHpFKJk1NX\n2qGUg41Nu+TkiISEB7m5uf3796cdBwAAvhCKHbBK06ZNO3bsmJeXl5WVFRd3w97ew9i4Ce1Q\nSoBhGGfn7nfuHL5//46Li4uDgwPtRAAA8CVwjR2wTefOnS9cuLBy5UqpVHrv3nHacZSGrq7p\npEn7GIaZOHFiWloa7TgAAPAlUOyAnSQSCSFET09IO4gyadmyX48e0woKCkaNGiUWi2nHAQCA\nz4ZiB+z0559/EkLs7TvRDqJk/PzWNWrU/Pbt26tWraKdBQAAPhvuigUWunv3roeHh4mJzYYN\nzzkcLu04SiY9PWHx4jYSSW1YWJi7uzvtOAAA8BkwYgcstHz5ckLIwIEL0Oq+gIWF08iRG0Ui\nkZ+fX3FxMe04AADwGVDsgG2SkpKCg4M1NQ08PEbRzqKsunef3Lr1oNTU1ClTptDOAgAAnwHF\nDthGKBQKhcKysvzY2Mu0sygxf/+9+vrmx48fP3ToEO0sAADwqVDsgG00NTVnzJhBCHny5Cbt\nLEpMU9Ng6tTDDMOZPn16SkoK7TgAAPBJUOyAhUJCQgghLVv2ox1EuTk6du3Xb25paenw4cNr\na2tpxwEAgI9DsQO2yc3NvXXrlpaWoZOTJ+0sSs/HZ5m1dZvIyEg8ogYAQCmg2AHbZGVliUQi\nQ0NLLleFdhalx+Xypk07KhBorl69OjQ0lHYcAAD4CBQ7YBvZ1Iw1NRW0g7CEqant2LHbJBLJ\nqFGjCgoKaMcBAIAPQbEDtpkzZw4hpFOnMbSDsEenTmPd3Yelp6dPmDCBdhYAAPgQFDtglbNn\nz968edPMzK5379m0s7DK+PG7jYysgoKCdu3aRTsLAAD8JxQ7YJWnT58SQiorS2JiLtLOwirq\n6jrTph3lclXmzJkj+0MGAAAFhGIHrDJ27Fhra+uioqwtW3wePjxNOw6r2Nm1HzLkp8rKyhEj\nRlRVVdGOAwAA/wLFDlhFKBQmJycfOXJEKpUcOjRLKpXQTsQqAwcutLfvFBcXN3/+fNpZAADg\nX3AxPRWwj4uLy61bt54/j9fSMpRIRJWVpSoqqjyegHYupccwHGfn7mFhB8LDw1q1amVnZ0c7\nEQAA/AMjmxsCgGX2798/fvz4t98yDCMU2tvYtHNw6Ny27bcCgSbFbMru4cPTmzcPNTIyio2N\nFQqFtOMAAMD/QbEDdqqpqVm3bt2rV6+KiooKCwsTExPT0tJkb6mr63TpMn7AgABtbSO6IZXX\nvn2Tb97c3a1bt2vXrnE4uKIDAEBRoNhBQ5GRkREREXH69OnTp0/X1NSoqWkNH766R4+ptHMp\nperqisWL22RkPF21alVAQADtOAAA8DcUO2hwMjMzly9fvmfPntraWjc371atBtjZtTc2bko7\nl5J5/TpuyRI3QsR3795t27Yt7TgAAEAIih00WPfv3x82bJjs/CzDMB4eo5s2bV1dXe7g0NnG\nph3tdMohOHjbwYMzbWxsoqOjtbS0aMcBAAAUO2jA8vLyjh49mpqaevz48ZycHNlChmF69Zox\nbNgqPl+dbjzFJ5VK168fEBNzcfTo0QcPHqQdBwAAUOwACCksLNywYQMhhMvlbt26taioyNi4\nycSJe52cPGlHU3QlJbkBAa5FRZlHjx719fWlHQcAoKFDsQP4h/T09ClTply8eJHHEyxadNPO\nrj3tRIouPv766tVeWlqaMTExTZviUkUAAJowTwHAP1hYWFy4cGHdunW1tVWbNg3Oy3tNO5Gi\na968R9++P5SUlPj5+dXW1tKOAwDQoOHJE8BOUVFRoaGhlpaWfD7/CzZv3759dnZ2ePjtFy8i\nOnUaw+Fw6zwhmzg4dH78+Gp8/EOxWNytWzfacQAAGi6M2AHb3Lx509XVtXXr1n5+fo0aNfrx\nxx/fvHnzBfvZsmVL69atk5Mj9u2bjCsWPkxFRXX69GMCgebq1atv3bpFOw4AQMOFYgds88cf\nf8TFxRFCmjZtXVFRtWHDBgcHh507d35uOVNVVT1x4oSpqWlo6P7k5Ij6Ccsepqa2Y8dul0gk\no0aNKi0tpR0HAKCBQrEDtlm/fr2XlxchJC3tiZvb0A4d/MrKyqdOnWpgYGBnZ3fgwIHKysoZ\nM2b4+PjMmzfvw4N5TZs2/fbbbwkhBQXpckqvzDp1GmNv75GRkZGQkEA7CwBAA6VCOwBAHdPR\n0bl48eIvv/yyYcOG8PBj6uo6bdoMzst79erV48LCwhkzZpiZmW3fvl228rZt28aMGdOjR482\nbdo0btz4f/fm6upKCImPv+7m5i3Xj6GcRKJaQoixsTHtIAAADRSmOwHWysjICAwM3L9/v0gk\nCgy8b2PT7uTJxWfPrhg0aFB+fv6dO3datuz39Omt6upy2fomJiZt27bt0KFD+/bt3dzcVFVV\nCSHp6en29vbl5eXjx+/q1m0S1Q+k6MRi0YQJujweU1RUxOXidhMAAApQ7IDlNm/ePHv2bCMj\nKweHzpmZSS9e3G/RooWJiUlwcLBQaO/uPuz16/jIyLNSqeTdrbS0tAYMGLBv3z4+nx8cHDxg\nwIDaWpGv79ru3afgiRT/JTc39fvvm1pYWKSmpqqo4GwAAAAFKHbAcmKxeOjQoWfPnpV9y+fz\n586dO2LEiKlTp96+ffvD2yYlJdna2hJCTp48OWLECIlEIhTaz5x5onFjl3rPrYSkUumyZZ2f\nP7+zZcuWmTNn0o4DANAQodgB+9XW1l65ckUgEJibmzdr1uztYNLt27fPnTuXmprasWNHQkh6\nevqjR48ePHggEokIIerq6sXFxW9XfvDgwZIlS65fv66qqjZ48GJPT38tLUNan0hhvXwZs2hR\na319veTkZF1dXdpxAAAaHBQ7gH8oKysLCwt78uRJmzZtunbt+u5bEolkzZo1P/30k0gk4vEE\n/frN7dNndmHhGzOzZlwuzjz+bdeusWFhBwMCAlatWkU7CwBAg4NiB/B5EhIStm/ffuTIkbKy\nMi6XJxbX8nh8Y2Prxo2be3iMcXXtxTANehah/Py0OXPsVFSYv/76y9TUlHYcAICGpUH/CwTw\nBZycnHbu3Hnx4kWBQKCpqd6+fXs1NX5GxtP790+sXdtn9WqvBv7LkoFBo27d/CsrKw8cOEA7\nCwBAg4NiB/AlOnfunJaWlpWVFR4eXlxcnJube/To0SZNmsTHX4+MPEs7HWVt2gwhhERGRtIO\nAgDQ4KDYAXwhQ0NDgUDw9rWvr++WLVsIIRcurKGaiz6h0J4Q8vz5c9pBAAAaHBQ7gDrTv39/\nU1PTv/6KrKwsoZ2FJh0dEw0NveTk5OrqatpZAAAaFhQ7gLrk4eEhkYiTku7RDkKZo2OX6urq\n8+fP0w4CANCwoNgB1CVHR0dCSH7+a9pBKGvf3pcQcu7cOdpBAAAaFhQ7gLpUXFxMCCGEoZyD\nNtkj2vLy8mpra2lnAQBoQFDsAOrM7du3ZfdPGBo2pp2FsoqKYkJIcHDwhAkTGvj8LwAA8oRi\nB1BnjIyMpFIpn6+Rnp4gWyIS1WRkPBWJaugGk7/OncfOmvWnvr75oUOHFi1aRDsOAEBDgSdP\nANSl8ePHHzhwQCKRODp2IYRJSgoXiWpsbd0XLAgWCLRop5O3V69iAwM7V1aWLFu2bPHixbTj\nAACwH4odQB178ODBsGHDXr16RQjR1dXV0tJKS0vr2HHk1KmHaUejIDHx7urVXtXV5WfOnBk8\neDDtOAAALIdiB1D3RCJRSEiItrZ2mzZtiouLnZycsrKy5s+/4urqRTsaBY8endm06Vt3d/d7\n9xr6LDAAAPUN19gB1D0VFZWePXu2a9eOy+Xq6+tv3bqVELJv36SSklza0ShQUVElhOTk5NAO\nAgDAfih20KBVVFTcvHnza6Zbq6ysLCwsLCws/MA63t7ePj4+eXmvN2/+trq64ouPpXSqqkqD\ngpavXz+AEOLm5kY7DgAA++FULDRcCQkJbm5u5eXlhJDvv/9+06ZNDPN5889dv369f//+sgdn\nde7c+erVq2+fHvue8vJyDw+PmJgYc3OH6dOPW1q6fn1+hSUS1Tx9euvy5Y3x8TekUomGhsZv\nv/02bNgwLpdLOxoAAMthxA4aLqlUWl5eLitzW7Zs+fnnnz93D3w+X9bqBAKt27dvT548+b/W\n1NDQuHLlSvfu3TMyni1b1jk39+VXBFdod+4cnjLFZPVqr7i4a8bGRoMHDw4NDfX19UWrAwCQ\nAxQ7aLicnZ3btWv3dtD69evPfg5Yp06devbsSQhp2bKPrq7ZwYMHZZfT/SsTE5Pg4OCpU6dW\nVBTv3DlGIhF/cXKFVVtbtX//5Orqst69ex88eDAtLe3MmTOtW7emnQsAoKFAsYMG7fLly3Pn\nzlVTUzM0NBw3btwX7GHv3r26uroREacGD17M4/F/+OGH0NDQ/1qZw+Fs3LjR1dX1+fOwCxfW\nfHluRRUaur+6uqJv376XL18ePXo0j8ejnQgAoGHBNXYApKqq6r+ujfsUixcvXrFiRatWAwQC\nrfDwo0ZGRtHR0RYWFv+1fkJCQuvWrSUSZtmyh40aOX/xcRXNpUsbjh2bx+EwoaGhHTt2pB0H\nAKAhwogdAPmaVkcI6dSpE4fDiYo6Hx5+lBCSm5t7586dD6zv5OQ0ZMiQmprKhQtbPnx4+msO\nrTjOnVt59OiPfL7qsWPH0OoAAGhBsQP4Wj179kxNTd2+fbt7ZnI6AAAgAElEQVRslG7o0KE+\nPj4f3uTAgQMrVqwQi0XHjweIxSK5xKxfMTGXCSHr1q376GcHAID6g2IHUAcaN248bdq0yMjI\no0ePHj169KN3gPJ4vIULF3p6emZnJ2/ePFQkqpFPzvrj6tqLEFJTo/QfBABAqaHYAdQZExMT\nX19fVVXVT1x/9+7d1tbWUVHnLl3aUK/B5OD+/ROEENwACwBAF26eAKDp2bNnrq6uXC5//frn\n+vrmtON8uYkT9UWiiqqqKtpBAAAaNIzYAdDk4OAwffr0qqqy48fn087yVfh89erqaolEQjsI\nAECDhmIH8NnOnDnj4uJiYGDw5MmTr9/bzz//bGRkdO/e8aysF1+/NyqkUqlIVEsIEYtZOOsy\nAIASQbED+Gxnz56Nj48vKChYsGDB1+9NR0dn+vTpUqnkypXNX783Kq5e3VJSkuPm5oYZiQEA\n6EKxA/hsgwYNkr24ePFiSEjI1+9wypQpAoEgLOxgWVnB1+9N/u7cOUQI+cDj1AAAQD5Q7AA+\nW58+fbS1tWWvZ8yYUVtb+5U7NDIyGjFiRHV1+aNHZ746nbyJxbVpafFGRkZt27alnQUAoKFD\nsQP4bAKBYOrUqbLXT58+rZORKm9vb0JIVNT5r9+VnMXH3xCLRR94hBoAAMgNih3Al1i0aJFQ\nKJS9XrJkydOnT79yh56enurq6s+e3VauGYjOnVu1bl0/Qki/fv1oZwEAABQ7gC+iqam5du1a\n2evKysqRI0d+5UMX+Hy+vb19ZWVJfv7rughY72prq6Kizp88uUhDQ/3gwYOBgYG0EwEAAIod\nwJfy8/MbPny47HVMTExwcPBX7tDe3p4QohSTnixb1mXMGLUNGwZKpdL9+/ePHj2adiIAACCE\nEBXaAQCU2N69e3k8nlgsbtasWdeuXb9yb5qamoSQmprKuohWvzIzkwghTk5OXl5esqsDAQBA\nEaDYAXw5DQ2NQ4cO1dXeVFRUCCESiRLM8cvlqjAMExERISujAACgIHAqFkBRyB7boPg3T8TF\nXcvPT3NyckKrAwBQNCh2AAohPDz8999/J4RYWDjSzvIRsuG65OTkhIQE2lkAAOAfUOwAFEJE\nRERNTU3z5j3MzJrRzvIRTk6ezZv3rKqqevPmDe0sAADwDyh2AAqhQ4cOhBCR6KvmTJGb7OwU\nQkjr1q1pBwEAgH9AsQNQCHl5eYQQQ0NL2kE+7uXLmJycvxo3bqynp0c7CwAA/AOKHYBCkF2v\n9vJldFLSPdpZPuLUqSVSqWTOnDm0gwAAwPtQ7AAUgqqqKiEkLe3JunV9y8oKaMf5EDU1bUKI\npaUSDC4CADQ0KHYACmHs2LEbNmzo0aNHeXnR48dXaMf5EGfnboSQYcOGCYXCMWPGPHnyhHYi\nAAD4G4odgELQ09ObM2eOr68vIeTVq8e043xIu3bDunadIBDoZmZmHjp0qEuXLtXV1bRDAQAA\nISh2AAqlpqaGEFJUlPnq1eOioizFnKxYINCcOHHPrl3Z+/YVOzh0zs/PDwkJoR0KAAAIwSPF\nABSKbOjr7t0jd+8eIYRwuSra2sZ6ekJdXbO3/9XTM9PVNdPRMdXRMeFyaf4VVlPTtrf3ePbs\nNia0AwBQECh2AArE19c3Pz//5cuX2dnZGRkZOTk52dlvCgv/vTYxDKOjY6Ktbayvb6Gtbayv\nb66jY6KnJ9TVNdXVNdPVNVNVVav/yAwhpLS0tP4PBAAAH4diB6BADAwMli5d+u6S2tranJyc\n9PT0rKys9PR0WeHLzs7OzMzMzMzMyckpKsp6/TruX/emrq6jpyeUNT8dHWM9PXMdHRNdXTNZ\n89PU1P/6wBKJiBDC4eCiDgAAhcAo5kU8APApJBJJdnb227YnG+RLT0/Pycl58+ZNVlZWVVXV\nf23L4/F1dEz09My1tY0NDCz+/znfv0f7tLWNP3qeNyzs4N69/mJxbXx8vJOTU11/OAAA+Gwo\ndgBsVlRU9ObNm+zsbNl/Zc3v7ZhfYWHhf234znlec21tY9k4n5aWUXj4ETOzZrq6ppmZSbdv\n/87lcrdt2zZ58mR5figAAPgvKHYADVdVVVVWVta/dj7ZeV6xWPyBzfX09I4dO+bl5SW3wAAA\n8GEodgDw7yQSSU5Ojmy07+25XS6X26RJk4qKCg6H4+Pjg+dPAAAoFBQ7AAAAAJbAvWwAAAAA\nLIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMAS\nKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFi\nBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYA\nAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAA\nAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAA\nLIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMAS\nKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFi\nBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYA\nAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAAAMASKHYAAAAALIFiBwAA\nAMASKHYAAAAALIFiBwAAAMASKHYAUPdSUlK8vLzOnz9POwgAQMOiQjsAALBNbm5up06d3rx5\nEx8fHx0dHRAQIBAIaIcCAGgQGKlUSjsDALDKxIkT9+7dq6trWlSURQgxNzf38/Nr3bq1mppa\nv379aKcDAGAzFDsAqEtRUVFt27ZVV9fduDEpMvLc3r3+UqlUKpXI3l25cuWCBQvoJgQAYDFc\nYwcAdUYkEvn7+0skkqFDAzU1Dbp0Gbd48S0+X50QwjAcPl994cKFQUFBspUrKipu3bqVk5ND\nNTIAAKug2AHAF5JKpeXl5W+/FYvFEydOjI6OtrZu2737ZEJIZmbismVdqqrKCCHNm3cfMGAB\nIeT58+e//fbbkCFD7OzsPD09LSwsTE1N+/TpExYWRuuDAACwBm6eAIAvERwcvGjRori4uKtX\nr/J4vIiIiKCgoPv37+vpCadNO8LhcAkh+fnpb0/C9ugxrbg4ixCyY8eOzMxMiURCCLGxaZed\nnZyfX3jlypV79+7l5eWpqOCHEgDAl8PPUAD4bJs3b549e7bsdbdu3d4ub9So+Zw5QSYm1rJv\nbWzaGhlZ5ea+NDKycnDonJ2dzOWqZGRkEEJGjFjTseNIPT0hIeTChbXHj893cHCo11ZXWlqa\nn59vZWVVf4cAAKAON08AwOe5du1anz59OBze+PE737xJTEgI4fM1XFx6NmrU3NXVSzZW95ZY\nLHrz5plQ6MDlqhBCqqvLU1IevXoV6+X1PcMwsnVWruz+5MlNFxeXiRMndunSxdnZ+e3mOTk5\n06ZNe/z48Zs3bzp37uzj4yMUCnv06PFZgRMTEzdt2hQUFJSTk+Pu7j5o0CB/f39dXd2v/pMA\nAFA4KHYA8BlSUlLatm1bUFAwZcohD49RdbLPGzd2/v77dNlJW6FQmJaWtmrVqgMHDrx586ZR\no0aJiYmEEB5PUFtbJVu/V69eQqFw1KhRXbt2fW9XSUlJjRs3fnfavLNnz44YMaKqqooQoq6u\nW1FRRAjR19dfs2aNr6+vurp6nXwEAAAFgWIHAJ8qPj6+d+/eGRkZXl7fjx69uQ73XFFRlJAQ\nsmnTt4QQQ0PDvLw8QgiXqyIWiywsnGbPPmNs3CQ0dP/LlzEhIXtkFZDD4SxZsuTx48d6enp3\n795NTk7W1NQsKytzdHQ8fPhwy5YtCSHTp0/fuXOnVCodOHBh9+6T9fSEKSmPrl//9c6dQ4QQ\nAwMDDw+PcePG9e/fvw4/CwAARSh2APBJrl+/7uPjU1RU5OExatKk39875VonNm8e+tdfj/Ly\nXvP5GosX31JRUX31KrZdOx9VVbW365w5E5iaGm1mZnvx4vp3t1VX15VIRLW1VWKxiGEYFxcX\nQsjjx4+1tAzGjt3h7j7s3ZXDwg5GRZ2PijonkYgJIQYGBkKhcO3atV5eXnX+oQAA5AnFDgD+\nXW5uro+PT0xMTN++fTMzM2/dukUI6d9/3vDhq99eHlcfXr16zDBM48YuH1hHKpVGRgZlZ/9V\nUJCWn582aNDiJk2+kUqlNTWVoaH7rlzZnJPzFyGEz1efO/eio+P7Z2xlKitL4uKuHT8+Pzf3\npVQq6dat240bN+rlIwEAyAuKHQD8i6SkpF69er18+fLtEmPjpkOH/tKx40h6oT5Dbm5qeXmR\npaUrw3x8tk6xuHb8eB0+X6WwsJDLrfuRSAAAucF0JwDwvqqqKm9v75cvX7q5eY8cuSEtLZ4Q\npnnzHrI7W5WCkVETI6NPXZnL5TVt2ub587AnT564urrWZy4AgPqlND+mAUBuli5dGhcX5+DQ\necaM4xwO18CgEe1E9c7W1v3587B79+6h2AGAUsMjxQDgH2JjYzds2MDna0yefKA+7pBQTHZ2\n7oSQ+/fv0w4CAPBVMGIHAP+noqJi5MiRIpFo+PC1RkZWtOPIj60tih0AsAFG7ADg/2zYsCEh\nIcHJybN37+9pZ5ErbW1jExPrlJSUnJwc2lkAAL4cih0A/E0qle7du5dhmHHjdn7KzaQsY2vr\nLpVKIyIiaAcBAPhyDe5nNwD8l+jo6NevX1tbtzUzs6OdhQKcjQUAFkCxA4C/xcTEEEKcnDxp\nB6HDzq49IeTevXu0gwAAfDkUOwD4W1paGiGkQd0z8a5GjZqrqWk9evSotraWdhYAgC+EYgcA\nf3v48CEhxNTUlnYQOjgcbtOmbSorKx8/fkw7CwDAF0KxAwBCCImPj79x44aWlmGzZh1pZ6EG\nl9kBgLJDsQMAUllZOWLECJFI1K/fXC6XRzsONXZ2HQgh4eHhtIMAAHwhFDuAhq6iomL48OGy\n6ev69fuRdhya7OzcGYZz9+5d2kEAAL4Qih1AgxAZGXnjxo2ioqJ3F5aUlISHh3fu3Pn8+fMm\nJtbTph1pgNPXvUtdXbdx4+YZGRl//fUX7SwAAF8CjxQDYL+qqqqOHTtWV1dzOBw7OzsNDY2y\nsrKMjIyysjLZCtbWbefOvaCtbUw3pyJo1szj1avHd+/ebdq0Ke0sAACfDcUOgP1ycnKqq6vV\n1XUFAs3nz5/LFqqqqpmbO2po6HbqNLZz5++4XPw0IISQZs06Xru2/e7du6NHj6adBQDgs+FH\nOQD7yU4sOjl5zp59uqQkl8PhcjgcdXVd2rkUkeym4Dt37tAOAgDwJVDsANjvxo0b5P/P5aGt\nbUQ7jkLT1zc3Nm6amJiYm5trZIQ/KwBQMg36QmmAhqC2tvbkyZOEkFat+tPOohyaNesolUpx\nbywAKCMUOwDWkkql27dvNzExefHihZVVSzOzZrQTKQd7ew9CCIodACgjnIoFYK3Lly/PmDGD\nEMIwjLd3IO04SgOX2QGA8sKIHQBrdejQYcaMGaamplKp9OrVrVKphHYi5WBm1kxb2zgmJubt\ndDAAAMoCxQ6AtXR1dbdu3ZqQkODg4BAffz029jLtRMqBYZhmzTqIRKKIiAjaWQAAPg+KHQDL\n6evrBwQEEEJ+/31aVNR52nGUg+xsLC6zAwClg2IHwH4jRowYMmRIXt7rjRsHnT27gnYcJdCs\nmQfBZXYAoIRQ7ADYj8fjnT59+syZM5qamqdOLYmPv047kaKzsmopEGg+ePCgtraWdhYAgM+A\nYgfQUAwePHj37t1SqXTXrrGlpXm04yg0LlfFxqZdeXl5dHQ07SwAAJ8BxQ6gARkxYoSfn19h\n4Zs9eybSzqLocJkdACgjFDuAhmXHjh1WVlaRkWevXt1KO4tCwzTFAKCMUOwAGhYdHZ0jR47w\neLzDh2fduXOYdhzFZWPjxuXy7t69K5VKaWcBAPhUKHYADU6HDh1OnTrF5XIPHJiWl/eadhwF\nxedrNGnyTV5e3vPnz2lnAQD4VCh2AA3RwIEDp0+fXllZeufOQdpZFBeeLQYASgfFDqCBGjly\nJCEkLu4a7SCKC5fZAYDSQbEDaKBatmypqan58mUMriH7L3Z2HRiGwYgdACgRFDuABorD4VhZ\nWVVXl5eW5tLOoqC0tAyFQvuXL1+mpaXRzgIA8ElQ7AAaLisrK0II7p/4ANmzxXA2FgCUBYod\nQMOlo6NDCLlyZVNa2hPaWRQUpikGAOWCYgfQcA0ZMkRNTS08/Nj8+c1Xr+714MGpgoIM2qEU\ni+z+CVxmBwDKgsF10wANWW5u7v79+3fv3p2amkoI4fH4a9bEm5ra0s6lQGbMaFxYmJGXl6en\np0c7CwDAR2DEDqBBMzIymj9//tOnTydPnkwIkUjEtBMpnGbNOkokkvDwcNpBAAA+DsUOAIhA\nIOjUqRMhxM3NG8N178FldgCgRFDsAIAQQrp27cowTETEyUOHZkmlEtpxFIi9fSdCyO3bt2kH\nAQD4OBQ7gIYiPz9/586d/fv319bW5vP5+vr6rVq1unz5suxdU1PTDRs26OhoX7265fHjq3Sj\nKhQLCydtbaPIyMiSkhLaWQAAPgI3TwCwX0hIyNatW69cuVJTU0MIUVFR5fM1qqvLRaIaHo9X\nUVGhoqIiW/PQoUNjxoxp2rR1YGAEh8OlmlqBbN06LCLi5IULF/r160c7CwDAh2DEDoDN7ty5\n06VLl27dup07d47HU/f09F+48Pq+fcV79hQ4OnYhhMyZM+dtqyOE+Pn5tWnT5q+/ImNiLlEL\nrXicnDwJISEhIbSDAAB8hMrHVwEAJfTixYs5c+ZcvHiREGJmZjdo0OJ27bx5PIHs3aysF3Fx\n1ywtLZcuXfruVlwu19nZ+dGjR/v2TY6Judi//zwTExv5h1c0KHYAoCwwYgfANiUlJXPnznV2\ndr548aKhoeXkyQfWrk3w8Bj1ttURQkpL8wghtra2AoHgvc3j4+MJIUVFmSEhewICWsTFXZNn\neMVkampraNg4Li4uNxfP1QUAhYZiB8Aq165dc3R0XL9+PcPwvL0D169/1qnTGC73/bH5Bw/+\nJIS4uLj87x42btw4Y8YMDodDCKmuLg8KWiaH2IrP0dFTKpWGhobSDgIA8CEodgAsUVZWNmPG\nDC8vr4yMDHf3YRs2PB88eImqqtq/riwUNiOE3Lhxw8/Pb/fu3Zs3b965c6dIJCosLGzRosWL\nFy8kkr9nPBGJquX3GRQYzsYCgFLAXbEASq+8vPzw4cO//PJLVlaWpqb+uHE727Xz+dgmhT/+\n6FBcnP3uQlNT05KSEoZhysvLTUysp08/Xl1dbmfXXkVFtT7jK4eCgozp0y3s7OwSExNpZwEA\n+E8odgDKbc2aNcuXLy8rK2MYpl07n5EjN+rpCT9lw4yMZ6mpUWpqWvHx13V0TK9f31FUlKWi\noioWi6RSSUDAVReXXvUdXrn88IN9Zmbi69evGzVqRDsLAMC/Q7EDUGInTpwYPnw4jydo02Zw\n796zrK3bfvGupFJpeXmBSFRTVJSVmZno7j68DnN+coaKeeN0M6prde0O/Lp0zHvvpv7RYtH5\nx4O2FvsYar+7PO3O9AW7fhWYei9fddRUtR7v9N+/f+qNGzsPHDgwZsz72QAAFASusQNQYsXF\nxYSQZs06TJy452taHSGEYRhNTQNdXTMrq5ZUWh0hpOx1QEZ1LSGkOGVOgUj8KZtk3v9x0a5f\nBcZDAlfWb6sjuMwOAJQBih2AEuvZs6ehoeGTJze3bPGWSD6pCSmyhKNBhJDBfZ2k4oLDzzI/\nun5O1JIF2zfyDAf8vPq4kF/vs3I6OnZhGA6KHQAoMhQ7ACVmZWX15MkTBweH2Ngr+/dPych4\nRjvRl5OKcw49z+Trjhs44GdCyNOjQR9ePz9uRcCmlRyDPj+tOdWIz5NDQi0tw8aNXdLT05OS\nkuRwOACAL4BiB6DcTExMTp8+raWlFRKyZ+5cx9WreyUm3hWLa2nn+mxFSbOKROJG/eaoanm7\na6uXpS94UyP6z5WfbZi/7iei22PJmjOWAnm0OhmcjQUABYdiB6D0HBwcYmNjAwICrK2t4+Ku\n/fKLxw8/2BcUZNDO9XmijtxkGI5PFxtCSL+utlJJ+eHYtH9dsyR5R8DK+dXcpovWnmuiJtep\nWFDsAEDBodgBsEHTpk1XrVqVkJCwevVqXV3dnJy/bt7cRTvUZxDXJB17lScwmOOszieECHvN\nIIQk/3Hkf9csS923YNn35TyOuCb5wV/5cs7p4NCJy+XdunXr7QTOAAAKBcUOgD169uy5fv36\n8vJyNTUtD4/RtON8hoLY76skEquhE2Xf8nXHu2oKKrKXpVTVvLdmyOYfaoWj12++ZcxTubqx\nb0b1f56urQ8CgZa1dZu8vDzZE3UBABQNih0AS0il0uTk5Ly8PImEDBq02NTUlnaizxB2PIIQ\nopt98sKFNbIvPU2BVFp7NCL1vTXVG41aGbjHRLvDoqmjRFWxqzdvl3NUnI0FAEWGYgfAEgzD\nzJ49mxDSokWf/v3n0Y7zGUSV4Wdzigkh94OWHD8eIPsKzSoihLw6vfu9lT1/2GrI4xJCjNz2\n+zqb5z+evefhS3mmRbEDAEWGYgfAHt99952FhUVU1LkHD/6kneUzZN+ZJ5ZK7cYmHDsmfedL\n4qIhqCrYHFde/e7KHIZ5+7r3D5fM+bywX7snV75/xrb+2Nq6q6qqhYWFiURyPQsMAPApUOwA\n2MPAwCAgIIAQEhFxknaWz3DlbBzD8EZ2svnnYmZY92ZSqfTUrf+cNI7Ldw2YOUlck7JhzQq5\nPRuRxxPY2bUvKSl59OiRvI4JAPCpUOwAWCU6OpoQ4uLS8yv38/TpreXLu8bEXKqLUB9SU/pn\nSFGZhnCZjeD9iUvM+ywhhKRfWveBzQ1abhvXyrI4KXBrqPwmZ8bZWABQWCh2AKyirq5OCFFR\n+fLZ3V6/jgsJ+W39+gFPn4Zu2eKdnBxRd+n+RcblFYQQx1G+//uWqta33fU0q4sPh5dUfmAP\nXWcENxGoPtrvGVf6odXqEIodACgsRiqV2xkMAKh3f/75p7e3t5aWYe/es7p0Ga+ra/rp28bG\nXnnw4FRY2EGpVEIIcXJySkhIsLV1/+WXe/WWVymJxSJ/fwOptKawsFAgENCOAwDwf1DsANhm\nypQpu3fvlkqlKiqqbm7eXl7fW1u3IYQkJ0fcvn2gpCRXT8+spqbSzc3b1dXr7VYPHpzassWH\nECIQCHr16mVhYREYGOji4pKRkfHbb/mamvrUPo9CWreuf0zMxZs3b3p6etLOAgDwf1DsAFgo\nMTFx586dBw4cKC4uJoS0aNFHIhHHxQW/t5pseWFhhqNj12vXtkul0sDAwHHjxr169erMmTNO\nTk5TpkwRiSQHDpRzufJ7HqtSuHx505EjcxYtWrR8+XLaWQAA/g+KHQBrlZWVHT58ePXq1a9f\nvyaEWFlZzZs3z9nZ+cWLFyoqKoGBgSkpKW9X1tXV3bp166hRo6qqqoRCYWFhISGEYZjRo7f0\n6jWD2mdQVK9ePV6woIW7u/u9ezhPDQAKBMUOgOUqKyuDgoK0tbV79OjB5/PfLk9OTnZ2dq6u\n/nuWuMWLFy9btowQEhsb27JlS0KIrq7pxIl7W7bsSyW2gpNKpVOmmFRUFBYUFGhpadGOAwDw\nN9wVC0BZenp669atBw8eXFZWVh/7V1NT8/X17dev37utjhBiY2Ozbt26Pn36EELU1dUHDRr0\ndvmgQYN4PF55eZFQ2Kw+IrEAwzCOjl1FIlFYWBjtLAAA/wfFDoCylStXRkVFnT17Vv7PlZ8x\nY8alS5cOHToUHh7eqlUr2UJNTc2goKCFCxfW1lbt2zdFzpGUCCY9AQAFhGIHQNmDBw9kL3bv\n3l1eXl5TU/P777//9NNPsbGx8gkwatSoFi1avLdwwYIFZmZmT57cKC8vlE8MpYNiBwAKCNfY\nAdD07NkzR0dHfX1zkai2pCTH0tKSz+cnJSURQgQCQWxsbLNm1E6GtmrVKjo6+tdfMz9rMrwG\nZeZMq/z81zk5OYaGhrSzyElVVdXDhw/t7e1FIpGJiQmXy6WdCAD+ASN2ADRFRUURQtq2/XbV\nqphWrQa8evUqKSnJycnTw2NUVVXVd999RzGbvr4+IaSw8A3FDArO0bGLVCq9desW7SDyUFFR\nceDAgdatW3fu3Nnc3Nzc3NzExMTAwGD06NE5OTm00wHA31DsAGgyNTUlhKSmRickhBQX53C5\nKj17Tl+06OaECb/xePzExESK2dq1a0cISUjAqcb/1HDOxgYFBQmFwu+++y4hIcHS0pXD4XE4\n3KKikoKCgsOHD3/zzTdvrygAALpwKhaAptLS0m+++SY5OfndhZ6e/uPH75wzp1l2dnLPnj03\nbNjg7Ows/2x379718PBwcekZEPD+zMYgU1CQPn16Izs7O7oVvL5JpVJDQ8PCwiI3t6Fdu05w\ndu6em5taWppnZtasqqr0+PGA8PCjFhYWL1++xJlZAOowYgdAk5aW1u3bt93c3CwsLC5dunTl\nyhUTE5OQkN/++GPBpEn79PSE165dGzp06Llz5yor5fSE+7eMjY0JIWVlBXI+rhLR17cwM7NL\nSkpKT0+nnaUezZ8/v6CgwNbWfebME82b92AYxti4qbV1W3V1HX19i2nTjjg6dklPT79+/Trt\npACAYgdAm1AojIiISEtL69Onj5eXV2hoqIaGRnDwtkaNmm/d+rJFi96JiYmDBg0yNDScNGlS\nbm5u3R5dIpEsXrzYxsamb9++IpHo3bfmzZtHCHFy6kZJuFcAACAASURBVFa3R2QZNp2NPXHi\nhIODg7Oz83sz72zfvl1FRXXUqE3/taGVVUtCSGpqar1HBICPQbEDUCz29va9e/euqalcvdqr\nrKxgzpyz/v77mjT5prZW8ttvv/Xr169uD3fp0qUVK1akpKRcvnx51qxZ5eXlsuUnT548d+6c\nkZHVkCFL6vaILMOaYhcVFfXLL788f/48ISHhvQfgamtrSyRiDuff/72ora2OjDxHCPH09JRH\nUAD4IBQ7AIUzdepUJyenlJSHO3b4hYUdPHlycWpqNMMwhBA7O7u6PZaHh0eHDh1kr3fs2NGt\nWzcfHx8/Pz9/f3+GYcaP38Xna9TtEVnG0bErw3CUvdgtW7asdevWz549k307cODAd9+dN2+e\nRCIODOx88uTi6uqK97bNyfkrJ+cvJycnilPzAMBbuHkCQBFVVla6urq+ePGCEMIwjLm5eXp6\nur6+fkxMTOPGjev2WAkJCc7Ozjwen8NRqa7+e8SOYZi+fX/09V1bt8dipQULWr56FZuUlGRr\na0s7y5d4/vy5g4MDIURFRZUQIhLVREZGvn0SCSFEKpXOmzdv27Zt1dXVxsZNZs06LTv3KlNR\nUTxhgi7r7yABUBYYsQNQRGpqau3bt5e9PnHiRFJS0pEjR6Kior641d2+fdvLy0tdXd3T0/PG\njRtvf6OTSCQLFiwghPTt++PSpeFz514IDLy/cOH1HTsy0Oo+kbKfjX38+LHshUhUIxLVuLq6\nNmrU6N0VGIZZt27d8+fP+/Xrl5OTumpVjxs3dubnp8nejYwMkq0j59gA8K8wYgegoM6cOTNi\nxAgbG5uHDx9qaHzV+dCQkJDevXvX1NRwuTyxuJYQsmHDhjlz5lRVVXXv3j08PNzExHrFiih1\ndZ06yt6wxMRcWreun4+Pz4kTJ2hn+RLbt2+fMWMGIUQoFF67ds3JyekDK8+aNWvLli2EEIZh\nrK3bGhlZ3b9/gsvl/vbbb+PGjZNTYgD4byh2AIorIyNDT09PXV39a3YiFottbGxevnzp67uu\nR48pt27tPXx4tlQq3bFjR0ZGxsqVK/X0hIsW3RQK7esqdkNTVVU6caK+vr5edna2Mg5cZWdn\nt2jRIisra+rUqTt27PjwylKp9Ny5c7du3Tp79uzr168JIQYGBkeOHPHy8pJLWAD4CBQ7AJY7\nevToyJEjHR27Ll7897nCsLADe/ZMFItFhBCBQHPRohBr6zZUMyq9n39u/+LF/djYWFdXV9pZ\nvkRGRsb+/fvHjRtnbm7+iZtIpdJHjx7dvXvX29v7vVO3AEARd+nSpbQzAEB9kUgk3377bWFh\nob//PmPjJrKFlpYtdHRMsrJeWFm1nDhxj62tO92QLJCf//rZs9tNmjR5e4uxctHW1u7cubO2\ntvanbyK7p8fd3V1HB2fwARQIRuwA2Ez2WDA7u/ZLl4bTzsJmSUnhS5d29PT0vHnzJu0sANCg\n4a5YADZLSkoihDg4dKYdhOWsrd00NHTDw8PfzvAMAEAFih0AaxUVFa1cuZIQUltbTTsLy3G5\nKk5O3aqrq0NDQ2lnAYAGDcUOgLV27NiRkpLi4NC5d+9ZtLOwn4tLL0JIcHAw7SAA0KCh2AGw\nU2xs7Nq1axmGGTt2m4EBblqsdyh29erNmzcPHjygnQJACaDYAbBQVVXV8OHDS0pKBg9e0qhR\nc9pxGgRDw8ZCoX1SUlJqairtLKxSU1Pz888/N2nSpF27drK5kQHgA1DsAFjop59+SkxMbN68\nx7ffLqWdpQGRDdpdu3aNdhBW2bBhQ2BgICFcLpc3f/78uLg42okAFBqmOwFgm+Dg4D59+vD5\nGqtXxxkZWdGO04DExl5Zu7bP4MGDz5w5QzuLEsvOzj527FhNTY2Ojg6Xy50zZ05FReXy5Y/i\n468dPx7wzTffPHjwQEVFhXZMAAWFvxsArFJZWTlu3DiJRDJu3C60OjlzcOjM4wlCQkJqa2t5\nPB7tOMpq+/bty5cvf3fJsGErrKxaWlq6Pnp0Njo6YtOmTXPnzqUVD0DB4VQsAKucOXPmzZs3\nrVsP6tDBl3aWBofPV7e39yguLo6IiKCdRYn5+/sbGxsTQuzsOnh5zZwwYffAgQsJIQzDmThx\nj4qK6pIlS+7cuUM7JoCCQrEDYJXc3FxCCJ79Sosc7o0tLS0ViUT1t3/qGjVqtH37dkKIjo7x\n6NFbPD3933nL2c9vfXV19bfffltTU0MvI4DiQrEDYInS0lJ/f3/ZjMTPnt2mHaeBcnHpST52\n/0RhYWF+fv6X7T8mJsbMzMzMzGzq1Kk5OTlfthPF17FjRy0trcjIs+Hhx957q1evGUKhfW5u\nbnFxcWVlJZV4AIoMxQ6AJc6dO7dnzx7ZiJ1IhMEMOiwsnPX1zaOiovLy8t57SyqV3rp1a9iw\nYSYmJt98880XjLoVFRV5e3uXl5fn5xfs3LmzadOmO3bsqKPgisXMzOz48eMcDmfvXv+KiuL3\n3uXz1Qkh9vb2GhoanTp1kkgkNDICKCgUOwCW2L17NyGkZ8/pAQFXf/zxAu04DRTDMM2b95RI\nJNevX393eW1tbfv27T09PU+ePFlbW/v69ev09PTP2nNJScnIkSNTUlJatRqwc2dmp05jqqtr\nZ8yYIXscMPv07dvXx8enurp83bp+NTX/GJkbMWItn69RWFikoqJ6586drKwsWiEBFBCKHQAb\n5Ofn37t3j8/XaN16oItLL4FAk3aihuvdy+xevXr1+PFjkUh06tSpiIgIExMbf/+9zs7dCCEF\nBQWfvs+UlBQXF5dLly6ZmtpMmXJQW9t48uQDvXvPkkqlhw8frqcPQt3GjRtbtmyZmHg3JOS3\nd5c7O3fbuDFp27bXzZv3JIQ8e/aMUkAARYR57ADYoLy8XEdHRywWE0LGjt3es+c02okarrKy\n/EmTjE1NTQ4dOjRy5Mjs7GyBQMDn84uLiwMCrrq49Nq5c/SdO4cDAgL8/f0tLS05nI//gu3u\n7h4RESEU2i9efEtX11S2MC4ueO3avurqaq6uriYmJkePHhUIBPX84eQtJiamdevWGhr6bm7e\nJSU5YnGtldU31tZtmzfvweWqhITs2bvX39XV9dKlS+bm5rTDAigEFDsAlhgyZEhQUBAhRFPT\n4Lff3r/Ai2Vyc1+ePv1LXt6r8vICXV2z+fOv0E70Dz/91C45+e8Hm/J4fB5PUFFRbGnZYuXK\naIZhHj48vX27r+w6SC0trb179/r4+Hx4h0OHDj19+rS5ucO6dU/fXX7o0PdXr26VvWYYpk+f\nPkePHtXR0amHz0TN+PHj9+/f/97CJk1aTZt2hMtV2bzZ+9WrWHNz87i4OH19fSoJARQKih0A\nS0gkEnt7+xcvXgwevMTbO5B2nHoUGXl29+7vysuL3i7x8Bg9aNBCM7NmFFO9KyXl0d27hysr\nS6ury52cPLt1m5STk6KlZaSu/nflev067sqVzWlp8ampUYaGhqGhoY6Ojh/YoaamZnl5ec+e\n08aO3f7eW8nJDxiG+eOPBQkJIYSQ7t27X7p0SVVVtZ4+mvxVVFRcu3aNYRgjIyORSBQdHX3s\n2LFHjx6pqqqJxbVSqVQiEQsEgpcvX5qYmNAOC0Afih1AfZFIJJs3b+7YsWPbtm3lc8QpU6bs\n2rVLS8tg4cKblpau8jmonJWXF86caVldXT5z5szhw4d7eHjU1tYSQng8/tSpR9zchtIO+CFi\nsejlyxhVVbVGjZxlS/bu9Q8J2cPlckePHr106dLGjRv/64a9evW6du3a99+fdHPz/q+dFxRk\nfP99E7G4tk+fPl26dHFycurYsaO2tna9fBKqxGLxsmXLli9frqmpKRKJKisrt27dOm0aLj8A\nIATFDqD+nDhxYvjw4ba2ts+fP/+U66i+Xnp6+sCBA6Ojo7t3n9y164QmTVrJ4aDyJBbXnj+/\n+tSpn/z8/Pbv3z98+PCgoKCWLVtaW1v/+eefhoaNt259RTvjf6qt/X/t3Xcglf3/P/DXcYZN\nZI9EZFVSKJVCpEFFe6vkrrupoalSUUpF0t5JaahuIjdaKFJW2ZSRzKys46zfH9f9Ox9fbcXR\n6fX465zrep/rer0Vnq7rer/f9AMHbF+/jqJQaD4++dLSKgDAYjHDwg7988++xsYaQUHBZcuW\nbdmyRVZWtt1nL1686OjoaGW1bNGiY185RWbm4yNHZtTVlRNvlZSUAgMDR40a1Uk94q0PHz70\n6NGDTqdXVlaqqal9qdnBgwczMzNNTExsbW2VlJS6skKEeAKDHUKdZffu3du3bweAyMhIKyur\nrjnp3Llzr1y5AgAkEmnFikBT05ldc94uUFKSuWePBZFawsLCzp07d/PmTWKXhIREfX39ihWB\nw4bN6sqSSktz3r/Pqq0tbWqq5XA4DEZLz569Wlubhw6dJiEh17Ylnd546JD9q1eRZDKZxWJN\nm7bL3t6Nu7exsSYkZH9ExBE6vUlcXNzFxWXdunXci21VVVUuLi4BAQF2dq6zZnl9vaSmprrM\nzMfv32dmZj5JSQkjkUg2Njaurq4WFha/vPu/hd69excWFgKAgICAqanp8OHDVVRUoqOjZWVl\nvb29+ex5RIQAgx1CncfNzY1Yy3zTpk179+7tmpMSl3aI1zIyvby9s2g04a45dadiMFq2bBlU\nUpJpbGzs6emZlJS0ceNGOTn1KVPcT51azGIx9PQstm170OHjt7Y2k8kUMpmalxdfUpLJ4bDF\nxHoaGtqSyZRPG3M4nFevIoOCtrx9+/KzRxMV7WFgME5NbaC6+iAOh1NamvPixe3Xr6P19fW1\ntbWDg4N1dEZu395+dZDa2tLbt/c8eHCaxWLIyMicOHFiypQpHA7HysrqwYMHFApt7drbAweO\n//5OPXly4caN7R8+FAOAr6/vqlWrvv+z/OHjx486Ojrv3783NJzw9m1SbW1p272mpqZLliwR\nExMDABKJZGlpicMvEB/AYIdQZ4mLi7O0tGxtbaVQKKGhoTY2Nl1z3nv37nl7ez969KhHD4XD\nh/OJafp/dxERfhcvrrK0tLx27drRo0c9PDzIZNrOnXG9exvW1pbV1JQoKvYVEhLvwJE5HHZM\nzKWLF1ex2WwtraHZ2bEMBp3Ypak5REJCTlt7hKbmEAaD3r+/FZ3e+ODBmejoE6WlOQCgr68/\nbNgwVVVVGo1Go9FIJFJ+fn5TU9OFCxc+XQ6BRqM9ffp02LBhra2tM2Z4Tpq0+bP1VFS8uXFj\n+9OnV8XERLOysoKDg1euXKmoqL1lS2TPnqo/2jsWi3Hq1OKYmMuDBg26ffv2l57h41d+fn6r\nVq3q399606YIAE5hYWpeXsKHD0V9+w67cWN7QUFy28YyMjL37t3rsidiEeokGOwQ6kTHjx//\n+++/AYBCofj7+zs7O3/zI7/ErVu3pk6dqqZmsHdvStecsbPduuV+69bOSZMmZWVlZWdnk0ik\n5cuv/PyN19raMk9Pq3fv0kkkkoiISGNjI5VKHTduXEtLy6NHj9otM29iMuXNm8SqqiIAGDp0\n6MqVK2fNmkUikT49bHl5eVpa2suXL1+9eiUgIKClpaWjo2NiYkKhULS1tZuamgBAUVG7f38r\nFRV9BYW+ffoYCwv/n1EOAQFrw8IOW1lZxcXFtbYyd+6M69PHuGN9rKsr9/aemJ//XFRU1Nvb\ne+nSpR07zu/I3t7+zp07AEAmU4SExFtbmxmMFmVlXVPTmcbGDllZT2pq3tfXVwJw4uOvNzXV\nHT9+/I/6+iC+hMEOoU7EvY8GAGQyOT09XVu7i6bkUFdXLygoOHOmRkSkR9ecsfOUleW6uZlw\n5zeRlJTftu2hsrLuzxwzKGhrRMSRlpYGADAyMvL29jY1NU1MTFRQUOjTpw8AZGVl1dXVNTU1\n+fv7R0ZGUigUYq0Ie3t7Nzc3Q0PDjvalLDAw8PLlyykp/8vcVKqgqelMPT0LCQk5NTUDKSml\npqa6deu0iQcKHRy2T53q/vXDNjXVBgfvzs9/rq9vOX68S7t/dAaj5cYNt/BwXzabefr06cWL\nF3es+N9OQUGBv79/WFhYaWkpk8mkUCiioqLEYm5kMmXAgLHGxpOpVOG4uCspKWGysrJv3rwh\n7swi9PvCYIdQ56qrqzt06JCfnx+DwcjPz5eTk/v2Z34FLS2tvLy8Y8dKuQsV/L58facnJNyY\nPHny1KlTd+zYkZ+f7+Hx4mfG/JaUZGzaNJBE4rBYLB0dnaSkpG+u2ZCfn3/mzBktLa1FixZ1\n+Lxt5eXlvXjxIjMzMz09PTIysr6+nthOIgkYGU2eNWvfkycX79zxEBaWOHq0uN31vE9dvuwS\nHu5DvFZXHzx27Kry8vzXr6MtLZ1GjnQktqekhB88OInNZi5ZssTLy6tHj98+8XdMZmbm2bNn\nz58/33ZVNw0NjZs3bxoaGjIYjNra2k8HJiP0u8Bgh1BXqK+v//jxY9eselRVVbV///4DBw4A\ngLd3ppKSThectPM8fXrV33+OoKCgubm5h4dHdHS0q6vr91zE+gp3d7Ps7FhPT89p06bJy8uL\ni3fk4bxfqL6+PigoqKCgoLi4OCIioqKiQlBQZPHikwkJN0ePdv7KgIny8vzq6ndsNish4WZ0\n9IlPf56TSKTVq2+YmEwh3iYmBp8+vaShobp3795RUVHEtck/E51Oj46ODgkJoVAohoaGU6ZM\nkZSULCkpsbOzS0lJGThw4KFDh8zNzXldJkI/DIMdQnyFw+Ho6ellZWUBgIaGkbv7s8+O6/yN\n7No1MisrRkBAgM1mL1++3MzMbObMmZaWzk5OJzt2wOzsWHd3M11d3bS0NAql231xWlpaNmzY\ncPToUWVlvXnzDg0Y8PkxNy0tH69f3xYdfZI71OMrBgwY89df56WklACgvr7i9Gnnly/vKikp\nhYSEDBo06Bd3oNvjcDhpaWkfPnzQ1NRsO5qETqfr6OgUFBQICYm3tHyUl5dPTk5WVFTkYakI\ndUBXTJqKEOo8t27d2rx5s4mJybBhwwCARCKxWCxi15s3L740H8dvhEYTAQBikKm1tXV8fDwA\n/ND40OrqksTEYO4fsYmJwQCwYMGCbpjqAEBISMjd3X3QoEElJRn79o3185uZkxPXrg2Hw758\nee39+0fYbCaJRBIVFeVedBQVFQWAgQPHe3i8cHI6SaHQACAt7V83N5PCwhQAkJCQc3G5NXKk\n4/v3783MzK5du9a1/eO9IUOGDBw4cPTo0WpqaoMHD3706BGxPSsrq6CgQF190MmTlebmi8rL\ny+fOnUv8x8vKyvL39793715xcTEvS0foO3THn2sIoa/gcDgJCQkUCkVERMTe3j4nJ4e7y97e\n3sPDIzg4eNmyZbGxsQoKWhoaRjws9ec1NdXl5SVQKBQWizVq1KixY8cSI1GUlH5gDMrRo7Oy\nsmLU1Aay2cwVK64mJYUCQGNjY2cV/dOkpaVfvHhx48aNxYsXP3sW9OxZkJychrb2iKam2jFj\nVrx/nxUe7lNR8QYAiBDfti+NjY0kEik396msrLq6+mA1NUNvb7u6uvLq6hIvr/FeXmni4jIC\nAuS//jqnpKQdFLR11qxZYWFhPj4+f84Ubunp6QAgJCQuLa2clJRkYWHh6uq6b9++8vJyABAX\nl6FSBRcs8MvLS3jw4MGkSZNqa2vj4uK4fxg4OzsfP368a9aSQagD8FYsQr+Z+fPnX758mfuW\nShXq39+6tbXp9etoABAREUlKSmKz2YaGhq2tDDOz+TNmeBD34H5HZ88ujY4+OW7cuLNnz8rL\nyzMYDF1d3bdv33p6JvXu/cVxqWw26+LFVQUFyTU1JY2Ntc3N9dxdcnIa9fUVLS0Nfn5+K1as\n6JJOdNzbt2/v3bt37ty55OT/zbgmIEBms1kAIC4uM2nSZg0No6qqopKSjHfv0sXFZXNzn5WU\nZADA2LGr5s/3BYDCwtQtWwbRaDQ6vWX8+LXTpu0SFBQlDpWcfO/0aafa2rJevXqFhYXp6+vz\nopddzcvLa+vWrSwWa+nS82Qy9cKFFY2Ntbt37163bp2mpub79+8XLTpmZbWsqCjNzW0Ig9EC\nANLSKsOGzaqrK09NDa+vr3RwcPDz88MFylD3hMEOod/MmDFjIiMj5eX7VFUVUSi0gwezpaWV\nmczWtLSIy5ddysvzX7x4MXjw4Js3by5atOjjx4+DBtmtW3eHRPotLzB4eIxOT3/w9OlTU1NT\nAPD391+xYsXAgeNcXcO+9JG0tIibN3fm5cVzt8jJyc2cOVNNTW3dunXEFgcHhytXrnxzJGz3\nUVZWFhMT8+7dO19fX2KBLACwsHBasuR0u5Z+fjOfPQui0QRZLPaBA+kKCloAcOKE45MnF4kG\nffsO27Ejljv9XkPDhzNn/nr+/Ja0tHReXp6UlFRX9YmXwsPDx48fr6ra38srraAgeefO4RwO\nMysrq7i42Nrams2GJUtOmZnNz82Nr6x8q6Kir6raX0CADAClpTmenlYfPhSLiop6eXktX76c\n111BqL3f8mc9Qn+ykSNHAoCkpIKPT76fX6G0tDIAUCi0QYPsAEgAQKVSAWDq1KkZGRnKyspJ\nSSGPHp370tHo9KaUlDA6vZvel1RW1gOAt2/fEm/PnTsHAA4OO77UnslsPXZsHpHq9uzZ8+jR\no5ycnIKCAl9f3xUrVujo6AgLC1+5cuXWrVu/UaoDAAUFhWnTprm4uGRkZOzatYt4or9fv88s\nQDxunAuZTGWzWSwW4/r1bcTGv/46JyenAQCampo5OU8fPjzDbS8m1nP16htqagOrq6ttbW3n\nz5//J/y1P27cOGlp6dLS7PLyfA6HLSYmzWQySSTSqFGj/P392WzmiRMLt2wZfOnS6ufPg0VE\nJIlUBwCKin29vNLGj3dpaWldsWLF9OnTCwoKeNoVhNrDYIfQb8bR0XHgwIE5OXE7dpiWleW1\n3UU898NkMom3KioqV65cAYCQkP319RWfPdqVK+v3759w4IBtJ1fdQWlpEQDAvUWYm5srJCSm\nqTnkS+3r6yvr6ysBYPr06Rs3bhw1apSWlpawsDAA0Gi0lJSUd+/ezZ49u0tq7xQiIiJubm5E\nsCMyfTuamkOmT9/NZDKpVGp8/HUi05NIAr16DQCASZMmkUikkJD9bT9CIpGIdeeePn16+fLl\nN2/edEVPeG327NlMZquLi+bWrUbV1SXm5ubq6uoAsGTJkqioKCMjo8LClDdvXiQmBl+79n8W\nfxMR6TF37qEdO57IyPS6ceOGhobG3LlzedQJhD6DvHPnTl7XgBD6ARISErNnz87JyUlKeh4f\nf11GRk1VVZ9EIjU21qSl/VtR8YbJZE6aNIlo3Lt372fPnqWmJqakhA8fPptKbX+Z6sYNt9ra\nssrKAnX1wYqKXbQqxvcoLc05eXJhbu4zbW3tPXv2AEBJScm+ffsUFLSsrf/+7EdiYi55eY1l\nsRgA4OnpqavbfmkKCoVChLzfXUlJyZMnT54+DaysLOjf35pMprbdq6Vl+vp1VGVlIYkk8Pp1\npLGxvYSEbEtLQ1JSSHx8vISERHV1OY0mnJBwo7Q0p6goTU1tYJ8+JpqaQ0gkgffvs+Li4l6/\nfj169GgymcyrDnaBYcOGpaSk9OjRQ0tLa9myZZ6ensSAYgBQV1dfsmSJgYHBhAkToqOji4rS\nx45dRaUKtv24tLSKmdkCAFJJSebLlwk2Njaqqj+8ki9CnQGDHUK/H0FBwRkzZnA4nAcPIp8/\nvxUdfTIl5d65c8uIkZIqKiqzZv1vEdUpU6b4+Ph8+PB+0CC7nj3/N2tXXl68p6d1SUkmceut\nrq585MgFXd+XLwkNPfD48TlxcfFTp0717dsXAGJjYwMDA1VU9I2M7M+eXdbQUN12/ASd3uTt\nPbGxsQYAXFxc/vrrr+45m8kvMXjw4KampsTE52/evCwpyRw6dHrbJWtJJAEdnZEPHpyiUMh0\nektDQ7WR0aTDh6c0N9cLCAiMGTMmOzvr9euovLyE1NT7SUkhpaU5VlZLe/ceRKFQ4+Ovl5aW\nPn/+fODAgWlpaXV1dcrKynw5AlRISGju3LnOzs4LFy4cMWIEN9URSCSSrq6ugYHB69evU1NT\n1NUHq6jotTsCjSbcv78Vh8N+/TpaVVUVZzNG3QTf/uBDiO+5u7ubmZm5u7vHxcXV1ZULCQn1\n69dPV1d3165dbZuJiIjIysoWFhYWFb2iUoXYbNa7d+nx8ddTU+8DgISEhI2NTVxcXEbGo5qa\n991n/GxraxMAnDhxYsKECcQWAwMDOTm5jIxHS5fKMZmtMTGXVFX79+ljTOwNCfGqrS0dPXr0\n5MmT//rrL+JBQ34lISHh6+u7ZcsWU1PTxMTga9c22disantnVkFBy8ho8rNnQQBQWppdUpL5\n4UNx//79dXV1y8vL5eTkqqurubfsnz27VlVVOHjwRHPzRUePvouPDwoIWDdt2jQi8VOpVCUl\nJR0dnby8vPLycjs7OwUFhalTpxoYGMTFxVlZWfFl7OOys7MLDAxMSgoZMmTqp3uLi189e3YN\nAP7kNTxQd4OjYhH67c2dO/f69eseHh4bNmz4bAMfHx8XF5d2G3v37u3q6urs7Ewmk9esWePr\n6ztt2i57e7fOr/cbnj0LKixMiY29XF1d8ujRo1GjRnF3paSkzJkzJyMjAwCoVEFPz2RlZd2y\nstyYmEvh4T5sdmtmZqaGhgbvau9qUVFR48aNYzKZoqJSU6bsGDt2NXdXbGzAsWPzyGQyhSI0\naJDts2dBAwYMSEtLI/YKCYkpKekYGtqGhR3iTgfTt++IHTuekEikEycWPnlyoW/f4QICAqWl\nOXV15UQDKlWImP5DUlKyZ8+eb968cXBwCAgI4I8b3FyNjY0HDx6MiorS0dHx8PBQUVGh0cSO\nHCkUEhKrqyt/8uRiYuJtCoXKZDKIYTojR44MCwtrd80PIV7BYIfQb4/NZjc3N3/990psbOzF\nixcLCwt79OihoqIybNiwiRMn0mg0Ym92draejaVbPAAAIABJREFUnp6YmMyRIwU0Gi9/ScfE\nXD5+fD7xesGCBefOnWt7Qai6unr69OnR0dE0mvDSpReGDp0OANu3mxK/Xx0cHG7dusWTsnno\n8ePHJ0+evHHjBpPJXLbskpnZPGJ7Y2PN+vW63ExGoVCMjY2fPXtGJlN37IjhDkDJyHh48uTi\nysr/xh1bWDg5OZ1is1nv32epqOgTd3jp9MaCgmRFRW0aTfjly7tpaf/GxFwCADKZymIxNm3a\ntHfv3q7udqd5+fLl5MmT3717R7zdvn17YmJieHi4sLAEmUxpaKhu21hNTW3FihUrVqz4vQZZ\nI/6GwQ4hBAAwceLEkJCQDRtCDA15NkI2K+vJrl2jAMDOzm7lypXW1tbtGpiZmcXGxqqo6K9Y\nEdir14DW1uZz5/5+9uwqsV5qQEDAnDlzeFB3NxAVFTVmzBgRkR5HjxZz5x9OTAw+fHgKiUTi\ncDiGhoapqanEAll9+pjs3p3Q9uPPn9/y95/HYDQLCJBPnfogIiL5lXNxOJx3717TaCJsNmvd\nOm09PT1iLQf+oKioWFZWJigooqdnkZx8z8LC4syZM5s3bw4ODhYQENDQ0DA3N1+6dKmwsHBz\nc3O/fv34e4gJ+h3hM3YIIQAAW1vbkJCQqKgTvAp2HA7n1atIACCTyQkJCUOGDGkX7N68eRMb\nGysv32fXrvh379JLS3NevvznyZMLADBw4MDJkyfb29vzpPLuwMrKytLSMjo6evNmQwUFTSUl\nHUtLZ2Njh2HDZj19elVdXb2lpYXNZisr65aUZLabrfrZs2uXL69jMJoBQF/f8uupDgBIJJKq\nan8AaGlpAICGhoZO6xYP2Nranjlzhk5vSk6+BwAUCkVDQyMoKKi5uZlGo2GMQ90fXrFDCAEA\nNDY2ysjI0On0w4fziMlsuxjxTBj3LYVCaWlpaft7NDEx0cTERFW13+zZB7y8xnG3z5s3z9vb\nW05OrkvL7X6io6NtbGyI1WMBQFFR++DBrIaG6m3bjCoq3kpJSdXW1u3bl5KXl9C373Bl5f/m\ngsnMfOzlNZ4YqkKjCa9efcPQcMJ3npHJbF2yRJpEYsXExBgZ/d6rEnNxOJyLFy8WFRUJCgpq\naWmNGzeOz54gRHyPn0czIYS+3+7du1taWiQk5CgUwW+37gQhIV4AcOHCBWJpjblz57a7OmJg\nYGBsbFxc/PrePW8AoNFo48aN8/f3P3/+PKY6ABg9ejQxcTGBuPAmJibt7HyORCLR6XQOh33y\n5KIBA2yIVFdennfggN3u3eZEqhMWlli69MIPDYumUGi2thtaWlq2bdv2q3vDMyQSydHRcfv2\n7Rs3bnRwcMBUh347eMUOIQQZGRn9+/cXFBT19EyWl+fBxA1MZuv8+YLy8vIlJSUAUF1dLSsr\n+2mzuLg4c3NzYp4OJyen06fbr5T6h/Py8tqzZ8/YsWNv3rwpK9t75sy9gwbZCQqKnjq1+NGj\nc3JychUVFRISsi4uwTIyalu3Dq6vrxQVFW1paeFe5yORSOvX/yMtraqmZvA9Z2SxGGvW9Pnw\noXjfvn0bN27szM4hhL4LBjuEEOzfv3/jxo2TJ2+dPn0PTwqoqipctaq3oqLi7Nmzs7Ozt27d\nOnTo0M+2LCgoCAwMHDBggK1tN10Gjeeys7ONjY0/fvwIAGQydenSC7q6I1euVFNQkG9sbKyv\nr7ezc21paYiMPEa0FxaWACA1N9cRb0kkEgBp0aJj9fWVoqJSI0cuEBIS+8rpMjMfe3mNa21t\nvn379uTJkzu7dwihr8NghxCCK1euzJ07d/jw2cuXX+FJASwWY/t207dvXxJvaTSag4PDuXPn\n8EZYx+Tl5QUHB9+9e/fp06dkMsXZ+ezFi6taWj5euHBh/vz5ffqYGBlNDgraAgCqqv127oxj\nsZhv3rzYv388m81qd6iZM/dOnLjp66d7/vyWj89UISGhgoICeXn5zuoVQug74DN2CCGws7Pr\n0aNHfPx17nxmXLW1pSdPLgoO3vXZD/4qZDJ1587YZcsuLV16wcpqKYvFuXbt2vTp04npOdCP\n0tTUdHV1jYuLO3/+PIkEJ044iovLsNns0NBQMplcVpYjKtoDAERERIqLXxcUJIuJSQ8YMMbZ\n+cynsxh+/XIdwcRkSq9eA1paWurq6jqlPwih74bBDiEEEhISK1asYLGYERF+bbfn5cVv3Nj/\n8ePzwcG7amtLAeDDh2Ims7UzaqBShczM5o0cuWDRouOeni8BIDQ0tLS0tDPO9edwdHS8ceMG\nlUotL88HgDt37kyePLmxsfb+/SMA0KtXLwDIyHhINB450vHYsffOzmd79lQFAGL+6tbWlu85\nEbF8BXHAP9nZs2fHjh27adOm/Px8XteC/lAY7BBCAADz5s0DgLy8/+atZTDoDx6c9vCw+vjx\nAwCw2azs7Ljbt3evXNnL13ca0YbNZgUGbvj7byVi2dm23rx54es77cABu/r6ig4U8+5dOgDY\n29srK/+3/mlJScnRo0e56wGg7zd58uTQ0FBiwGxra+uoUaNoNNr791kAwGAwAEBeXpPbWESk\nh7n5Ii+vV7KyvVtbW0kkUlDQ5t27zY8fX0DMMvglIiI9AOAPv2KXnZ3t5OQUERHh5eWlq6u7\nevXqP/wLgngCgx1CCABAVVUVAKqr38H/v1B35owznd5oaWm5fft2APD1nRYcvBsA0tIiXr+O\nBoCXL/8JDfWurS09fdqJWEIUAOj0xnPnlrm5mSQk3ExODn3x4u4PlcFms3Jy4k6dWgwANjY2\nxEY/Pz9VVdWVK1du2vSNh73QZ1lbW4eHhxsYGJBIpL59++7Z898QGSIox8VdqawsaNteRERy\nyZIzmppDORwOi8XMzHwcE3Pp9OklHM5/d8avXt20YYM+988A+P93bPlssuIfRafTAUBTc4i9\n/TYyWfDIkSNmZmbFxcW8rgv9WTDYIYSATqf7+/sDgKysekzM5Z07R5SV5RLTyKWnp7u7u/v7\n+ysoKLBYDHl5eQaD7uMzpba2jJsGqqtLTpxw5HDYjx6dW7u2b1TUCWlpaSqVCgC9evX/oUou\nXFi5c+cIOr1pzpw5zs7OxMaTJ08Sw7waGxt/Xaf/LAYGBikpKfX19TY2NrW1tcRG4quamnrf\nz28Wnd7Utn2/fqN37oy1sVkJAAICAgMGDKiqKkxKCiX2xscHlZRkuLuP4F7Gq6wsIJFIbSfS\n+wMR/+cBYNq03YcO5ejrW7569UpfX9/X1xefFkVdBoMdQn+68vJyTU3NDRs2AICsrPqdOx5s\nNotMJhNzm40ePRoA/v7773v37m3dujU3N3fZsmVNTXV37ux59epfANi9e3ePHj0SE29v3Wp0\n6tTimpr3U6ZM2bRpE4PBUFHR79PH5PsraWj48OzZNQEBAXd399OnTxMr0Kenp799+9+QjgcP\nHtjY2ERGfu2eIPoKMTExAOCGjJ07d3p4ePTu3TsvL/7du9ftGgsIkCdP3tqzpyqbzU5LSwOA\ns2eXBga6Pn9+q39/awBgsZinTzvV1ZUXFaVVV78bOHCgiIhI13aoe9HW1lZWVs7PT3z/PqtH\nD0VX13vjx69tampes2aNubn54sWL//nnH+L2N0KdB6c7QehP9/79ewMDg6qqKu6Wfv36vX79\n36/5pKQkQ0PDtu0rKio0NTWbmloGD574/PktDw8PANi6dSsADB482MfHR0VFxdjY+MOHD1u2\nROnrW35/JUFBW+/e9dTV1c3IyCC2sFgsTU3NgoKCdi3//vvvo0ePEskP/ajGxsbx48dXVVUl\nJyfTaLQpU6YEBwdv2hQxYMCYTxs3NFRfvuySnBza0FBNbCGTqTNn7r1yZT3xVld3FIvFyMl5\nunv3bn5agqJj9uzZ4+bmpq4+2N39KYVCA4C3b5P8/ecQDzUCQK9evdauXevk5CQqKsrTShHf\nwit2CP3plJSUXr165e3trampKSIismfPnsjISAqFAgDTpk1rl+oAQE5ObuXKlSwWo7m5nkQS\n8PPz27BhQ0xMTFhY2PPnz0eMGDF79uyqqipr6+U/lOoAgM1mAoCKigp3y7p16woKCpSV9TZs\nCNXXt7S332Zrux4Ajh07Fh4e/rM9/1OJioo+fvw4PT2dGPc6bNgwAAgPP1xVVfhpYzEx6WXL\nLk6cuBkAjI2NtbS0WCwGN9XJycllZj7OyXkKANbW1l3Xh+5q06ZNpqamb9++DAx0Jbaoqw/y\n8Hixdu3t5csD+ve3LioqWrNmjZqa2u7du3FoBeoMeMUOIfSfmpqa1tZWYoLZpKSk5uZmU1NT\nAYHP/PlXUVGhrq5OpzM4HLaYmGhZWRl3JuHa2lppaWkpKSVf37dkMvWHCjh1yunRo7NXr16d\nOXMmAKSmphobGwsIUD08Xiop6Tx/fis/P/HRo7MfP1YBQFhY2Lhx4362zwggKiqKyGSqqv3t\n7bf16WMsLi4jJCTetk1Dw4dt20wqKt74+fmtW7eOzWYzmcyxY8d6eHh4e3sLCAiIi4v7+/t/\n9n/Ln6awsNDQ0LC2tvbQoZy2I44JBQXJISFeCQk32WyWlJSUi4vL6tWrJSQkeFIq4ksY7BBC\nHXHkyBE3N7eGhoZDhw6tXr2auz0rK0tXV1dPz3zbtoc/ekw3tyH5+c8zMjJ0dXXZbPaoUaNi\nY2OnTNnh4LDj7l3P69f/u81nb29vaWm5YsWKX9aZPxubzb58+bKzs3Nr638zFEpKynt5pUlI\nyLVtFhd3xd9/7tChQyMjI4WEhKqqquTl5fFu+KdKSkpMTU2Li4v37EnU0DD6bJuystzbt/c8\nfRrIYjFVVVWDgoJMTU27uE7ErzDYIYQ6qLm5uampqWfPnm03fvjwQV5eXlBQzNf3raio1Hce\nisPh3Lt38OpVV1VV1YKCAhKJFBoaamdnJyPTa9euhMjIY7dv7wYAKSmphIQELS2tX9+ZP964\ncePu3//ffIR2dhtnzdrXtgGLxXRzMykoSMZrpV9nZmYWGxurqztq48bwT1fyaKusLPfq1U2J\nicFUKnXfvn0uLi4YlNHPo/C6AITQ70pYWPjTtVyJjXR6C3fOs69gMlujok4UFCRXVxe/fh0t\nKCjo5+dH/G57/PgxAFRXl9DpDdy1LmpqalavXh0WFvaru4Lg4sWL/v7+Y8aMERQUNDMzCw3d\nT6MJT568lUymJCWFnD+/XEysZ11dGQBUVHRk0uk/REJCQmxsrKKi9qZN96lUoa83VlDQcnG5\nFRl5LCBg7bp16168eHHx4kXunCkIdQw+D4EQ+pVevnzZ0NAwYICNmFjPbzY+eXLhpUurnzy5\n8Pp1dO/evePi4iZOnEin09euXXv8+HEAkJSUl5CQq67+3xSvDx8+xGDXGeTk5Nzd3YcPH25k\nZBQUFCQkJHTr1s5t24xDQw/4+Ez98KG4sDCltrZMX18fB0l8yd69ey0tLQHAymoplSpU9mTk\n7Nkk/9LqT1tmHNKYPZsUV98EANbWf2/b5AsAV69edXBw4N4QR6hjMNghhH4lYqCfpKT8N1uy\n2ayXL/8BgB07doSGhmZkZAwePBgA5s2bd/jw4cbGRuJBPWFhCSMjexKJZGo6k0YTbmlpuXDh\nQid34k83ceLE5OTkoUOHFhamBAa6MpmtNjY2Dx8+TEtLS05OVlJS4nWB3dG1a9e2bdvGYLBG\nj/5r7NhVP/TZ3mp9AUCAqhwaGjp//vzOKRD9KfBWLELoV2pubgaArz9a1NBQnZn5ODExuKWl\nQVRU1NnZmZsVWCzWrVu3aDRhN7fHGhpGxG3ZIUOmHjtWWlKS8ezZNQAoLy+vqqqSkZHp/N78\nubS1tePi4i5duuTs7EylUmfOnGlubs7rorqv3NzcefPmAZCWL79iYjKlYwcRld/DqV0XFBR0\n7ty5P3yqZ/Qz8IodQuhXIq7YCQt/bfqG4OBdhw87xMYGAEBwcDA31UVFRVlYWJBIJCazVUNj\ncNsHySUl5fX0LEaMmAsAT548IZ7AQ51KQEDA0dGxpqampqbG0dGR1+V0a2lpaUwmc+TIBR1O\ndQBAIssoKekCQGlp6a8rDf1xMNghhH4l4neSlNQX79ZxOBzuLPympqZWVlbE6717944fPz4m\nJobFYg0fPodEav/TqbGxZvDgSWQyVUJCYtSoUZ1TPmpPVFSUmMcYfQWxSO7r11Htltz9UbKy\nvQFg5cqVa9euxXiHOgaDHUI88OrVq1mzZk2YMOHSpUu8ruUXIxaYFxQU++ze5ub62NiAtLQI\nUVHRxMTEhw8fElPa3rhxY8uWLWw2LFp0/MSJ8qVLL3z62atXN/r6TmOxGIKCgp+OxkWIh4YN\nGzZp0qSqqqIzZ5ybmmo7fBwtLVMACA8PP3z48JIlS35dgegPgs/YIcQDXl5e165dA4CcnBx+\nelaaxWLl5uYCAPeaXFsMBn3vXpu8vHgAMDIyMjL639ytBw4cAIC1a28bGk740sHLyvKIF/X1\n9U1NTbjUJupWPD097927Fxd3hcFoWbPmJnd73Lqecd99kFGjHFkshqxs7ytX1t+7d+/Jkycj\nR47sjGoRH8NghxAPGBgYXLlyBQD4bLr5DRs2hISEiIv31Ne3aLervDxv/37b0tJsAFi/fv36\n9eu5u1JTUxMTE5WUdAYOHP/Zw+blJRw/vqC0NFtcXHzTpk1aWlqysrKd1wuEOkBPTy8tLc3G\nxub581vv3qWrqOgT25VGLjUQbT+hXXXS+YTyzywUKygoOm7cGgCoqiq6dGl1cHAwBjv0ozDY\nIcQDGzZsIFbNsrOz43Utv0xSUpKfn5+IiKS7+zMFhfaLQ8TGBpSWZqurq0+YMMHd3b3toL+8\nvDwAqKsrj40NMDOb9+mR09MflJZmS0pKXr58mZ++YojP6OrqLly4cNeuXYmJt7nBTn2SxzxF\n6XYtMyrvfjbYcRkaTggM3HDkyBEqlbpz5068Po2+Hz5jhxBv2NraTpw4kW9WEAoKCho6dCiT\nybSz2/hpqgMA4vecra2tn59fu6kcBg0apKmp2dxcd/nyGgajhbudwWiJibmUkfEoNfU+ACgq\nKmKqQ93ctGnTACAm5tJPLtcpL99n9errgoKi3t7eenp6wcHBv6hAxP8w2CGEflZxcbGTkxOL\nxZ42bZet7YbPthESEgeA8vLyT3epq6vn5uZOnjy5oaGayHCE48cXHD++YM8ei6ysJ1paWseO\nHeuk+hH6Vfr16zdkyJCystwHD0795KEGD5504ECGsbF9UVHRlClTxo0bh2u7o++BwQ4h9LNc\nXFwaGhrGj3ext3cjkz//gMeDB6cBQE9P70sHGTp0KACkpISx2SxiS03Ne+KFtLT0o0ePLCza\nP7eHUDe0b98+KpV68eKqD/Ut3279VT17qrq4BG/YEEqlCt6/f/+zfxch1A4GO4TQT0lPTw8O\nDpaSUnJw2PGlNv/+65+WFiEiIuLq6vqlNgMGDACABw9OnzrlBADNzfXE9QkzM7MHDx7gMlbo\nd2Fubr5582YmszU6ufjbrb9DZWUBg0HX0tKSk5P7JQdE/A2DHUK85OjoKC8vP23atFOnfvbG\nDa8cO3aMw+GMHbtKSOgzc9eVlub4+8+9cGEFnd5oa2v7lfnnbGxsEhISREVF4+OD8vOfb9ig\nn5MTp6io6O3tbWBg0Jk9QOgXW7Nmjaio6Mvcip8/1MOHZy5fXkOlUgMCAohJHxH6OhLes0eI\nh+bMmRMYGAgAJBKppqZGUlKS1xX9mPz8/BUrVty/f3/37ud9+hi321tT897NbUh19TsA2Ldv\n35IlS6Sl2w8PbGfZsmUnTpwgkQQ4HLa5uXlwcLCUlFRnVY9Qp3Fycjp79uzy5QHDh8/p2BEY\nDHpg4IaICD8qlXr27Nl58z4zYByhT2H8R4iXtm/fTqFQAMDMzOz3mtGAw+Fs2bJFU1Pz33//\nBYA3bxLb7i0sTPH0tFq+XLm6+p2JiUlAQMDGjRu/meoAYMuWLTo6OhwOW0hI6Nq1a5jq0G+K\neLSgqqqwA59lsZhPn17dts0oIsKvZ8+e9+7dw1SHvh/OY4cQL2lra799+7aoqMjU1PQ3mvqk\nqanJ2dmZmGOZzWaTyVRFxb7ELgaD/vLl3Vu3dpaUZAoKClIolHPnzunr63/zmK2trdOnT797\n9y7xtqWlZebMmQ8fPuy8XiDUeT5+/AgAwsIS39O4qakuIsLvw4diPT3zurry+/d9KysLAMDM\nzOzKlSuqqqqdWiriMxjsEOIxFRUVFRUVXlfxA9LT02fPnp2WliYlpeTicqu1tUVJSadHDwVi\nr7v7iDdvXhCvLS0tBQUFU1JS9PT0vhlb//77b26qI+Tn53dG/Qh1AeIxJxLp27fFKisLdu8e\nVVVVBADcSVKsra3Xr19vbW39G/29h7oJDHYIoe/FZDK3bNni4+PDYDB0dUetXHmNm+e4uI/t\nksnkiIgINpt9586dd+/ebdy48StHfvXq1fnz54nXFAqFxWIpKioGBQV1Ri8Q6gJiYmIA0NLy\n8SttOBzO9etbw8IOMRh0Ozs7BweHxMRECQkJe3t7ExOTrqoU8RsMdgih77V582Zvb28hIbFp\n0zzGjXNpO2Xdq1eRx48vIJMp9fWVAODo6Ojo6GhlZcVms8XFxQcOHPj1I6enp7PZbAqF8vTp\nU2Pj9oMwEPrtKCgoAEB1dcmXGsTFXYmJuZyWFiEqKurktOjIkSMUCsXR0bHrSkR8CoMdQujb\nWCzWzJkzb968KSwssXt3gpKSTrsGZ88ura0tBQBhYWEAqqOj46hRo2pra0VERFpbWwUFBb9+\n/JkzZ6qqqlIoFEx1iD9oaGgAQElJxmf3JiTc9PefCwAqKirh4eH9+vXr0uIQX8NRseiHtba2\n1tTUsNlsXheCugiTyVy6dOnNmzdlZNQ2bgz7NNU1NtZUVLwBAElJydDQ0Obm5lGjRgGAqKgo\niUT6ZqojDB8+fMiQIb+8eIR4on///goKCq9fR6ekhLXbxWIxrl3bDABHjx7NyMjAVId+LQx2\n6Mfk5eXJyspKS0urq6ufP38e50H8EwQFBZ05c0ZCQm7jxrC+fYd/2kBEpMfs2ft79zasq6ub\nMWMGk8ns+iIR6laEhYUPHz4MAAcO2O7cOTw+/jr3p2VSUkh5eZ6FhcXy5cvFxcV5WibiQxjs\n0I9JTEysr68HgKKiokWLFo0ZM+b9+/e8Lgp1rtevXwPA1KnuysqfX+mVRCKNHOlYV1cOAHp6\nelQqtV2DwsJCAwODiRMntrT87OqZCP0uZs6cuW/fvl69euXkPD1yZMaePRbv3qUDQHT0KQBY\nsWIFrwtE/AmDHfoxFhYWS5YsERISAgA5OY2oqKjp06fjbVn+09jY+OLFi6ioqNzc3IiICADQ\n0TH7UmM2m5WSElZT897a2joqKurThY/i4+PT0tJCQkJiY2O5G1taWi5cuJCdnd1JXUCI5zZu\n3Pj27dvw8HBdXd3MzMdubkNCQva/evWvsrKynZ0dr6tD/AmDHfoxCgoKp06dkpaWJpFIFhZO\ngoKicXFxxKJYiA9wOJzY2FgnJycFBQVjY2Nra2s9Pb3k5GRFxb4qKp+ZZLikJDMoaOu2bcYn\nTjgCgIWFxaeX6wBg+PDhCgoKCgoKenr/u+bn6em5cOFC4mk8hPgViUQaO3Zsamqqm5sbnd54\n9epGDoezdevWz36nIPTzcK1Y1BHr1q07dOgQ922fPn3y8vJ4WA/6JU6fPu3p6VlQUAAAVKqQ\nnp55QUEycYNVUFD0wIEMGZleHA47P/+5quoAQUGR5OR73t52xM8QQUFBExOTy5cvq6mpffbg\nDQ0N8P8n9yLeysvLNzU1SUlJVVdXd00HEeKtEydOrF27duXKlfv27cOZh1EnwelOUEfs3bt3\nwIAB//77b05OTlJSUp8+fXhdEfopTCZz48aNvr6+LBarTx8TM7P5w4fPFhWVOnduWVTUCQBg\nsRhkMiUx8fa//x5NT3/Qs6eqh8fL5OR7HA7HxsZm+/btmpqacnJyXzkFN9IRhISEpKWlm5qa\nlJWVO7dvCHUbS5cuXbp0Ka+rQHwOr9ihn1VcXCwlJeXq6hoWFnbx4kW8s/bbaW1tnTFjxp07\nd4SExJydzw4dOp27i05vSk0NLy5+paU1TFd3lJNTDwbjv9EPiorapaXZoqKioaGh5ubmHThv\nfn7+o0ePhg0bpqur+0s6ghBCCIMd+jUUFRXLysqEhIQCAwPt7e15XQ76AVu3bvX09JSTU9+8\nObJnT9X7930rKt6OHDlfU3Mot82bNy/OnHEuKEgeMWJEYWFhcXExAKiqqt69e9fQ0JB3tSOE\nEPo/MNihjqutrQ0NDQUAMplMoVBmzJjB4XBsbW1DQkJ4XRr6XjExMRYWFlSq8N69KfLyfW7f\n3nPjhhsAaGuP2LEjBgA4HE5RUerOncPp9CYTE5OtW7dOmjQJAAwNDSMjI3v27MnjDiCEEGoD\nn7FDHcRkMrW1tSsqKoi3a9asiY6OPnLkyOzZs3lbGPp+dXV1c+bMYbFYixf7yMv3AYDISH9i\nl6CgyNu3L0NDD1RWFublxQOAkZHRrFmzRowYoaenR6FQbt26hakOIYS6Gwx2qIMoFErbYPfx\n40cLCwsLCwveVoV+yI4dO4qLi01MppibLya2MJkM4kXPnr0OHLCtrS0j3pJIpBcvXrx48YJK\npaanp/OmXIQQQt+C89ihjrt58+aYMWOI13PnzuVtMehHHTx40NfXV1hYYs4cb2JLcvK9hoYP\nxOuHD8/U1pZxV7HkPrPR3Nx88eJFAKiqqurykhFCCH0DBjvUcXJycuHh4X5+fgcOHOjYuEjE\nE7m5uV5eXhs2bKBShdatuysr25vYTjxdBwAkEklHRycwMLBXr14AoKz836hVc3Nzb29vR0dH\nMzMzOTm56OhoXpSPEELoi/BWLPopAgICuOLhb4HNZpeXlxMLh6xcuZLBYACAjIyanp45ALDZ\nrNevo9lsFtGYw+FkZWXJycmpqKgAwPsy0HbeAAANNUlEQVT32QCgrKwcHx9PLPZKrAzm5eU1\nevRoHnUIIYTQZ2CwQ4jPMRiMkJCQ5cuXl5WViYqKCggIMBgMI6PJCgqa1tbLU1PvR0YeA4Ck\npP+NZRYREZGVldXV1SVmmONw2ABgaWl5+fJlVdX+FRX5dHoTAERGRgYFBc2YMYNHPUMIIdQe\nTneCEH+qra3dtm3b8+fPGQxGSkoKACgp6VRWFhAzDMvLa5aX5w0dOv3ly3+ILcRomPT0dAEB\nAU1NzezsbABoaGi4ePGipaVldXX17du3Dx482O4sSkpKmZmZEhISXd4/hBBCn4HBDiH+5OPj\n4+LiQrxWVx9sZbXUwsIpMTHYx2cacQWuHR0dnczMzOzsbDU1NTKZ/OkK5WPHjo2IiBAREVmz\nZk3//v3XrFlTXl4OAJ6enps3b+7s7iCEEPoeeCsWIf6UlJQEACNHOhoaTjAxcSCRBADA2Nih\nTx+TvLx4Go124MCB1tbW4cOHW1patrS0EJPSaWtrf+mAPXr0AICtW7du2bIFACQlJR0cHFpa\nWvT19buoSwghhL4Fgx1CfCgqKur69etCQmLz5/uIiEiy2aymphoymSIkJC4iIgEAra2tdDp9\nw4YNAHDu3LmrV6+6ubl9/ZgHDhwYOXLkkiVLiLfjxo1LTk4uKiriTnmDEEKI5/BWLEL8Zt++\nfcS9UXv7bWPHrr59e09MzMXGxloAEBISb2n5SDRTU1MrKCjgYZ0IIYR+ObxihxC/iYiIAAA7\nO1cHhx0eHpZZWTE0Gk1XV5fJZL59+9bAwMDc3PzVq1cyMjLR0dEWFhYCAjifJUII8QkMdgjx\nmwkTJjx69Cg//3lAwNqsrBhlZeWXL1/Ky8u3azZ79mwrK6t+/fqtX79++vTpwsLCPKkWIYTQ\nL4S3YhH67RUVFe3cubOysnLhwoUODg5VVVXGxsbEbVYKhXLy5MlFixZ9+ilLS8uHDx8Sr6Wk\npGJiYnAYBEII/e4w2KFu4f79+0ZGRjIyMrwu5DcTFRXl6OhYVlbGYrEAQEJCorCwsEePHseO\nHUtISBg5cqSVlZWamtpnP3vnzp1p06YxmUwAIJPJycnJ/fv379LqEUII/WoY7BDvHTt2bPny\n5X379s3KyiKRSLwu57fBZrN79epVUlJCIpHU1AZWVLxtaqqdO3cug8EICgoCgOfPnxsbG3/l\nCMTEdQ8ePBg/fvzYsWO7qnCEEEKdBYMd4hkOh7N37974+Pj79+8zGAwymfzx40cBAQFBQUFe\nl9ZNFRQUHDhwIDQ0lMViubq6fvjw4eDBg42NjZ9trKamlpub++k8wwghhPgYBjvEM6GhoXZ2\ndty37u7u1tbWFhYWw4YNi46Oxkt37RQVFRkbG1dUVJBI/+fbVkBAgMPhSEpK1tbWcjfSaLSH\nDx8OGzaMF5UihBDiGRwVi3jG0NBQSUnp/fv3NBqNzWZPmzYtNDSUTqc/fPjw6tWr5ubmSkpK\nvK6xG/Hx8amoqDA2tl+06Pj588ufP79FbB80aFBISEhra+u1a9c4HI66urqGhoaIiIienh5v\nC0YIIdT18Iod4qXo6Ojo6OiNGzfW1NT07t27oKBg6tSpLBYrJSVFRkYmOTlZRUWF1zV2F+fO\nnVu8eHGPHgqHD+fRaMJLl8p//FgFAAMGDEhNTeV1dQghhLoFnJgU8dLo0aM9PT0lJSV79+4N\nAIKCgpmZmfn5+QBQVVWVkpLStnFFRcWXnifjP7m5uQEBAWVlZdwtw4cPFxAQYDDoAgIUEkmg\nXz8rYnufPn14VCNCCKFuB4Md6kZERERaW1s/fvyoq6u7Z8+eCRMmcHc5OjoqKChoaGgUFRXx\nsMIu0NTUZGdn17dv33nz5g0YMGD16tVsNhsA1q5dy2azbWxWUqmCiYnBz55dAwADAwNi9TCE\nEEIIMNihbkVSUpKIKTNmzJg8eTJ3/ASHw7l69SqHw6moqHB1deVpjZ3u5MmToaGhsrK9+/Wz\nqqys9PPzu3fv3tKlSyMjIwFg4MDxb968OHXKCQCOHj368uXLr09oghBC6I+Cz9ihbiczM3P4\n8OG1tbXu7u5ubm7ExgkTJoSFhQGAm5vbrl27eFpgJ4qIiHBxccnMzNy27UFCws3IyGNkMpmY\nfLgdV1dXLy+vrq8QIYRQd4bBDnU7+fn5mpqaxOstW7Z4eHgAQHNz8+HDh6WkpBYtWsQHE91x\nOJysrCwdHZ22s7r4+vq6uLgQ35JiYtINDdXtPqWqqiokJEQikZycnNavX48zwiCEEGoHgx3q\njtavX3/w4EEAoFKpKSkp/Ddzx4wZM65fv37gwIH169cTW169emVgYEChCCoq9i0qShMQEJg4\ncWJRUVFSUhIACAsLz5kz5/jx4xQKTlGEEELoi/AZO9QdeXl5EfdbGQyGi4vLN9vv379/ypQp\nz58/J94WFBTU1dV1bokdlZubu3Dhwvv37wPAmTNnuNsjIiI4HM6AAWOIC3W3bt26fft2QkLC\n1atXvby8Hjx4cPr0aUx1CCGEvg6v2KFuislkqqurv3v3DgB8fHxWrVr1pTuPlZWVioqKLBZr\n5syZV69e9fT03Lp1K41GW7ZsmY+Pz0+WUVRUFB0dPXr06F69ev3koQjGxsYvXrwgXsvJyZWX\nlwPAq1evRowYUV9fT2yfNGnSnTt3fsnpEEII/VHwih3qpigUyv79+4nXa9asCQwM/FJLUVFR\nDQ0NABAREQGAtLQ0AGhtbT1y5MiqVasePXoEAO7u7jt37mxoaMjIyIiJiSkpKcnJydHT07O1\ntf3StT0Gg7Fq1SoNDY1FixYNGDAgKyurw32prKy8e/duY2NjamoqN9UBgJSUFIfDOX78uKmp\nKZHqaDSal5fX5cuXO3wuhBBCfzQOQt0Ydyq7NWvWfKnNu3fv/vrrLwMDAxcXl48fPxYXF4uK\ninL/h/fs2fPJkyfEa1tbW+LFiBEjFi1aRLzesWPHZw/76tUrABAWltDTswAAJyenjnUhNjZW\nSkoKAOTk5NatW9f2u2/hwoU7d+7kvu3bt++ZM2c6dhaEEEKIw+HgIzuoW/vnn38yMjIKCgpG\njhz5pTYBAQEnT54EgNTUVDExMT09vbYLVHz48IH72ZcvXxIvMjMzueFv3759iYmJ6urqVVVV\neXl5LBYrJydHVlaWuPM7YsRccXGZjIyHNBrts2ePiYk5evToiBEjVqxY0fZm8fnz593c3Pz8\n/K5cuVJTUwMA9fX1/fv319TUVFdXX7duXXJy8ty5c4krkSoqKq6uru2OgBBCCP0ofMYO/d4C\nAgL27t0rJSX17NkzQUHBR48eycjI6Orqtra2UqlUBoPx9Y9/dlaRtvT0zJub69++TbKxsRk9\nerSSktLkyZO5oTA1NXXIkCF0Oh0ALly4sGDBAu4H9fX1MzIyLC0tNTQ0zpw5Iyoq+vfff3Nv\nLnOx2eysrCxtbW0ymdyR/iOEEEJt4BU79BvjTvxmbW1Np9MZDIawsDAABAcHOzo6zpgx48WL\nF0wmMyMjo7m5mUKhsNmcqVPd797dS6f/d0mvoaFaQEAAAERERGRkZGRkZJKSkoglvAgZGY+I\nFxEREREREQAwcODA8ePHDx06dOzYsYGBgUSqA4B2IXLWrFk7duyYMmWKs7PzggULhgwZQqVS\nP+2CgIAA/03mghBCiFfwih36jeno6GRnZwPAnDlzAgICvtSsrKwsIiLC0dHx011KSkr37t0b\nOHAgd0t1dXV2dnZ4eHhdXV1AQMCUKVNKSkrCw8M//U7p1avXhQsXTp06JSAgMGPGjIkTJ7Zr\n0NTURIznQAghhLoGBjv0G1u/fv2JEyd27NixZs2az14P46qrq5sxY8bbt28ZDIarq6u5uXlL\nS4uioqK8vPz3nCgrKys4ODgqKurhw4fcjZKSksXFxeLi4j/bDYQQQugXwWCHfm8tLS1CQkJd\ndrqcnJycnJzKykoGgzF48ODBgwd32akRQgihb8JghxBCCCHEJ3CCYoQQQgghPoHBDiGEEEKI\nT2CwQwghhBDiExjsEEIIIYT4BAY7hBBCCCE+gcEOIYQQQohPYLBDCCGEEOITGOwQQgghhPgE\nBjuEEEIIIT6BwQ4hhBBCiE9gsEMIIYQQ4hMY7BBCCCGE+AQGO4QQQgghPoHBDiGEEEKIT2Cw\nQwghhBDiExjsEEIIIYT4BAY7hBBCCCE+gcEOIYQQQohPYLBDCCGEEOITGOwQQgghhPgEBjuE\nEEIIIT6BwQ4hhBBCiE9gsEMIIYQQ4hMY7BBCCCGE+AQGO4QQQgghPoHBDiGEEEKIT2CwQwgh\nhBDiExjsEEIIIYT4BAY7hBBCCCE+gcEOIYQQQohPYLBDCCGEEOITGOwQQgghhPgEBjuEEEII\nIT6BwQ4hhBBCiE9gsEMIIYQQ4hMY7BBCCCGE+AQGO4QQQgghPoHBDiGEEEKIT2CwQwghhBDi\nExjsEEIIIYT4BAY7hBBCCCE+gcEOIYQQQohPYLBDCCGEEOITGOwQQgghhPgEBjuEEEIIIT6B\nwQ4hhBBCiE/8P7ht/H3YkoPnAAAAAElFTkSuQmCC"
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
    "# Sub Region: Far West\n",
    "far_west_map <- plot_usmap(include = .pacific, labels = TRUE, color = 'black', fill = 'blue', alpha = 0.35)\n",
    "\n",
    "# View\n",
    "far_west_map"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "20a400e1",
   "metadata": {
    "papermill": {
     "duration": 0.008438,
     "end_time": "2022-12-20T22:44:44.036170",
     "exception": false,
     "start_time": "2022-12-20T22:44:44.027732",
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
   "duration": 13.134345,
   "end_time": "2022-12-20T22:44:44.166371",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-20T22:44:31.032026",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

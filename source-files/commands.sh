sed -i '/^[[:space:]]*$/d' input.vpl # Delete empty lines

# Remove spaces and tabs at end of lines with Sublime text

sed -i 's/:/\t/' input.vpl
sed -i 's/ /\t/' input.vpl
sed -i 's/  /\t/' input.vpl

sed -i 's/^Gen\t/Genesis\tGe\t1\t/g' input.vpl
sed -i 's/^Exo\t/Exodus\tExo\t2\t/g' input.vpl
sed -i 's/^Lev\t/Leviticus\tLev\t3\t/g' input.vpl
sed -i 's/^Num\t/Numbers\tNum\t4\t/g' input.vpl
sed -i 's/^Deu\t/Deuteronomy\tDeu\t5\t/g' input.vpl
sed -i 's/^Jos\t/Joshua\tJosh\t6\t/g' input.vpl
sed -i 's/^Jdg\t/Judges\tJdgs\t7\t/g' input.vpl
sed -i 's/^Rut\t/Ruth\tRuth\t8\t/g' input.vpl
sed -i 's/^1Sa\t/1 Samuel\t1Sm\t9\t/g' input.vpl
sed -i 's/^2Sa\t/2 Samuel\t2Sm\t10\t/g' input.vpl
sed -i 's/^1Ki\t/1 Kings\t1Ki\t11\t/g' input.vpl
sed -i 's/^2Ki\t/2 Kings\t2Ki\t12\t/g' input.vpl
sed -i 's/^1Ch\t/1 Chronicles\t1Chr\t13\t/g' input.vpl
sed -i 's/^2Ch\t/2 Chronicles\t2Chr\t14\t/g' input.vpl
sed -i 's/^Ezr\t/Ezra\tEzra\t15\t/g' input.vpl
sed -i 's/^Neh\t/Nehemiah\tNeh\t16\t/g' input.vpl
sed -i 's/^Est\t/Esther\tEst\t17\t/g' input.vpl
sed -i 's/^Job\t/Job\tJob\t18\t/g' input.vpl
sed -i 's/^Psa\t/Psalms\tPsa\t19\t/g' input.vpl
sed -i 's/^Pro\t/Proverbs\tPrv\t20\t/g' input.vpl
sed -i 's/^Ecc\t/Ecclesiastes\tEccl\t21\t/g' input.vpl
sed -i 's/^Sol\t/Song of Solomon\tSSol\t22\t/g' input.vpl
sed -i 's/^Isa\t/Isaiah\tIsa\t23\t/g' input.vpl
sed -i 's/^Jer\t/Jeremiah\tJer\t24\t/g' input.vpl
sed -i 's/^Lam\t/Lamentations\tLam\t25\t/g' input.vpl
sed -i 's/^Eze\t/Ezekiel\tEze\t26\t/g' input.vpl
sed -i 's/^Dan\t/Daniel\tDan\t27\t/g' input.vpl
sed -i 's/^Hos\t/Hosea\tHos\t28\t/g' input.vpl
sed -i 's/^Joe\t/Joel\tJoel\t29\t/g' input.vpl
sed -i 's/^Amo\t/Amos\tAmos\t30\t/g' input.vpl
sed -i 's/^Oba\t/Obadiah\tObad\t31\t/g' input.vpl
sed -i 's/^Jon\t/Jonah\tJonah\t32\t/g' input.vpl
sed -i 's/^Mic\t/Micah\tMic\t33\t/g' input.vpl
sed -i 's/^Nah\t/Nahum\tNahum\t34\t/g' input.vpl
sed -i 's/^Hab\t/Habakkuk\tHab\t35\t/g' input.vpl
sed -i 's/^Zep\t/Zephaniah\tZep\t36\t/g' input.vpl
sed -i 's/^Hag\t/Haggai\tHag\t37\t/g' input.vpl
sed -i 's/^Zec\t/Zechariah\tZec\t38\t/g' input.vpl
sed -i 's/^Mal\t/Malachi\tMal\t39\t/g' input.vpl
sed -i 's/^Mat\t/Matthew\tMat\t40\t/g' input.vpl
sed -i 's/^Mar\t/Mark\tMark\t41\t/g' input.vpl
sed -i 's/^Luk\t/Luke\tLuke\t42\t/g' input.vpl
sed -i 's/^Joh\t/John\tJohn\t43\t/g' input.vpl
sed -i 's/^Act\t/The Acts\tActs\t44\t/g' input.vpl
sed -i 's/^Rom\t/Romans\tRom\t45\t/g' input.vpl
sed -i 's/^1Co\t/1 Corinthians\t1Cor\t46\t/g' input.vpl
sed -i 's/^2Co\t/2 Corinthians\t2Cor\t47\t/g' input.vpl
sed -i 's/^Gal\t/Galatians\tGal\t48\t/g' input.vpl
sed -i 's/^Eph\t/Ephesians\tEph\t49\t/g' input.vpl
sed -i 's/^Phi\t/Philippians\tPhi\t50\t/g' input.vpl
sed -i 's/^Col\t/Colossians\tCol\t51\t/g' input.vpl
sed -i 's/^1Th\t/1 Thessalonians\t1Th\t52\t/g' input.vpl
sed -i 's/^2Th\t/2 Thessalonians\t2Th\t53\t/g' input.vpl
sed -i 's/^1Ti\t/1 Timothy\t1Tim\t54\t/g' input.vpl
sed -i 's/^2Ti\t/2 Timothy\t2Tim\t55\t/g' input.vpl
sed -i 's/^Tit\t/Titus\tTitus\t56\t/g' input.vpl
sed -i 's/^Phm\t/Philemon\tPhmn\t57\t/g' input.vpl
sed -i 's/^Heb\t/Hebrews\tHeb\t58\t/g' input.vpl
sed -i 's/^Jam\t/James\tJas\t59\t/g' input.vpl
sed -i 's/^1Pe\t/1 Peter\t1Pet\t60\t/g' input.vpl
sed -i 's/^2Pe\t/2 Peter\t2Pet\t61\t/g' input.vpl
sed -i 's/^1Jo\t/1 John\t1Jn\t62\t/g' input.vpl
sed -i 's/^2Jo\t/2 John\t2Jn\t63\t/g' input.vpl
sed -i 's/^3Jo\t/3 John\t3Jn\t64\t/g' input.vpl
sed -i 's/^Jud\t/Jude\tJude\t65\t/g' input.vpl
sed -i 's/^Rev\t/Revelation\tRev\t66\t/g' input.vpl

sed -i 's/ -/-/g' input.vpl
sed -i 's/ ;/;/g' input.vpl
sed -i 's/"/“/g' input.vpl
sed -i "s/'/’/g" input.vpl
sed -i 's/  / /g' input.vpl

# Correct first line

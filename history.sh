 git fetch upstream
    2  git checkout eval_p2_1_g2
    3  git push -u origin eval_p2_1_g2
    4  history
    5  cd kepler
    6  cd evaluation
    7  cd kepler
    8  ls -l
    9  mv docs registros
   10  ls -l
   11  mkdir plantillas
   12  git add .
   13  git commit -m "Fix problem 1: directory structure corrected"
   14  ls
   15  ls registros
   16  mv sensores.log registros/
   17  ls registros
   18  mv ajustes.old ajustes.conf
   19  ls
   20  ls registros
   21  git add .
   22  git commit -m "Fix problem 2: files moved and renamed"
   23  chmod 600 registros/sensores.log
   24  ls -l registros/sensores.log
   25  git .
   26  git add .
   27  git commit -m "Fix problem 3:"numeric permissions 600 in sensores.log"
   28  git commit -m "Fix problem 3: numeric permissions 600 in sensores.log"
   29  history
     30  chmod u+x runner.sh
   31  chmod o-w ajustes.conf
   32  ls -l runner.sh
   33  ls -l ajustes.conf
   34  git add .
   35  git commit -m "Fix problem 4: symbolic permissions corrected"
   36  history
    37  ls -l runner.sh
   38  chmod u+s runner.sh
   39  ls -l runner.sh
   40  git add .
   41  git commit -m "Fix problem 5: SUID acive on runner.sh"
   42  git add .
   43  git status
   44  git add ../../history.sh
   45  history
@TownECreator ➜ /w
 47  git commit -m "Fix problem 5: SUID acive on runner.sh"
   48  ls -ld /tmp/kepler_zone
   49  mkdir /temp/kepler_zone
   50  mkdir /tmp/kepler_zone
   51  chmod +t /tmp/kepler_zone
   52  ls -ld /tmp/kepler_zone
   53  chmod o+x /tmp/kepler_zone
   54  ls -ld /tmp/kepler_zone
   55  history
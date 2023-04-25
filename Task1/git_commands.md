git clone https://github.com/GeorgyPzk/ExadelRep1.git

3 git add . git commit -m '' git push

4 git breanch dev git checkout dev git add . git commit -m ''  
  git push

5 git branch georgy-new_feature git checkout georgy-new_feature

6 git add . git commit -m '' git push

7 git status

8 git add -f .gitignore

10

11

12 git revert 4945db2

13 git log > log.txt

14 git branch -a
   git checkout dev
   git branch -D georgy-new_feature
   git push origin -d georgy-new_feature
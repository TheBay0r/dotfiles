function cbranch --description "Function to delete all local git branches, except current and master"
    git branch | grep -v "\*" | grep -v master | xargs -n1 git branch -D
end
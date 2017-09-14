function makepr
  if [ ! (git rev-parse --is-inside-work-tree 2>/dev/null) ]
    echo "Not a git repository"
    return
  end

  set to_branch $1
  if [ -z $to_branch ]
    set to_branch "master"
  end

  # try the upstream branch if possible otherwise origin will do
  set upstream (git config --get remote.upstream.url)
  set origin (git config --get remote.origin.url)
  if [ -z $upstream ]
    set upstream $origin
  end

  set to_user (echo $upstream | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  set from_user (echo $origin | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  set repo (basename (git rev-parse --show-toplevel))
  set from_branch (git rev-parse --abbrev-ref HEAD)
  open "https://github.com/$to_user/$repo/pull/new/$to_user:$to_branch...$from_user:$from_branch"
end

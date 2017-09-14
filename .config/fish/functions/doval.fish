function doval --description "Function to add DOCKER_HOST for specific docker-machine"
  eval (docker-machine env $argv[1])
end

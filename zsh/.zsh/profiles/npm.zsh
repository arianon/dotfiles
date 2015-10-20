PREFIX='~/.npm-pkgs'

if [[ ! -d $PREFIX ]] mkdir -p $PREFIX

npm config set prefix $PREFIX
export PATH=$PREFIX/bin:$PATH

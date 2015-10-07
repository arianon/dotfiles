function cdt --description 'Move to a temporary directory.'
    builtin cd (mktemp -d)
    builtin pwd
end

cleanup() {
    for dir in "$1"/*; do
        if [ -d "$dir" ]; then
            # skip src, .git
            if [[ "$dir" != */src && "$dir" != */.git ]]; then
                # deleting target, build, node_modules
                if [[ "$dir" == */target || "$dir" == */build || "$dir" == */node_modules ]]; then
                    echo "Deleting: $dir"
                    rm -rf "$dir"
                else
                    cleanup "$dir"
                fi
            fi
        fi
    done
}

cleanup "$(pwd)"

echo "Finished"
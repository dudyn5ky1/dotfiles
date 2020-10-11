echo -n $(date +"%T") | sha256sum | tr -d "[:space:]-" | pbcopy

#!/bin/bash

# Check if the .git/hooks/pre-commit already exists
if [ -f ".git/hooks/pre-commit" ]; then
    echo "A pre-commit hook already exists. Overwrite? (y/n)"
    read -r response
    if [ "$response" != "y" ]; then
        echo "Installation aborted."
        exit 1
    fi
fi

# Create the pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh

cd blocker-rules
cat *.txt > all.txt
git add all.txt
cd -
EOF

# Make the pre-commit hook executable
chmod +x .git/hooks/pre-commit

echo "Pre-commit hook installed successfully."

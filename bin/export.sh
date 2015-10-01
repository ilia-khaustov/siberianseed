#!/bin/sh

# Copies built packages from 'src' to 'share'.

# Tip: Automate verification of packages. Verification != testing.
# Testing is done by package developers. Verification is done by package users.
# Package may pass unit testing and still fail to work as you expected.
# Specify your requirements in verification script instead of
# repeating manual checking again and again with every mismatch found.

echo "Exporting $root";
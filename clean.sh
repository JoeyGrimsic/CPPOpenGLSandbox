#!/bin/bash
echo "Cleaning build directories..."
rm -rf build
rm -rf bin
rm -rf obj
rm -rf *.make
rm -rf Makefile
rm -rf compile_commands
echo "Done."

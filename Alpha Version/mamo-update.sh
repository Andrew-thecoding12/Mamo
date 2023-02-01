#!/bin/bash

function install()
{
    echo "Checking available repository and mirror..."
    repo_list=( 
    "repo.klauster.com Ok!" 
    "ppe:launcher.com Ok!"
    "reps.loader.com Ok!" )
    mirror_list=(
    "misc.molder.jp"
    "mirr.lister.co.uk" 
    "mirror.domainers.com Ok!" )
    echo "Available repository: ${repo_list[@]}"
    echo "Available mirror: ${mirror_list[@]}"

    echo "Installing package..."
    for (( i=0; i<=100; i++ ))
    do
        sleep 1
        echo -n "["
        for (( j=0; j<i/5; j++ ))
        do
            echo -n "#"
        done
        for (( j=i/5; j<20; j++ ))
        do
            echo -n "-"
        done
        echo -n "] $i%" \\r
    done
    echo
    echo "Package successfully installed!"
}

function remove()
{
    echo "Removing package..."
    for (( i=0; i<=100; i++ ))
    do
        sleep 1
        echo -n "["
        for (( j=0; j<i/5; j++ ))
        do
            echo -n "#"
        done
        for (( j=i/5; j<20; j++ ))
        do
            echo -n "-"
        done
        echo -n "] $i%" \\r
    done
    echo
    echo "Package successfully removed!"
}

function about {
    echo "This is a Package Manager simulation and Not like APT!"
    echo "(:Mamo v0.91 Alpha:)"
    echo "made by love @Andrew-thecoding12"
}

function add_repo {
    echo "Adding repository: $1"
    repos+=($1)
}

function remove_repo {
    echo "Removing repository: $1"
    repos=( "${repos[@]/$1}" )
}

repo_list() {
    echo "Fetching available repositories..."
    sleep 2
    echo "List of available repositories: "
    sleep 5
    echo "1. repo.ppe.launcher Bad!"
    sleep 2
    echo "2. repo.ppe.strict Ok!"
    sleep 2
    echo "3. repo.ppe.community Ok!"
    sleep 2
    # Add more repositories as needed
    echo "That's all repository was checked!"
    sleep 3
    echo "rechecking again please wait!"
    #this will check again the available repository 
}


function add_mirror {
    echo "Adding mirror: $1"
    mirrors+=($1)
}

function remove_mirror {
    echo "Removing mirror: $1"
    mirrors=( "${mirrors[@]/$1}" )
}

function mirror_list() {
    echo "Fetching available mirrors..."
    sleep 2
    echo "List of available mirrors: "
    sleep 5
    echo "1. mirror1.packages.com Bad!"
    sleep 3
    echo "2. flutter.stacks.com Ok!"
    sleep 3
    echo "3. domain.dubfile.com Ok!"
    sleep 3
    # Add more mirrors as needed
}

if [ "$1" == "install" ]; then
    install "$1"
elif [ "$1" == "about" ]; then
    about
elif [ "$1" == "add" ]; then
    if [ "$2" == "--repo" ]; then
        add_repo "$3"
    elif [ "$2" == "--mirror" ]; then
        add_mirror "$3"
    else
        echo "Invalid option. Available options: --repo, --mirror"
    fi
elif [ "$1" == "remove" ]; then
    if [ "$2" == "--repo" ]; then
        remove_repo "$3"
    elif [ "$2" == "--mirror" ]; then
        remove_mirror "$3"
    else
        echo "Invalid option. Available options: --repo, --mirror"
    fi
elif [ "$1" == "repo_list" ]; then
    repo_list
elif [ "$1" == "mirror_list" ]; then
    mirror_list
else
    echo "Available commands: install, about, add, remove, repo_list, mirror_list"
fi

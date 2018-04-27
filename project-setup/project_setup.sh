#!/usr/bin/env bash

programName=$0

source_iphone_6s=iphone_6s
source_iphone_6s_plus=iphone_6s_plus
source_iphone_7=iphone_7
source_mavic_pro=mavic_pro
source_camera=camera

function setupProjectFolder() {
    if [ -d "$PROJECT_NAME" ]; then
        echo "Directory with name ${PROJECT_NAME} already exists! Make sure to provide some unique name."
        exit 1
    fi

    mkdir ${PROJECT_NAME}
}

function setupShootingDaysFoldersForSource() {
    day_index=1
    source_name=$1

    mkdir ${PROJECT_NAME}/footage/${source_name}

    while [ ${day_index} -le ${NUMBER_OF_DAYS} ]
    do
        mkdir ${PROJECT_NAME}/footage/${source_name}/day_${day_index}
        mkdir ${PROJECT_NAME}/footage/${source_name}/day_${day_index}/pics
        mkdir ${PROJECT_NAME}/footage/${source_name}/day_${day_index}/vids
        day_index=$((${day_index}+1))
    done
}

function setupFootageFolder() {
    mkdir ${PROJECT_NAME}/footage

    setupShootingDaysFoldersForSource ${source_iphone_6s}
    setupShootingDaysFoldersForSource ${source_iphone_6s_plus}
    setupShootingDaysFoldersForSource ${source_iphone_7}
    setupShootingDaysFoldersForSource ${source_camera}
    setupShootingDaysFoldersForSource ${source_mavic_pro}
}

function setupMusicFolder() {
    mkdir ${PROJECT_NAME}/music

    mkdir ${PROJECT_NAME}/music/sfx
    mkdir ${PROJECT_NAME}/music/songs
}

function setupGraphicsFolder() {
    mkdir ${PROJECT_NAME}/graphics
}

function setupRendersFolder() {
    mkdir ${PROJECT_NAME}/renders
}

function setupProjectFilesFolder() {
    mkdir ${PROJECT_NAME}/project_files
}

function usage {
    echo "Script used to setup a folder structure for your everyday vlogging needs!"
    echo ""
    echo "Usage: $programName -n=PROJECT_NAME -d=NUMBER_OF_DAYS"
    echo "	-h, --help             display this help and exit"
    echo "	-n, --project-name     name of the project folder (e.g. 2018-03-25-slieve_foye)"
    echo "	-d, --number-of-days   number of days the shooting took (defaults to 5)"
    echo ""
}

function areArgumentsValid {
    areArgsValid=0

    if [ -z "${PROJECT_NAME}" ]; then
        echo "Invalid argument: The name of the project must be provided in order to run this script!"
        areArgsValid=1
    fi

    if [ -z "${NUMBER_OF_DAYS}" ]; then
        NUMBER_OF_DAYS=5
    fi

    return ${areArgsValid}
}

for i in "$@"
    do
        case ${i} in
            -h|--help)
                usage
                exit 0
                ;;
            -n=*|--project-name=*)
                PROJECT_NAME="${i#*=}"
                shift
                ;;
            -d=*|--number-of-days=*)
                NUMBER_OF_DAYS="${i#*=}"
                shift
                ;;
            *)
                # unknown option
                echo "$programName: unrecognized option '$i'"
                echo "Try '$programName --help' for more information."
                exit 1
            ;;
esac
done

if areArgumentsValid; then
    setupProjectFolder
    setupFootageFolder
    setupGraphicsFolder
    setupMusicFolder
    setupRendersFolder
    setupProjectFilesFolder
else
    echo ""
    echo "Try '$programName --help' for more information."
    exit 1
fi